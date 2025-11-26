class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  // 扩展一个工厂构造函数，一般用 factory 关键字来声明, 一般用来创建实例对象
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    final id = (json["id"] ?? "").toString();
    final url = (json["imageUrl"] ?? json["imgUrl"] ?? json["imgUrl1"] ?? "")
        .toString();
    return BannerItem(id: id, imageUrl: url);
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    final id = (json['id'] ?? '').toString();
    final name = (json['name'] ?? '').toString();
    final picture = (json['picture'] ?? '')
        .toString()
        .replaceAll('`', '')
        .trim();
    final rawChildren = json['children'];
    List<CategoryItem> children = [];
    if (rawChildren is List) {
      children = rawChildren
          .where((e) => e is Map<String, dynamic>)
          .map((e) => CategoryItem.fromJSON(e as Map<String, dynamic>))
          .toList();
    }
    return CategoryItem(
      id: id,
      name: name,
      picture: picture,
      children: children,
    );
  }
}

// 根据JSON编写class和工厂函数
