import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:classified/enums.dart';
import 'package:classified/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../model/post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchPost>((event, emit) async {
      emit(state.copyWith(status: FetchStatus.initial));
      FirebaseFirestore db = FirebaseFirestore.instance;
      await db.collection("posts").get().then(
        (querySnapshot) {
          var uid = FirebaseAuth.instance.currentUser?.uid;
          List<Post> posts = List<Post>.from(
                  querySnapshot.docs.map((x) => Post.fromMap(x.data())))
              .where((element) => element.uid != uid)
              .toList();
          emit(state.copyWith(status: FetchStatus.success, posts: posts));
        },
        onError: (e) => emit(state.copyWith(status: FetchStatus.failure)),
      );
      emit(state.copyWith(status: FetchStatus.defaultState));
    });
    on<Logout>((event, emit) async {
     emit(state.copyWith(status: FetchStatus.initial));
      await FirebaseAuth.instance.signOut();
       emit(state.copyWith(code: 1));
      emit(
        state.copyWith(status: FetchStatus.defaultState, code: 0),
      );
    });
  }
}
