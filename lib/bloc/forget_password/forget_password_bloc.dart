import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_app/core/screens/forget_password/forget_password.dart';

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

  Future _onForgetPasswordRequested(ForgetPasswordEvent event,
      Emitter<ForgetPasswordState> emit, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.mail);
      showResetPasswordAlert(context);
      emit(ForgetPasswordSuccess());

      print('success');
    } on FirebaseAuthException catch (e) {
      print('error: $e');
    }
  }
}
