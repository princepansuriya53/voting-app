import 'show_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  TextEditingController dateinput = TextEditingController();

  final storage = GetStorage();
  final key = GlobalKey<FormState>();
  String? applicant;
  String? place;
  String? dated;
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text(
          'voter'.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 12, right: 200, bottom: 10),
              child: Text('voter1'.tr, style: TextStyle(fontSize: 28)),
            ),
            Center(
              child: Container(
                  decoration: const BoxDecoration(),
                  width: double.infinity,
                  height: 420,
                  child: Card(
                    color: Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 60, top: 10),
                        child: Text(
                          'voter2'.tr,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.pinkAccent.withOpacity(0.4),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_box, color: Colors.green),
                        title: Text('voter3'.tr),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_box, color: Colors.green),
                        title: Text('voter4'.tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "voter5".tr;
                            }
                          },
                          onChanged: (value) => setState(() => dated = value),
                          keyboardType: TextInputType.datetime,
                          controller: dateinput,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "voter6".tr),
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
                                  DateFormat('voter7'.tr).format(pickedDate);
                              print(formattedDate);
                              setState(() => dateinput.text = formattedDate);
                            } else {
                              print("voter8".tr);
                            }
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_box, color: Colors.green),
                        title: Text('''voter9'''.tr),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_box, color: Colors.green),
                        title: Text('''voter10'''.tr),
                      ),
                    ]),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12, right: 80),
                child: Text(
                  'General Declaration:'.tr,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                )),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(10), child: Text('''voter10'''.tr)),
            ),
            Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: 12, right: 180),
                  child: Text(
                    'voter11'.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  )),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "voter12".tr;
                      }
                    },
                    onChanged: (value) {
                      setState(() => applicant = value);
                    },
                    decoration: InputDecoration(
                        labelText: "voter13".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, right: 295),
                child: Text('voter14'.tr,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "voter15".tr;
                      }
                    },
                    onChanged: (value) {
                      setState(() => place = value);
                    },
                    decoration: InputDecoration(
                        labelText: "voter16".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              )
            ]),
            const SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                height: 45,
                width: 90,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2F2E4D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2F2E4D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        setState(() {
                          storage.write('Date2', dateinput.text);
                          storage.write('nameapp', applicant);
                          storage.write('place', place);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowData()),
                        );
                      }
                    },
                    child: Text('voter17'.tr, style: TextStyle(fontSize: 20))),
              ),
            ]),
            const SizedBox(height: 25),
          ]),
        ),
      ),
    );
  }
}
