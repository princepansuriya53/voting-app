import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:ova/profile.dart';

final storage = GetStorage();

class Uprofile extends StatefulWidget {
  @override
  State<Uprofile> createState() => _UprofileState();
}

class _UprofileState extends State<Uprofile> {
  final formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  String user_id = storage.read('xyz');
  String fname = '';
  String lname = '';
  String email = '';
  String mno = '';
  String addr = '';
  String city = '';
  String state = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text('Update Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('fname'),
                    decoration: InputDecoration(
                      hintText: "FirstName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your FirstName ';
                      }
                      // Check if the entered email has the right format
                      return null;
                    },
                    onChanged: (value) => fname = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('lname'),
                    decoration: InputDecoration(
                      hintText: "LastName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your LastName ';
                      }
                      // Check if the entered email has the right format
                      return null;
                    },
                    onChanged: (value) => lname = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('eid'),
                    decoration: InputDecoration(
                      hintText: "abc123@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your email address';
                      }
                      // Check if the entered email has the right format
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => email = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('mno'),
                    decoration: InputDecoration(
                      hintText: "Mobile No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your Mobile NO';
                      }
                      // Check if the entered email has the right format
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => mno = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('add'),
                    decoration: InputDecoration(
                      hintText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your Address';
                      }
                      // Check if the entered email has the right format
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => addr = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('city'),
                    decoration: InputDecoration(
                      hintText: "City",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your City';
                      }
                      // Check if the entered email has the right format
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => city = value,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: storage.read('state'),
                    decoration: InputDecoration(
                      hintText: "State",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        //.trim(remove space)
                        return 'Please enter your State';
                      }
                      // Check if the entered email has the right format
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => state = value,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2F2E4D)),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      updateprofile();
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateprofile() async {
    setState(() {
      fname = fname == "" ? storage.read('fname') : fname;
      lname = lname == '' ? storage.read('lname') : lname;
      email = email == '' ? storage.read('eid') : email;
      mno = mno == '' ? storage.read('mno') : mno;
      addr = addr == '' ? storage.read('add') : addr;
      city = city == '' ? storage.read('city') : city;
      state = state == '' ? storage.read('state') : state;
    });
    print("^^^^^^^^^^^^^^^^${RegisterUrl.baseuri}?action=updprofile&user_id=" +
        user_id +
        "&fname=" +
        fname +
        "&lname=" +
        lname +
        "&email=" +
        email +
        "&mno=" +
        mno +
        "&addr=" +
        addr +
        "&city=" +
        city +
        "&state=" +
        state);

    http.Response res = await AuthRepo.registerApi(
        user_id: user_id,
        fname: fname,
        lname: lname,
        email: email,
        mno: mno,
        addr: addr,
        city: city,
        state: state);
    //print(1111111);
    // print(res.body);

    if (res != null) {
      var response = jsonDecode(res.body);

      if (response["message"] == "Your profile Successfully updated") {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                // duration: const Duration(seconds: 3),
                content: Text("${response["message"]}"),
              ),
            )
            .closed
          ..then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile())));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // duration: const Duration(seconds: 3),
            content: Text("${response["message"]}"),
          ),
        );
      }
    }
  }
}

class RegisterUrl {
  static String baseuri = 'https://vstechno.co.in/news/api/user.php';
}

class AuthRepo {
  static Future registerApi({
    required String user_id,
    required String fname,
    required String lname,
    required String email,
    required String mno,
    required String addr,
    required String city,
    required String state,
  }) async {
    return await get(Uri.parse(
        "${RegisterUrl.baseuri}?action=updprofile&user_id=" +
            user_id +
            "&fname=" +
            fname +
            "&lname=" +
            lname +
            "&email=" +
            email +
            "&mno=" +
            mno +
            "&addr=" +
            addr +
            "&city=" +
            city +
            "&state=" +
            state));
  }
}
