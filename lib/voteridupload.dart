// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:button_animations/button_animations.dart';
import 'package:ova/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class Upload extends StatefulWidget {
  @override
  State createState() {
    return UploadState();
  }
}

class UploadState extends State {
  File? _image1 = null;
  File? _image2 = null;
  late final _picker = ImagePicker();

  Future getImagebyGallery(context) async {
    PickedFile? image1 = await _picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (image1 != null) {
          _image1 = File(image1.path);
          storage.write('image1', image1.path);
        }
        Navigator.pop(context);
      },
    );
  }

  Future getImagebyCamera() async {
    final PickedFile? image1 =
        await _picker.getImage(source: ImageSource.camera);
    setState(
      () {
        if (image1 != null) {
          _image1 = File(image1.path);
          storage.write('image1', image1.path);
        }
        Navigator.pop(context);
      },
    );
  }

  Future getImagebyGallery1() async {
    final PickedFile? image2 =
        await _picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (image2 != null) {
          _image2 = File(image2.path);
          storage.write('image2', image2.path);
          print("--------------------------------${storage.read('image2')}");
        }
        Navigator.pop(context);
      },
    );
  }

  Future getImagebyCamera1() async {
    final PickedFile? image2 =
        await _picker.getImage(source: ImageSource.camera);
    setState(
      () {
        if (image2 != null) {
          _image2 = File(image2.path);
          storage.write('image2', image2.path);
        }
        Navigator.pop(context);
      },
    );
  }

  Future<void> getImage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(height: 1, color: Colors.blue),
                ListTile(
                  title: Text('id'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery(context),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: Text('id1'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading:
                      const Icon(Icons.camera_alt_rounded, color: Colors.blue),
                  onTap: () => getImagebyCamera(),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getImage1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(height: 1, color: Colors.blue),
                ListTile(
                  title: Text('id'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery1(),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: Text('id1'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading:
                      const Icon(Icons.camera_alt_rounded, color: Colors.blue),
                  onTap: () => getImagebyCamera1(),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text('id2'.tr),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 50),
              Center(
                child: storage.read('image1') == null
                    ? AnimatedButton(
                        child: Text(
                          "id3".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () => getImage(context),
                        isMultiColor: true,
                        isOutline: true,
                        colors: [
                          Color(0xFF2F2E4D),
                          Color(0xFF2F2E4D),
                          Color(0xFF2F2E4D),
                        ],
                      )
                    : Stack(
                        children: [
                          SizedBox(
                              width: 320,
                              height: 180,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.file(
                                  File(storage.read('image1')),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Positioned(
                            right: 5.0,
                            child: InkWell(
                                child: Icon(
                                  Icons.highlight_remove_outlined,
                                  size: 30,
                                  color: Color(0xFF2F2E4D),
                                ),
                                // This is where the _image value sets to null on tap of the red circle icon
                                onTap: (() => getImage(context))),
                          )
                        ],
                      ),
              ),
              SizedBox(height: 100),
              Center(
                child: storage.read('image2') == null
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.only(
                              left: 29, right: 29, top: 20.5, bottom: 20.5),
                          primary: Color(0xFF2F2E4D),
                        ),
                        child: Text(
                          "id3".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => getImage1(context),
                      )
                    : Stack(
                        children: [
                          SizedBox(
                              width: 320,
                              height: 200,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.file(
                                  File(storage.read('image2')),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Positioned(
                            right: 5.0,
                            child: InkWell(
                              child: Icon(Icons.highlight_remove_outlined,
                                  size: 30, color: Colors.black),
                              // This is where the _image value sets to null on tap of the red circle icon
                              onTap: () => getImage1(context),
                            ),
                          )
                        ],
                      ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      primary: Color(0xFF2F2E4D)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("id4".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
            ],
          ),
        ),
      ),
    );
  }
}
