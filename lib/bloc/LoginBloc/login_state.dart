part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.userMail = '',
    this.userPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? userMail,
    String? userPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      userMail: userMail ?? this.userMail,
      userPassword: userPassword ?? this.userPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  final String userMail;
  final String userPassword;
  bool get isValidPassword => userPassword.length > 6;

  final FormSubmissionStatus formStatus;

  @override
  List<Object> get props => [userMail, userPassword, formStatus];
}
