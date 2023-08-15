import 'package:flutter/material.dart';
import 'package:practice_app/repository.dart';
import 'package:practice_app/success.dart';

class OTPScreen extends StatelessWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTPScreen'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          onChanged: (value) {
            if (value.length == 6) {
              Repository().otpLogic(context, verificationId, value.trim());
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const Success(),
              //     ));
            }
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(contentPadding: EdgeInsets.all(10)),
        ),
      )),
    );
  }
}
