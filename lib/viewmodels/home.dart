class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  // 扩展一个工厂构造函数，一般用 factory 关键字来声明, 一般用来创建实例对象
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    final id = (json["id"] ?? "").toString();
    final url = (json["imageUrl"] ?? json["imgUrl"] ?? json["imgUrl1"] ?? "").toString();
    return BannerItem(id: id, imageUrl: url);
  }
}
