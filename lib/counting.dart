import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Count extends StatefulWidget {
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  List data = [];
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    var url = "https://vstechno.co.in/news/api/user.php?action=countvote";
    print("!!!!!!!!!!!!!$url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var item = jsonDecode(response.body)['vote'];
      print(item);
      setState(() {
        data = item;
      });
    } else {
      setState(() {
        data = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text('count'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 150,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 150,
                    width: 130,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                              height: 70,
                              width: 210,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF627192),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 60, right: 50),
                                child: Text(
                                  data[index]['party_name'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white),
                                ),
                              )),
                          SizedBox(height: 13),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 10, left: 50, right: 50),
                            child: Text(
                              data[index]['countparty'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
