import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: FetchStatus.initial));
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.username,
          password: event.password,
        );
         
        print('uid ${credential.user!.uid}');
        emit(state.copyWith(status: FetchStatus.success, responseCode: 200));
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(status: FetchStatus.failure));
        if (e.code == 'weak-password') {
          emit(state.copyWith(responseCode: 400));
        } else if (e.code == 'email-already-in-use') {
          emit(state.copyWith(responseCode: 401));
        }
      } catch (e) {
        emit(state.copyWith(status: FetchStatus.failure, responseCode: 402));
      }
      emit(state.copyWith(status: FetchStatus.defaultState, responseCode: 0));
    });
     on<SignOut>((event, emit) async {
       await FirebaseAuth.instance.signOut();
       emit(state.copyWith(responseCode: 403));
       emit(state.copyWith(responseCode: 0));
     });
  }
}
