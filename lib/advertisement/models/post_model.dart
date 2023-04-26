 
 

class PostModel {
  String type;
  String location;
  String title;
  List<String> imageUrls;
  int phoneNumber;
  int price;
  String description;
  int size;
  String seller;
  String propertyType;

  PostModel({
    required this.type,
    required this.location,
    required this.title,
    required this.imageUrls,
    required this.phoneNumber,
    required this.price,
    required this.description,
    required this.size,
    required this.seller,
    required this.propertyType,
  });
}
