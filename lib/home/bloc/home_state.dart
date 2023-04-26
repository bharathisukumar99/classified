// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
    FetchStatus status;
    List<Post> posts;
    int code;
  HomeState({
    this.status = FetchStatus.defaultState,
    this.posts = const[],
   this.code = 0,
  });


  HomeState copyWith({
    FetchStatus? status,
    List<Post>? posts,
    int? code,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      code: code ?? this.code,
    );
  }
 }

 
