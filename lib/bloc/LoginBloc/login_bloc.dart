import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/product/repository/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc(this.authRepo) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUserMailChanged) {
      emit(state.copyWith(userMail: event.userMail));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(userPassword: event.userPassword));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo.signInWithEmail();
        emit(state.copyWith(formStatus: SubmissionSucces()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
