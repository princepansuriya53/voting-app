import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:button_animations/button_animations.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class imageupload4 extends StatefulWidget {
  @override
  State<imageupload4> createState() => _imageupload4State();
}

class _imageupload4State extends State<imageupload4> {
  File? _image6 = null;
  File? date_image = null;
  final _picker = ImagePicker();
  Future getImagebyGallery() async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (image != null) {
          date_image = File(image.path);
          storage.write('image6', image.path);
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
        storage.write('image6', image.path);
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
                  title:  Text('home18'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery(),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title:  Text('home19'.tr,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title:  Text("Residency bill"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: storage.read('image6') == null
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
                      child: const Text(
                        "Upload Bill",
                        style: TextStyle(
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
                                    'image6',
                                  )),
                                  fit: BoxFit.cover,
                                ))),
                        Positioned(
                          right: 5.0,
                          child: InkWell(
                            child: const Icon(Icons.highlight_remove_outlined,
                                size: 30, color: Colors.black),
                            onTap: () => storage.remove('image6'),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 200),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 50,
              width: 280,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 36),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
