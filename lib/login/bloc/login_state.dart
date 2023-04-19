// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState {
    FetchStatus status;
    int responseCode;
  LoginState({
    this.status = FetchStatus.defaultState,
    this.responseCode = 0,
  });

  LoginState copyWith({
    FetchStatus? status,
    int? responseCode,
  }) {
    return LoginState(
      status: status ?? this.status,
      responseCode: responseCode ?? this.responseCode,
    );
  }
  }

 
