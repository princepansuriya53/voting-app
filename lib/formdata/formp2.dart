import 'fromp3.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:get/get.dart';

class form2 extends StatefulWidget {
  @override
  _form2State createState() => _form2State();
}

class _form2State extends State<form2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final store = GetStorage();
  String? ename;
  String? surname;
  String? mobilenumber;
  String? gmail;
  String? radioButtonItem;
  int id = 1;
  bool _v1 = false;
  bool _v2 = false;
  bool _v3 = false;
  bool _v4 = false;
  bool? checkboxIconFormFieldValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF2F2E4D), title: Text('form23'.tr)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'form24'.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              SizedBox(
                width: 10,
              ),
              Card(
                  color: Colors.white60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) => setState(() {
                            radioButtonItem = 'Male'.tr;
                            id = 1;
                          }),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.orange),
                        ),
                        Text(
                          'Male'.tr,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  )),
              const SizedBox(width: 10),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) => setState(() {
                      radioButtonItem = 'Female'.tr;
                      id = 2;
                    }),
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  Text('Female'.tr, style: TextStyle(fontSize: 17.0)),
                  SizedBox(
                    width: 5,
                  )
                ]),
              ),
              const SizedBox(width: 10),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  Radio(
                      value: 3,
                      groupValue: id,
                      onChanged: (val) => setState(() {
                            radioButtonItem = 'other'.tr;
                            id = 3;
                          }),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green)),
                  Text('other'.tr, style: TextStyle(fontSize: 17.0)),
                  SizedBox(
                    width: 5,
                  )
                ]),
              ),
            ]), //Gender Row
            Padding(
              padding: EdgeInsets.only(right: 200, top: 20),
              child: Text(
                'form28'.tr,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'form29'.tr;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) => setState(() => ename = value),
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "form30".tr,
                  hintText: "form31".tr,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 100, top: 20),
              child: Text(
                'form32'.tr,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'form33'.tr;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) => setState(() => surname = value),
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "form34".tr,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 210, top: 20),
              child: Text(
                'form35'.tr,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value.toString().length >= 11) {
                    return "form36".tr;
                  }
                  if (value!.isEmpty) {
                    return 'form37'.tr;
                  } else {
                    return null;
                  }
                },
                onChanged: (value) => setState(() => mobilenumber = value),
                keyboardType: TextInputType.number,
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: "form38".tr,
                    hintText: "form39".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 215),
                child: Text(
                  'form40'.tr,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (value) => setState(() => gmail = value),
                validator: (value) {
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                    return "form41".tr;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: "form42".tr,
                  hintText: "form43".tr,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text('form44'.tr,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            ),
            CheckboxListTileFormField(
              title: Text('form45'.tr),
              contentPadding: const EdgeInsets.all(5),
            ),
            CheckboxListTileFormField(
              title: Text('form46'.tr),
              contentPadding: const EdgeInsets.all(5),
            ),

            CheckboxListTileFormField(
              title: Text('form47'.tr),
              contentPadding: const EdgeInsets.all(5),
            ),
            CheckboxListTileFormField(
              title: Text('form48'.tr),
              contentPadding: const EdgeInsets.all(5),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: Color(0xFF2F2E4D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => form3()),
                          );
                          setState(() {
                            store.write("Ename", ename);
                            store.write("Surname", surname);
                            store.write("Number", mobilenumber);
                            store.write("Mail", gmail);
                          });
                        }
                      },
                      child: Text(
                        'form49'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ))),
            ),
          ])),
        ),
      ),
    );
  }
}
