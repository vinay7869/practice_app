import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/firebase_options.dart';
import 'package:practice_app/otp.dart';
import 'package:practice_app/repository.dart';
import 'package:practice_app/success.dart';

import 'choice.dart';
// import 'package:practice_app/notification_screen.dart';
// import 'package:practice_app/notification_services.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Choice(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice App')),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Enter no', contentPadding: EdgeInsets.all(8)),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                String phoneNumber = controller.text.trim();
                if (phoneNumber.isNotEmpty) {
                  Repository().signIn(context, phoneNumber);
                }
              },
              child: const Text('Next'))
        ],
      ),
    );
  }
}
