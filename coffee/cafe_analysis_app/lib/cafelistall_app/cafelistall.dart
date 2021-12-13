import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

class CafeListAll extends StatefulWidget {
  const CafeListAll({Key? key}) : super(key: key);

  @override
  _CafeListAllState createState() => _CafeListAllState();
}

class _CafeListAllState extends State<CafeListAll> {
  String result = '';
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('자치구별 상가 현황'),
        backgroundColor: Colors.black87,
      ),
      body: SizedBox(
        child: Center(
          child: data.isEmpty
              ? const Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 4, 0, 4),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "자치구명 :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            data[index]['district'].toString()),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Text(
                                          "카페전문점 :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['cafe'].toString()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "음식점 :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['restaurant']
                                            .toString()),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Text(
                                          "제과점 :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(data[index]['bakery'].toString()),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Row(
                                  //     children: [
                                  //       const Text(
                                  //         "Species :",
                                  //         style: TextStyle(
                                  //             fontWeight: FontWeight.bold),
                                  //       ),
                                  //       Text(data[index]['species'].toString()),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse('http://127.0.0.1:8080/Flutter/all_list.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result);
    });
    return response.body;
  }
} // End