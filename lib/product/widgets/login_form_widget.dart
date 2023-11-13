import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});

  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(),
    );
  }
}
