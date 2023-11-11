import 'package:flutter/material.dart';
import 'package:ova/widget.dart';
import 'package:get/get.dart';

class Candidate extends StatefulWidget {
  @override
  State<Candidate> createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  int itemcount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title: Text('can42'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            App().can(
                onTap: () {
                  showAlertDialog(
                      photo: 'image/modig.png',
                      text1: 'can'.tr,
                      text2: 'can1'.tr,
                      text3: 'can2'.tr,
                      text4: 'can3'.tr,
                      text5: 'can4'.tr,
                      text6: 'can5'.tr,
                      text7: 'can6'.tr);
                },
                text1: 'can'.tr,
                color: const Color(0xFF627192),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can8'.tr,
                photo: 'image/modig.png'.tr),
            const SizedBox(height: 10),
            App().can(
                onTap: () {
                  showAlertDialog(
                    photo: 'image/modig.png',
                    text1: 'can10'.tr,
                    text2: 'can11'.tr,
                    text3: 'can2'.tr,
                    text4: '62'.tr,
                    text5: 'can4'.tr,
                    text6: 'can12'.tr,
                    text7: 'can6'.tr,
                  );
                },
                text1: 'can10'.tr,
                color: const Color(0xFF2F2E4D),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can13'.tr,
                photo: 'image/modig.png'),
            const SizedBox(height: 10),
            App().can(
                onTap: () {
                  showAlertDialog(
                    photo: 'image/modig.png',
                    text1: 'can14'.tr,
                    text2: ''.tr,
                    text3: 'can2'.tr,
                    text4: '37'.tr,
                    text5: 'can4'.tr,
                    text6: 'can16'.tr,
                    text7: 'can6'.tr,
                  );
                },
                text1: 'can18'.tr,
                color: const Color(0xFF627192),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can17'.tr,
                photo: 'image/modig.png'),
            const SizedBox(
              height: 10,
            ),
            App().can(
                onTap: () {
                  showAlertDialog(
                    photo: 'image/modig.png',
                    text1: 'can19'.tr,
                    text2: 'can20'.tr,
                    text3: 'can2'.tr,
                    text4: '48'.tr,
                    text5: 'can4'.tr,
                    text6: 'can21'.tr,
                    text7: 'can6'.tr,
                  );
                },
                text1: 'can22'.tr,
                color: const Color(0xFF2F2E4D),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can23'.tr,
                photo: 'image/modig.png'),
            const SizedBox(
              height: 10,
            ),
            App().can(
                onTap: () {
                  showAlertDialog(
                    photo: 'image/modig.png',
                    text1: 'can24'.tr,
                    text2: 'can25'.tr,
                    text3: 'can2'.tr,
                    text4: '65'.tr,
                    text5: 'can4'.tr,
                    text6: 'can27'.tr,
                    text7: 'can6'.tr,
                  );
                },
                text1: 'can28'.tr,
                color: const Color(0xFF627192),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can29'.tr,
                photo: 'image/modig.png'),
            const SizedBox(
              height: 10,
            ),
            App().can(
                onTap: () {
                  showAlertDialog(
                    photo: 'image/modig.png',
                    text1: 'can30'.tr,
                    text2: 'can31'.tr,
                    text3: 'can2'.tr,
                    text4: '55'.tr,
                    text5: 'can4'.tr,
                    text6: 'can32'.tr,
                    text7: 'can6'.tr,
                  );
                },
                text1: 'can33'.tr,
                color: const Color(0xFF2F2E4D),
                text2: 'can9'.tr,
                text3: 'can7'.tr,
                text4: 'can34'.tr,
                photo: 'image/modig.png'.tr),
          ],
        ),
      ),
    );
  }

  void showAlertDialog({
    required var photo,
    required String text1,
    required String text2,
    required String text3,
    required String text4,
    required String text5,
    required String text6,
    required String text7,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF627192),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 30),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage(photo),
                    radius: 50,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can35'.tr,
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    Text(
                      text1,
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text(
                        'can36'.tr,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can37'.tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                    Text(
                      text3,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can38'.tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                    Text(text4,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can39'.tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                    Text(
                      text5,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can40'.tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                    Text(text6,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: Text('can41'.tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                    Text(text7,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
