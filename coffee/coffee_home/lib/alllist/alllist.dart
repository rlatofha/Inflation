import 'package:flutter/material.dart';
import 'dart:convert'; // for json
import 'package:http/http.dart' as http;

class AllList extends StatefulWidget {
  const AllList({Key? key}) : super(key: key);

  @override
  _AllListState createState() => _AllListState();
}

class _AllListState extends State<AllList> {
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
        title: const Text("자치구별 List"),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text(
                "데이터가 없습니다.",
                textAlign: TextAlign.center,
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Card(
                      color: Colors.red[100],
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 4, 0, 4),
                        child: Row(
                          children: [
                            Text(
                              '${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                                        "district :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(data[index]['district'].toString()),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      const Text(
                                        "cafe :",
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
                                        "restaurant :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          data[index]['restaurant'].toString()),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      const Text(
                                        "bakery :",
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
    );
  }

  Future<String> getJSONData() async {
    // WidgetsFlutterBinding.ensureInitialized();
    print("start");
    // var url = Uri.parse('http://127.0.0.1:8080/Flutter/all_list.jsp');
    var url = Uri.parse('http://172.30.1.20:51348/Flutter/all_list.jsp');

    // var url = Uri.parse(
    //     'http://127.0.0.1:8080/C:/Program%20Files/Apache%20Software%20Foundation/Tomcat%208.5/webapps/ROOT/Flutter/all_list.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    print(result);
    setState(() {
      data.addAll(result);
    });
    print(data[0]['bakery'].toString());
    return response.body;
  }
} // End
