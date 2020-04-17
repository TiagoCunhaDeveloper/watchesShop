class Product {
    String id;
    String name;
    String description;
    String price;
    String imgUrlColorOne;
    String imgUrlColorTwo;
    DateTime createdAt;
    int v;

    Product({
        this.id,
        this.name,
        this.description,
        this.price,
        this.imgUrlColorOne,
        this.imgUrlColorTwo,
        this.createdAt,
        this.v,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        imgUrlColorOne: json["imgUrlColorOne"],
        imgUrlColorTwo: json["imgUrlColorTwo"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );
}