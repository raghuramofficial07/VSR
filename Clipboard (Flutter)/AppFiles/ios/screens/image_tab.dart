
// lib/ios/screens/image_tab.dart
import 'package:flutter/cupertino.dart';

class IOSImageTabScreen extends StatelessWidget {
  const IOSImageTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Images — iOS'),
      ),
      child: Center(
        child: Text('This Tab Is Under Build Process'),
      ),
    );
  }
}
