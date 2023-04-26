import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 

import '../../enums.dart';
import '../models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState(imageList: [])) {
    on<SelectLocationEvent>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
    on<SelectTypeEvent>((event, emit) {
      emit(state.copyWith(type: event.type));
    });
    on<TitleEvent>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<UploadImageEvent>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      if (event.type == 'M') {
        final List<XFile> pickedFileList = await picker.pickMultiImage();
        if (pickedFileList.isNotEmpty) {
          emit(state.copyWith(
              imageList: state.imageList..addAll(pickedFileList)));
        }
      } else {
        final XFile? photo = await picker.pickImage(source: ImageSource.camera);
        if (photo != null) {
          emit(state.copyWith(imageList: state.imageList..add(photo)));
        }
      }
    });
    on<SellerSelectionEvent>((event, emit) {
      emit(state.copyWith(seller: event.seller));
    });
    on<SellerTypeSelectionEvent>((event, emit) {
      emit(state.copyWith(saletype: event.seller));
    });

    on<PostData>((event, emit) async {
      emit(state.copyWith(status: FetchStatus.initial,title: event.postModel.title));
      final firebase = FirebaseStorage.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      String myId = db.collection("posts").doc().id;
      List<String> arr = [];
      var id;
      for (int i = 0; i < state.imageList.length; i++) {
        var snapshot = await firebase
            .ref()
            .child('$myId-$i')
            .putFile(File(state.imageList[i].path));
        var downloadUrl = await snapshot.ref.getDownloadURL();
        arr.add(downloadUrl);
      }
      var uid = FirebaseAuth.instance.currentUser?.uid;
      final data = {
        "uid": uid,
        "id": myId,
        "type": state.type,
        "location": state.location,
        "title": event.postModel.title,
        "phone": event.postModel.phoneNumber,
        "price": event.postModel.price,
        "description": event.postModel.description,
        "size": event.postModel.size,
        "seller": event.postModel.seller,
        "propertyType": event.postModel.propertyType,
        "images": arr
      };
      try {
        db.collection("posts").doc(myId).set(data);
        emit(state.copyWith(status: FetchStatus.success));
      } catch (e) {
        emit(state.copyWith(status: FetchStatus.failure));
      }
      
      emit(state.copyWith(
        location: '',
        type: '',
        title: '',
        seller: Seller.landlord,
        imageList: [],
        saletype: SaleType.resident,
        status: FetchStatus.defaultState));
    });
  }
}
