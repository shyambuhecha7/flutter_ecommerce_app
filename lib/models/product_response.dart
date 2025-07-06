
List<ProductResponse> parseProductList(dynamic jsonList) {
  return List<ProductResponse>.from(
    jsonList.map((x) => ProductResponse.fromJson(x)),
  );
}


class ProductResponse {
  ProductResponse({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    this.isFav,
  });

  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final String? description;
  final Category? category;
  final List<String> images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  bool?
  isFav = false;

  factory ProductResponse.fromJson(Map<String, dynamic> json){
    return ProductResponse(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      price: json["price"],
      description: json["description"],
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      isFav: false
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "price": price,
    "description": description,
    "category": category?.toJson(),
    "images": images.map((x) => x).toList(),
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $title, $slug, $price, $description, $category, $images, $creationAt, $updatedAt, ";
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      image: json["image"],
      creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $name, $slug, $image, $creationAt, $updatedAt, ";
  }
}


