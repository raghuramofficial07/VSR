// lib/ios/app.dart
import 'package:flutter/cupertino.dart';
import 'screens/text_holder.dart';
import 'screens/image_tab.dart';

class IOSApp extends StatelessWidget {
  const IOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: _IOSHome(),
    );
  }
}

class _IOSHome extends StatelessWidget {
  const _IOSHome();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text),
            label: 'Texts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: 'Images',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Clipboard — iOS'),
              ),
              child: SafeArea(child: IOSTextHolderScreen()),
            );
          case 1:
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Clipboard — iOS'),
              ),
              child: SafeArea(child: IOSImageTabScreen()),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
