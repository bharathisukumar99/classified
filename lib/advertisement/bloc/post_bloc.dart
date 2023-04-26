import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../enums.dart';

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
  }
}
