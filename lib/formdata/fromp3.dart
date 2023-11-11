import 'fromp4.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class form3 extends StatefulWidget {
  @override
  _form3State createState() => _form3State();
}

class _form3State extends State<form3> {
  //Using For gender {
  int _gorupvalue = 0;
  String? gender;
  final bool _a = false;
  final bool _b = false;
  final bool _c = false;
// }
  final store = GetStorage();
  final keyform = GlobalKey<FormState>();
  String? reativename;
  String? epicname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF2F2E4D), title: Text('form50'.tr)),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Form(
              key: keyform,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(right: 110, top: 20),
                  child: Text(
                    'form51'.tr,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "form52".tr;
                        }
                      },
                      onChanged: (value) => setState(() => reativename = value),
                      decoration: InputDecoration(
                        labelText: "form53".tr,
                        hintText: "form54".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 65, top: 20),
                  child: Text('form55'.tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      validator: (value) {
                        if (value.toString().length >= 11) {
                          return "";
                        }
                        if (value == null || value.isEmpty) {
                          return "form56".tr;
                        }
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() => epicname = value),
                      autocorrect: true,
                      decoration: InputDecoration(
                          hintText: "form57".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'form58'.tr,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                ListTile(
                  title: Text('form59'.tr),
                  leading: Radio(
                      value: 1,
                      groupValue: _gorupvalue,
                      onChanged: (Object? val) {
                        gender = 'form59'.tr;
                        _gorupvalue = 1;
                        setState(() => val = _b);
                      }),
                ),
                ListTile(
                  title: Text('form60'.tr),
                  leading: Radio(
                      value: 2,
                      groupValue: _gorupvalue,
                      onChanged: (Object? val) {
                        gender = 'form60'.tr;
                        _gorupvalue = 2;
                        setState(() => val = _b);
                      }),
                ),
                ListTile(
                  title: Text('form61'.tr),
                  leading: Radio(
                      value: 3,
                      groupValue: _gorupvalue,
                      onChanged: (Object? val) {
                        gender = 'form61'.tr;
                        _gorupvalue = 3;
                        setState(() => val = _b);
                      }),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: Color(0xFF2F2E4D),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (keyform.currentState!.validate()) {
                          setState(() {
                            store.write("RName", reativename);
                            store.write("Relative", epicname);
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => F4()));
                        }
                      },
                      icon: const Icon(Icons.navigate_next_sharp),
                      label: Text(
                        'form49'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ]),
            )),
      ),
    );
  }
}
