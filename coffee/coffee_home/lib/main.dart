import 'package:coffee_home/alllist/alllist.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
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
      // appBar: AppBar(
      //   title: const Text('IRIS Data'),
      // ),
      body: TabBarView(
        // children: const [AllList(), IrisScatter(), IrisScatterDup()],
        children: const [
          AllList(),
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
            ),
            // Tab(
            //   icon: Image.asset(
            //     'images/scatter.jpg',
            //     width: 40,
            //     height: 40,
            //   ),
            //   text: 'Scatter',
            // ),
            // const Tab(
            //   icon: Icon(Icons.dns_outlined),
            //   text: 'Dup Scatter',
            // ),
          ],
        ),
      ),
    );
  }
}
