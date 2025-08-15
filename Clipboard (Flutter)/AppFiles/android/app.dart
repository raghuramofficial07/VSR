
// lib/android/app.dart
import 'package:flutter/material.dart';
import 'screens/text_holder.dart';
import 'screens/image_tab.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const _AndroidHome(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class _AndroidHome extends StatelessWidget {
  const _AndroidHome();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clipboard — Android'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.description), text: 'Texts'),
              Tab(icon: Icon(Icons.image), text: 'Images'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AndroidTextHolderScreen(),
            AndroidImageTabScreen(),
          ],
        ),
      ),
    );
  }
}
