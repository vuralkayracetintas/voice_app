part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterUserMailChanged extends RegisterEvent {
  final String userMail;

  const RegisterUserMailChanged(this.userMail);
  @override
  List<Object?> get props => [userMail];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String userPassword;

  const RegisterPasswordChanged(this.userPassword);
  @override
  List<Object?> get props => [userPassword];
}

class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
