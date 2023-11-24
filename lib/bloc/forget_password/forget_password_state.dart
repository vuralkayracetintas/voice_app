part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  const ForgetPasswordSuccess();

  @override
  List<Object> get props => [];
}

class ForgetPasswordError extends ForgetPasswordState {
  final String errorMessage;

  const ForgetPasswordError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
