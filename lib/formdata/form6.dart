import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:button_animations/button_animations.dart';
import 'formp1.dart';
import 'imagepiker/imgpiker.dart';
import 'package:get/get.dart';

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {
  final _fromkey = GlobalKey<FormState>();
  var birthdoc;
  var state;
  final stored = GetStorage();
  PickedFile? Imagefile = null;
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  final List<String> raajya = [
    'form97'.tr,
    'form98'.tr,
    'form99'.tr,
    'form100'.tr,
    'form101'.tr,
    'form102'.tr,
    'form103'.tr,
    'form104'.tr,
    'form105'.tr,
    'form106'.tr,
    'form107'.tr,
    'form108'.tr,
    'form109'.tr,
    'form200'.tr,
    'form201'.tr,
    'form202'.tr,
    'form203'.tr,
    'form204'.tr,
    'form205'.tr,
    'form206'.tr,
    'form207'.tr,
    'form208'.tr,
    'form209'.tr,
    'form300'.tr,
    'form301'.tr,
    'form302'.tr,
    'form303'.tr,
    'form304'.tr,
  ];
  final List<String> dropdocumnet = [
    'form'.tr,
    'form1'.tr,
    'form2'.tr,
    'form3'.tr,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form4'.tr),
        backgroundColor: Color(0xFF2F2E4D),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Form(
                key: _fromkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text('form5'.tr,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            hint: Text('form6'.tr),
                            items: raajya
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(fontSize: 18)),
                                  ),
                                )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'form7'.tr;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() => state = value);
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('form8'.tr,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'form9'.tr;
                              }
                              return null;
                            },
                            controller: dateinput,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                hintText: 'form10'.tr),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('form11'.tr).format(pickedDate);
                                print(formattedDate);
                                setState(() => dateinput.text = formattedDate);
                              } else {
                                print('form12'.tr);
                              }
                            }),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(right: 130, top: 20),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text('form13'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    birthdoc = value;
                                  });
                                },
                                hint: Text('form14'.tr),
                                items: dropdocumnet
                                    .map(
                                      (itemu) => DropdownMenuItem(
                                          value: itemu,
                                          child: Text(itemu,
                                              style: const TextStyle(
                                                  fontSize: 18))),
                                    )
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'form15'.tr;
                                  }
                                }),
                          ),
                          SizedBox(
                              height: 250,
                              width: 320,
                              child: Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('form16'.tr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                AnimatedButton(
                                    width: 220,
                                    child: Text('form17'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  imageupload()));
                                    },
                                    animationCurve: Curves.easeInCubic,
                                    isMultiColor: true,
                                    isOutline: true,
                                    colors: [
                                      Color(0xFF2F2E4D),
                                      Color(0xFF2F2E4D)
                                    ],
                                    blurRadius: 20,
                                    borderRadius: 30),
                              ])),
                        ]),
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 80,
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  splashColor: Colors.white,
                                  color: Color(0xFF2F2E4D),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Icon(
                                    Icons.arrow_left_sharp,
                                    color: Colors.white,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 20),
                              child: SizedBox(
                                height: 50,
                                width: 250,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      primary: Color(0xFF2F2E4D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    onPressed: () {
                                      if (_fromkey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Form1()));
                                      }
                                      setState(() {
                                        stored.write("GJ", state);
                                        stored.write("bdayDocumnets", birthdoc);
                                        stored.write('Date1', dateinput.text);
                                      });
                                    },
                                    child: Text('form18'.tr,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600))),
                              ),
                            ),
                          ])
                    ]))),
      ),
    );
  }
}
