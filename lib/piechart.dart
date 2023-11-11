import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class Piechart extends StatefulWidget {
  @override
  State<Piechart> createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  int choiceIndex = 0;
  List pie = [];

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    var url = "https://vstechno.co.in/news/api/user.php?action=countvote";
    print("@@@$pie");

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var item = jsonDecode(response.body)['vote'];

      print("Fetched data: $item");

      setState(() {
        pie = item;

        // Update storage before updating datamap
        storage.write('bjp', pie[0]['countparty']);
        storage.write('INC', pie[1]['countparty']);
        storage.write('AAP', pie[2]['countparty']);
        storage.write('SP', pie[3]['countparty']);
        storage.write('NOTA', pie[4]['countparty']);

        // Now update datamap
        datamap = {
          "Bjp": double.parse(storage.read('bjp') ?? "0.0"),
          "INC": double.parse(storage.read('INC') ?? "0.0"),
          "APP": double.parse(storage.read('AAP') ?? "0.0"),
          "SP": double.parse(storage.read('SP') ?? "0.0"),
          "NOTA": double.parse(storage.read('NOTA') ?? "0.0"),
        };

        print('bjp: ${storage.read('bjp')}');
        print('INC: ${storage.read('INC')}');
        print('AAP: ${storage.read('AAP')}');
        print('SP: ${storage.read('SP')}');
        print('NOTA: ${storage.read('NOTA')}');
      });
    } else {
      setState(() => pie = []);
    }
  }

  Map<String, double> datamap = {
    "Bjp": 0.0,
    "INC": 0.0,
    "APP": 0.0,
    "SP": 0.0,
    "NOTA": 0.0,
  };

  List<Color> colorList = [
    const Color(0xFFd35400),
    const Color(0xFF229954),
    const Color(0xFFf4d03f),
    const Color(0xFF45b39d),
    const Color(0xFF5dade2),
  ];

  @override
  Widget build(BuildContext context) {
    print("datamap: $datamap");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title: Text("chart".tr),
      ),
      body: Center(
        child: PieChart(
          chartLegendSpacing: 2,
          chartRadius: 450,
          animationDuration: const Duration(seconds: 3),
          dataMap: datamap,
          colorList: colorList,
          centerText: "chart1".tr,
        ),
      ),
    );
  }
}
