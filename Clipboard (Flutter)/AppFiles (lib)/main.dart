import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'ios/app.dart' as ios_app;
import 'android/app.dart' as android_app;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Choose app based on platform
  if (Platform.isIOS) {
    runApp(const ios_app.IOSApp());
  } else if (Platform.isAndroid) {
    runApp(const android_app.AndroidApp());
  } else {
    // Fallback for other platforms
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Unsupported Platform', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
