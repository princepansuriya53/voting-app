import 'package:ova/formdata/imagepiker/imagepiker1.dart';
import 'formp2.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'imagepiker/imgpiker.dart';

class Form1 extends StatefulWidget {
  @override
  State createState() {
    return Form1State();
  }
}

class Form1State extends State {
  PickedFile? Imagefile = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF2F2E4D), title: Text('form22'.tr)),
      body: Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Lottie.asset("image/image-upload.json",
                          fit: BoxFit.fill, frameRate: FrameRate.max),
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: 300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textColor: Colors.white,
                      child: Text('form19'.tr),
                      color: Color(0xFF2F2E4D),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => imageupload2()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''form20'''.tr,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: AnimatedButton(
                          text: 'form21'.tr,
                          height: 50,
                          width: 200,
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          animationDuration: const Duration(microseconds: 1000),
                          selectedTextColor: Colors.white,
                          transitionType: TransitionType.LEFT_TO_RIGHT,
                          borderColor: Colors.black,
                          borderRadius: 60,
                          selectedGradientColor: const LinearGradient(
                              tileMode: TileMode.repeated,
                              begin: Alignment.topCenter,
                              colors: [Color(0xFF2F2E4D), Color(0xFF2F2E4D)]),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => form2()));
                          }),
                    ),
                    Container(height: 50),
                  ]))),
    );
  }

  void _opencamera(BuildContext context) async {
    final pickedfile = await ImagePicker().getImage(source: ImageSource.camera);

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
