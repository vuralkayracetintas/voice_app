import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    super.key,
  });

  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [],
      ),
    );
  }
}
