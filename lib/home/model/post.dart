class Post {
    Post({
        required this.uid,
        required this.id,
        required this.type,
        required this.location,
        required this.title,
        required this.phone,
        required this.price,
        required this.description,
        required this.size,
        required this.seller,
        required this.propertyType,
        required this.images,
    });

    String uid;
    String id;
    String type;
    String location;
    String title;
    int phone;
    int price;
    String description;
    int size;
    String seller;
    String propertyType;
    List<String> images;

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        uid: json["uid"],
        id: json["id"],
        type: json["type"],
        location: json["location"],
        title: json["title"],
        phone: json["phone"],
        price: json["price"],
        description: json["description"],
        size: json["size"],
        seller: json["seller"],
        propertyType: json["propertyType"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "uid": uid,
        "id": id,
        "type": type,
        "location": location,
        "title": title,
        "phone": phone,
        "price": price,
        "description": description,
        "size": size,
        "seller": seller,
        "propertyType": propertyType,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
