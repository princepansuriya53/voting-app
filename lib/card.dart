import 'package:flutter/material.dart';
import 'package:ova/formdata/imagepiker/imagepiker1.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Cardd extends StatefulWidget {
  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF627192),
          Color(0xFF627192),
          Color(0xFF627192),
        ])),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.orangeAccent,
                    Colors.orangeAccent,
                    Colors.white,
                    Colors.greenAccent,
                  ])),
              height: 345,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset('image/lion.png',
                            height: 50, width: 50),
                      ),
                      Column(
                        children: const [
                          SizedBox(height: 25),
                          Text(
                            'ભારતનું ચૂંટણી પંચ',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('ELECTION COMMISSION OF INDIA',
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 8),
                        child: Image.asset('image/vlogo.png',
                            height: 40, width: 40),
                      ),
                    ],
                  ),
                  const Text(
                    '    મતદાર ફોટો ઓળખાણ-ELECTOR PHOTO IDENTITY CARD',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 150,
                          child: SfBarcodeGenerator(
                              value: 'XKQ1237654', symbology: Code128A())),
                      const Text(
                        'XKQ1237654',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 10),
                    child: SizedBox(
                      height: 80,
                      width: 60,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      Text('નામ      ', style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          ': ${storage.read('Ename')}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Row(
                    children: [
                      Text(
                        'Name    ',
                        style: TextStyle(
                            fontSize: 14.5, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          ':  ${storage.read('Ename')}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Row(
                    children: [
                      Text(
                        'પિતાનું નામ         ',
                        style: TextStyle(fontSize: 17.5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          ':  ${storage.read("RName")}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Row(
                    children: [
                      Text(
                        '''Father's Name    ''',
                        style: TextStyle(
                            fontSize: 14.5, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          ':  ${storage.read("RName")}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color(0xffeea18f),
                    Color(0xffeea18f),
                    Color(0xffeea18f),
                  ])),
              height: 345,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(' જાતિ / Sex', style: TextStyle(fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(' : પુરૂષ / Male',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' જન્મ તારીખ / ઉંમર',
                          style: TextStyle(fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          ' : ${storage.read('Date1')}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: 60,
                          child: Text('Address :',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: 160,
                          child: Text(
                            '${storage.read('ghar')},${storage.read('seri')}',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 60,
                          child: const Text('સરનામું  :',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Container(
                          width: 170,
                          child: Text(
                            '${storage.read('ghar')},${storage.read('seri')}',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 70, top: 15),
                    child: Text(
                      'મતદાર નોંધણી અધિકારી',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 210,
                          child: const Text(
                            'Date : 10/11/2018  Electoral Registration',
                            style: TextStyle(
                                fontSize: 11.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
