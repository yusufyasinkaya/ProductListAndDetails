
class DataRes{
   List<Product>? products;
  DataRes( {  this.products});

  factory DataRes.fromJson(Map<String,dynamic> json) => DataRes(
    products:  (json["products"] as List).map((x) => Product.fromJson(x)).toList(),
    
    );
}

class Product {
  int? id;
  int? price;
  String? title;
  String? description;
  double? discountPercentage;
  double? rating;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  Product(this.id,this.price,this.title,this.description,this.discountPercentage,this.rating,this.brand,this.category,this.thumbnail,this.images);
  Product.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    rating = double.tryParse(json["rating"].toString());
    discountPercentage = double.tryParse(json["discountPercentage"].toString());
    price = int.tryParse(json["price"].toString());
     brand = json["brand"];
      category = json["category"];
       thumbnail = json["thumbnail"];
      images = List<String>.from(json["images"].map((x) => x));

    
  }
  Map toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "rating": rating,
      "discountPercentage": discountPercentage,
      "price": price,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "images": List<dynamic>.from(images!.map((x) => x)),
    };
  }
}
