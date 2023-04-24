// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

class PostState {
  String location;
  String type;
  String title;
  List<XFile> imageList;
  PostState({
    this.location = '',
    this.type = '',
    this.title = '',
    required this.imageList,
  });

  PostState copyWith({
    String? location,
    String? type,
    String? title,
    List<XFile>? imageList,
  }) {
    return PostState(
      location: location ?? this.location,
      type: type ?? this.type,
      title: title ?? this.title,
      imageList: imageList ?? this.imageList,
    );
  }
}

