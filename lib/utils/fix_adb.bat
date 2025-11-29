@echo off
:: 停止可能的 Android 服务
sc stop "adb" 2>nul
sc stop "Android Device Manager" 2>nul
sc stop "Huawei HiSuite" 2>nul
sc stop "Xiaomi ADB Service" 2>nul

:: 杀掉所有 adb 进程
taskkill /F /IM adb.exe 2>nul

:: 等待 1 秒，确保端口释放
timeout /t 1 /nobreak >nul

:: 检查 5037 端口是否被占用
for /f "tokens=5" %%a in ('netstat -aon ^| findstr 5037 ^| findstr LISTENING') do (
    echo Found adb process on 5037, killing PID %%a
    taskkill /F /PID %%a
)

:: 再次确认端口是否释放
netstat -aon | findstr 5037

echo ===============================
echo 所有 adb 已被杀掉，5037 端口应该空闲
echo ===============================
pause
