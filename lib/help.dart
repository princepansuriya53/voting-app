import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Help extends StatefulWidget {
  const Help({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2F2E4D),
          title: Text("home5".tr),
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset('image/help.json'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
                onPressed: () {
                  _launchWhatsapp();
                },
                child: Text("help1".tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
          ],
        )));
  }

  _launchWhatsapp() async {
    var whatsapp = "+919081701373";
    var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("help2".tr),
        ),
      );
    }
  }
}
