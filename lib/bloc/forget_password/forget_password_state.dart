part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  ForgetPasswordState({this.formStatus = const InitialFormStatus()});

  FormSubmissionStatus? formStatus;

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  ForgetPasswordSuccess();

  @override
  List<Object> get props => [];
}

class ForgetPasswordError extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
