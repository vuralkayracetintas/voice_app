part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.userMail = '',
    this.userPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  final String userMail;

  bool get isValidMail => userMail.contains('@');

  final String userPassword;
  bool get isValidPassword => userPassword.length > 6;

  final FormSubmissionStatus formStatus;
  @override
  List<Object> get props => [];

  RegisterState copyWith({
    String? userMail,
    String? userPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterState(
      userMail: userMail ?? this.userMail,
      userPassword: userPassword ?? this.userPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
