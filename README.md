## Features

- Simply provide your hCaptcha site key URL and a callback function to receive the token.
- Presents the hCaptcha challenge in a WebView without disrupting the app's flow.
- Leverages hCaptcha's advanced technology to distinguish between humans and bots.
- Allows you to configure the hCaptcha challenge to match your app's branding.

## Getting started
To use the HCaptchaWidget, add the following dependency to your pubspec.yaml file:

```yaml
dependencies:
  hcaptcha_widget: ^0.0.1
```
or

```
flutter pub add hcaptcha_flutter
```

Create a static HTML page on your server that contains your hCaptcha sitekey.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>hCaptcha Verification</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        html, body {
          height: 100%;
          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          background-color: #f5f5f5;
        }
        .h-captcha {
          width: 90%;
          max-width: 400px;
          margin: 0 auto;
        }
    </style>
    <script src="https://hcaptcha.com/1/api.js" async defer></script>
</head>
<body>
<div class="h-captcha" data-sitekey="YOUR-SITEKEY-FROM-hCaptcha-DASH" data-callback="captchaCallback"></div>
<script>
    function captchaCallback(response) {
      if (typeof Captcha !== "undefined") {
        Captcha.postMessage(response);
      } else {
        console.error("Captcha object not found. Integration error?");
      }
    }
</script>
</body>
</html>
```

## Usage

To use the HCaptchaWidget, simply create an instance of the widget and pass in the site key URL and a callback function to receive the token:

```dart
HCaptchaWidget(
siteKeyUrl: 'https://example.com/sitekey',
onTokenReceived: (token) {
// Do something with the token
},
)
```