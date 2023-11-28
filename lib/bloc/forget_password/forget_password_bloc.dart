import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_app/bloc/form_submission_status.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((
      event,
      emit,
    ) async {
      await _onForgetPasswordRequested(event, emit, event.context);
    });
  }

  Future _onForgetPasswordRequested(
    ForgetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
    context,
  ) async {
    final email = event.mail;
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email == email && user.emailVerified == true) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordSuccess());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Şifrenizi sıfırlamak için size bir mail gönderildi."),
        ),
      );
      print('suiccsess');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Böyle bir mail adresi bulamadı veya mail onaylanmadi."),
        ),
      );
    }
    // await FirebaseAuth.instance.sendPasswordResetEmail(email: event.mail);
  }
}
