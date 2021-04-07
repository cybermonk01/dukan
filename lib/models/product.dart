class Product{
  int id;
  String name,
      description,
      shortDescription,
      sku,
      price,
      regularPrice,
      salesPrice,
      stockStatus;
  List<Images> images;
  List<Categories> categories;

  Product(
      {this.id,
      this.categories,
      this.description,
      this.images,
      this.name,
      this.price,
      this.regularPrice,
      this.salesPrice,
      this.shortDescription,
      this.sku,
      this.stockStatus});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regularPrice'];
    salesPrice = json['salesPrice'];

    stockStatus = json['stock_status'];
    if (json['categories'] != null) {
      // ignore: deprecated_member_use
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      // ignore: deprecated_member_use
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }
}

class Categories {
  int id;
  String name;
  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  String src;
  Images({this.src});

  Images.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}
