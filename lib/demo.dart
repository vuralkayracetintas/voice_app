import 'package:flutter/material.dart';
import 'package:voice_app/product/repository/func/show_message.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  ShowMessage().showSuccessRegister(context);
                },
                child: Text('Demo'))
          ],
        ),
      ),
    );
  }
}
