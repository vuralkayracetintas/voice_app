part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUserMailChanged extends LoginEvent {
  final String userMail;

  const LoginUserMailChanged(this.userMail);
  @override
  List<Object?> get props => [userMail];
}

class LoginPasswordChanged extends LoginEvent {
  final String userPassword;

  const LoginPasswordChanged(this.userPassword);
  @override
  List<Object?> get props => [userPassword];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}
