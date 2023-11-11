import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:button_animations/button_animations.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class imageupload extends StatefulWidget {
  @override
  State<imageupload> createState() => _imageuploadState();
}

class _imageuploadState extends State<imageupload> {
  File? _image4 = null;
  File? date_image = null;
  final _picker = ImagePicker();
  Future getImagebyGallery() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (image != null) {
          date_image = File(image.path);
          storage.write('image4', image.path);
        }
        Navigator.pop(context);
      },
    );
  }

  Future getImagebyCamera() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        date_image = File(image.path);
        storage.write('image4', image.path);
      }
      Navigator.pop(context);
    });
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
                  title: Text('home18'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery(),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: Text('home19'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title: Text('id5'.tr),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: storage.read('image4') == null
                  ? AnimatedButton(
                      onTap: () => getImage1(context),
                      isMultiColor: true,
                      isOutline: true,
                      animationCurve: Curves.bounceIn,
                      blurRadius: 10,
                      borderRadius: 30,
                      colors: const [
                        Color(0xFF627192),
                        Color(0xFF627192),
                        Color(0xFF627192),
                        Color(0xFF627192)
                      ],
                      child: Text(
                        "id".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                  : Stack(
                      children: [
                        SizedBox(
                            width: 320,
                            height: 180,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.file(
                                  File(storage.read(
                                    'image4',
                                  )),
                                  fit: BoxFit.cover,
                                ))),
                        Positioned(
                          right: 5.0,
                          child: InkWell(
                            child: const Icon(Icons.highlight_remove_outlined,
                                size: 30, color: Colors.black),
                            onTap: () => storage.remove('image4'),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
