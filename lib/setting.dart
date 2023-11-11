import 'package:flutter/material.dart';
import 'package:ova/language/1.dart';
import 'package:ova/profile.dart';
import 'package:ova/updateprofile.dart';
import 'forgotpassword.dart';
import 'login.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF627192),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'setting'.tr,
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.person_outline_outlined),
                SizedBox(width: 3),
                Text(
                  'setting1'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
            Divider(
              color: Colors.black,
              indent: 15,
              endIndent: 15,
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              title: Text(
                'setting2'.tr,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Fpassword()));
              },
              title: Text(
                'setting3'.tr,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Uprofile()));
              },
              title: Text(
                'setting4'.tr,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Myapp1()));
              },
              title: Text(
                'setting5'.tr,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                setState(() {
                  storage.write('login', null);
                });
                print("------------------------------${storage.read('login')}");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              label: Text(
                'setting6'.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
