import 'package:equatable/equatable.dart';
import 'package:voice_app/bloc/form_submission_status.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.userMail = '',
    this.userPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  final String userMail;
  bool get isValiduserMail => userMail.length > 3;

  final String userPassword;
  bool get isValiduserPassword => userPassword.length > 6;

  final FormSubmissionStatus formStatus;

  RegisterState copyWith(
      {String? userMail,
      String? userPassword,
      FormSubmissionStatus? formStatus}) {
    return RegisterState(
      userMail: userMail ?? this.userMail,
      userPassword: userPassword ?? this.userPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [userMail, userPassword, formStatus];
}
