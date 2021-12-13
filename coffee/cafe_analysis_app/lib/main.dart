import 'package:flutter/material.dart';

import 'cafelistall_app/cafelistall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Cafe(),
    );
  }
}

class Cafe extends StatefulWidget {
  const Cafe({Key? key}) : super(key: key);

  @override
  _CafeState createState() => _CafeState();
}

class _CafeState extends State<Cafe> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: const [
          CafeListAll(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Container(
        color: Colors.amber[50],
        height: 100,
        child: TabBar(
          labelColor: Colors.blueAccent,
          controller: controller,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/list.png',
                width: 40,
                height: 40,
              ),
              text: 'List',
            )
          ],
        ),
      ),
    );
  }
} // End