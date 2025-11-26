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

class SpecialRecommend {
  String id;
  String title;
  List<SpecialSubType> subTypes;

  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommend.fromJSON(Map<String, dynamic> json) {
    final id = (json['id'] ?? '').toString();
    final title = (json['title'] ?? '').toString();
    final rawSubs = json['subTypes'];
    List<SpecialSubType> subTypes = [];
    if (rawSubs is List) {
      subTypes = rawSubs
          .where((e) => e is Map<String, dynamic>)
          .map((e) => SpecialSubType.fromJSON(e as Map<String, dynamic>))
          .toList();
    }
    return SpecialRecommend(id: id, title: title, subTypes: subTypes);
  }

  get children => null;
}

class SpecialSubType {
  String id;
  String title;
  GoodsItemsPage goodsItems;

  SpecialSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SpecialSubType.fromJSON(Map<String, dynamic> json) {
    final id = (json['id'] ?? '').toString();
    final title = (json['title'] ?? '').toString();
    final itemsJson =
        json['goodsItems'] as Map<String, dynamic>? ?? <String, dynamic>{};
    return SpecialSubType(
      id: id,
      title: title,
      goodsItems: GoodsItemsPage.fromJSON(itemsJson),
    );
  }
}

class GoodsItemsPage {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItemsPage({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItemsPage.fromJSON(Map<String, dynamic> json) {
    int parseInt(dynamic v) =>
        v is int ? v : int.tryParse((v ?? '').toString()) ?? 0;
    final counts = parseInt(json['counts']);
    final pageSize = parseInt(json['pageSize']);
    final pages = parseInt(json['pages']);
    final page = parseInt(json['page']);
    final rawItems = json['items'];
    List<GoodsItem> items = [];
    if (rawItems is List) {
      items = rawItems
          .where((e) => e is Map<String, dynamic>)
          .map((e) => GoodsItem.fromJSON(e as Map<String, dynamic>))
          .toList();
    }
    return GoodsItemsPage(
      counts: counts,
      pageSize: pageSize,
      pages: pages,
      page: page,
      items: items,
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    final id = (json['id'] ?? '').toString();
    final name = (json['name'] ?? '').toString();
    final desc = json['desc'] == null ? null : (json['desc']).toString();
    final price = (json['price'] ?? '').toString();
    final picture = (json['picture'] ?? '').toString();
    final orderNum = json['orderNum'] is int
        ? json['orderNum'] as int
        : int.tryParse((json['orderNum'] ?? '').toString()) ?? 0;
    return GoodsItem(
      id: id,
      name: name,
      desc: desc,
      price: price,
      picture: picture,
      orderNum: orderNum,
    );
  }
}
