import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HCaptchaWidget extends StatefulWidget {
  final String siteKeyUrl;
  final Function(String?) onTokenReceived;

  const HCaptchaWidget({
    super.key,
    required this.siteKeyUrl,
    required this.onTokenReceived,
  });

  @override
  State<StatefulWidget> createState() => _HCaptchaWidgetState();
}

class _HCaptchaWidgetState extends State<HCaptchaWidget> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Captcha', onMessageReceived: (message) {
        widget.onTokenReceived(message.message);
        Navigator.of(context).pop();
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            CircularProgressIndicator();
          },
          onPageStarted: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.siteKeyUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
