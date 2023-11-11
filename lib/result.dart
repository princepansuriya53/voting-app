import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List vot = [];
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    var url = "https://vstechno.co.in/news/api/user.php?action=voteresult";
    print("!!!!!!!!!!!!!$url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var item = jsonDecode(response.body)['vote'];
      print(item);
      setState(() {
        vot = item;
      });
    } else {
      setState(() {
        vot = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2F2E4D),
        appBar: AppBar(
          backgroundColor: Color(0xFF2F2E4D),
          title: Text('Result'),
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: vot.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Winner is ${vot[index]['party_name']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        SizedBox(height: 13),
                        Text(
                          '${vot[index]['countparty']}',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
            Lottie.asset('image/fire-2.json'),
            Lottie.asset('image/fire-1.json'),
          ],
        ));
  }
}
