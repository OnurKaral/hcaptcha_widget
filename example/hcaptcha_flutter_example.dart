import 'package:flutter/material.dart';
import 'package:hcaptcha_flutter/hcaptcha_flutter.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hCaptcha Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) {
                return HCaptchaWidget(
                  siteKeyUrl: 'https://YOUR-DOMAIN.com/hCaptcha-flutter.html',
                  onTokenReceived: (token) {
                    if (token != null) {
                      // Use the token here (e.g., send it to your backend)
                      print('hCaptcha token: $token');
                    } else {
                      // Handle cases where the user cancels or encounters an error
                      print('hCaptcha verification cancelled or failed.');
                    }
                  },
                );
              }
          ),
        );
      },
      child: Text('Button'),
    );
  }
}


