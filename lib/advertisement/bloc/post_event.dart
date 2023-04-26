// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}


class SelectLocationEvent extends PostEvent {
  String location;
  SelectLocationEvent({
    required this.location,
  });
   
}

class SelectTypeEvent extends PostEvent {
  String type;
  SelectTypeEvent({
    required this.type,
  });
   
}
class TitleEvent extends PostEvent {
  String title;
  TitleEvent({
    required this.title,
  });
}
class UploadImageEvent extends PostEvent {
  String type;
  UploadImageEvent({
    required this.type,
  });
}

class SellerSelectionEvent extends PostEvent {
  Seller seller;
  SellerSelectionEvent({
    required this.seller,
  });
}
class SellerTypeSelectionEvent extends PostEvent {
  SaleType seller;
  SellerTypeSelectionEvent({
    required this.seller,
  });
}
