import 'imagepiker/imagepiker4.dart';
import 'imagepiker/imgpiker.dart';
import 'fromp5.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';

class F4 extends StatefulWidget {
  @override
  _F4State createState() => _F4State();
}

class _F4State extends State<F4> {
  final List<String> areatype = ['form62'.tr, 'form63'.tr, 'form64'.tr];
  final List<String> proof = [
    'form65'.tr,
    'form66'.tr,
    'form67'.tr,
    'form68'.tr,
    'form69'.tr,
  ];
  final store = GetStorage();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  var sv1;
  var sv2;
  String? house;
  String? area;
  String? vilage;
  String? postoffice;
  String? pincode;
  final fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF2F2E4D), title: Text('form96'.tr)),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Form(
            key: fromkey,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(right: 5, top: 20),
                child: Text('form70'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'form71'.tr;
                      }
                    },
                    onChanged: (value) => setState(() => house = value),
                    decoration: InputDecoration(
                        labelText: "form72".tr,
                        hintText: "form73".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Padding(
                padding: EdgeInsets.only(right: 170, top: 20),
                child: Text('form74'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'form75'.tr;
                        }
                      },
                      onChanged: (value) => setState(() => area = value),
                      decoration: InputDecoration(
                          hintText: "form76".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))))),
              Padding(
                padding: EdgeInsets.only(right: 240, top: 20),
                child: Text('form77'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'form78'.tr;
                      }
                    },
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) => setState(() => vilage = value),
                    decoration: InputDecoration(
                        labelText: "form79",
                        hintText: "form80".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 270, top: 20),
                  child: Text('form81'.tr,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600))),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'form82'.tr;
                        }
                      },
                      onChanged: (value) => setState(() => postoffice = value),
                      decoration: InputDecoration(
                          hintText: "form83".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))))),
              Padding(
                  padding: EdgeInsets.only(right: 286, top: 20),
                  child: Text('form84'.tr,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600))),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'form85'.tr;
                      }
                    },
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => pincode = value),
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: "form86".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CountryStateCityPicker(
                  country: country,
                  state: state,
                  city: city,
                  textFieldInputBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 273,
                  top: 20,
                ),
                child: Text('form87'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 10),
                child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onChanged: (value) => setState(() => sv1 = value),
                    hint: Text('form88'.tr),
                    items: areatype
                        .map(
                          (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 18),
                              )),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'form89'.tr;
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 125,
                  top: 20,
                ),
                child: Text('form90'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10, top: 10),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onChanged: (value) {
                    setState(() => sv2 = value);
                  },
                  hint: Text('form91'.tr),
                  items: proof
                      .map(
                        (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 18),
                            )),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'form92'.tr;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 75, top: 30, bottom: 25),
                child: Text('form93'.tr,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 50,
                width: 310,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2F2E4D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => imageupload4()));
                  },
                  icon: const Icon(Icons.upload_file_rounded),
                  label: Text('form94'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: AnimatedButton(
                      child: Text(
                        'form95'.tr,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      borderWidth: 2,
                      borderRadius: 30,
                      borderColor: Colors.white,
                      animationCurve: Curves.bounceIn,
                      isMultiColor: true,
                      colors: const [Color(0xFF2F2E4D), Color(0xFF2F2E4D)],
                      onTap: () {
                        if (fromkey.currentState!.validate()) {
                          setState(() {
                            store.write("ghar", house);
                            store.write('seri', area);
                            store.write('gam', vilage);
                            store.write('postoff', postoffice);
                            store.write('Pcode', pincode);
                            store.write('sv1', sv1);
                            store.write('sv2', sv2);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Final()),
                          );
                        }
                      }))
            ]),
          ))),
    );
  }
}
