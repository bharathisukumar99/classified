// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

class PostState {
  String location;
  String type;
  String title;
  List<XFile> imageList;
  Seller seller;
  SaleType saletype;
  FetchStatus status;
  PostState({
    this.location = '',
    this.type = '',
    this.title = '',
    required this.imageList,
    this.seller = Seller.landlord,
    this.saletype = SaleType.resident,
     this.status = FetchStatus.defaultState,
  });

  PostState copyWith({
    String? location,
    String? type,
    String? title,
    List<XFile>? imageList,
    Seller? seller,
    SaleType? saletype,
    FetchStatus? status,
  }) {
    return PostState(
      location: location ?? this.location,
      type: type ?? this.type,
      title: title ?? this.title,
      imageList: imageList ?? this.imageList,
      seller: seller ?? this.seller,
      saletype: saletype ?? this.saletype,
      status: status ?? this.status,
    );
  }
}

