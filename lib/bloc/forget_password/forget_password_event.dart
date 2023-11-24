part of 'forget_password_bloc.dart';

class ForgetPasswordEvent extends Equatable {
  final String mail;
  BuildContext context;
  ForgetPasswordEvent(this.mail, this.context);

  @override
  List<Object> get props => [mail, context];
}
