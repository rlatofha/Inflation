import 'package:flutter/material.dart';

import 'cafesearch_app/cafesearch.dart';
import 'main.dart';

class MovePage extends StatelessWidget {
  const MovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //초기값 주는 부분.
      routes: {
        '/': (context) {
          return const Cafe();
        },
        '/Search': (context) {
          return const CafeSearch();
        },
        // '/2nd': (context) {
        //   return const Screen2nd();
        // },
      },
    );
  }
}
