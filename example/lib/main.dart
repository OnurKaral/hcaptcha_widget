import 'package:flutter/material.dart';
import 'package:hcaptcha_widget/hcaptcha_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
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
        ),
      ),
    );
  }
}
