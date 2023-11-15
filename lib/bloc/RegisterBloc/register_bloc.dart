import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/product/repository/auth/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;
  RegisterBloc(this.authRepo) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {});
  }
  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    // Email updated
    if (event is RegisterUserMailChanged) {
      emit(state.copyWith(userMail: event.userMail));

      // Password updated
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(userPassword: event.userPassword));

      // Form submitted
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.signUpWithEmail(
            email: state.userMail, password: state.userPassword);
        emit(state.copyWith(formStatus: const SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
