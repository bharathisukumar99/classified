// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

class PostState {
  String location;
  String type;
  String title;
  List<XFile> imageList;
  Seller seller;
  SaleType saletype;
  PostState({
    this.location = '',
    this.type = '',
    this.title = '',
    required this.imageList,
    this.seller = Seller.agent,
    this.saletype = SaleType.resident,
  });

  PostState copyWith({
    String? location,
    String? type,
    String? title,
    List<XFile>? imageList,
    Seller? seller,
    SaleType? saletype,
  }) {
    return PostState(
      location: location ?? this.location,
      type: type ?? this.type,
      title: title ?? this.title,
      imageList: imageList ?? this.imageList,
      seller: seller ?? this.seller,
      saletype: saletype ?? this.saletype,
    );
  }
}

