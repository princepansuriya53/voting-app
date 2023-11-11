import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Camerawidget extends StatefulWidget {
  @override
  State createState() {
    return CamerawidgetState();
  }
}

class CamerawidgetState extends State {
  PickedFile? Imagefile = null;
  Future<void> _showChoicedialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Choose',
            style: TextStyle(height: 1, color: Colors.blue),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(height: 1, color: Colors.blue),
                ListTile(
                    title: const Text('Gallery'),
                    leading: const Icon(Icons.photo, color: Colors.blue),
                    onTap: () {
                      _opengallery(context);
                    }),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: const Text('Camera'),
                  leading:
                      const Icon(Icons.camera_alt_rounded, color: Colors.blue),
                  onTap: () {
                    _opencamera(context);
                  },
                )
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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFFEF6c00),
                Colors.white,
                Color(0xFF4CAF50),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: (Imagefile == null)
                    ? const Text('Choose file',
                        style: TextStyle(color: Colors.white, fontSize: 25))
                    : Image.file(
                        File(Imagefile!.path),
                        height: 230,
                        width: double.infinity,
                        filterQuality: FilterQuality.high,
                      ),
              ),
              MaterialButton(
                height: 50,
                minWidth: 300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                child: const Text('Selcte Image'),
                color: Colors.indigo[800],
                onPressed: () {
                  _showChoicedialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _opencamera(BuildContext context) async {
    final pickedfile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() => Imagefile = pickedfile!);
    Navigator.pop(context);
  }

  void _opengallery(BuildContext context) async {
    final pikedfile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() => Imagefile = pikedfile!);
    Navigator.pop(context);
  }
}
