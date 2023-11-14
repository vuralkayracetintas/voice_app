import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/product/repository/auth/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository authRepo;
  LoginBloc(this.authRepo) : super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {});
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUserMailChanged) {
      emit(state.copyWrite(userMail: event.userMail));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWrite(userPassword: event.userPassword));
    } else if (event is LoginSubmitted) {
      emit(state.copyWrite(formStatus: FormSubmitting()));
      try {
        await authRepo.login();
        emit(state.copyWrite(formStatus: SubmissionSucces()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
