// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class RegisterEvent extends LoginEvent {
    String username;
    String password;
  RegisterEvent({
    required this.username,
    required this.password,
  });
}
class LoginInitiateEvent extends LoginEvent {
    String username;
    String password;
  LoginInitiateEvent({
    required this.username,
    required this.password,
  });
}
class SignOut extends LoginEvent{}
