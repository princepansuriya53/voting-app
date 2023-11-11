import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'forgotp.dart';

class Fpassword extends StatefulWidget {
  @override
  State<Fpassword> createState() => _FpasswordState();
}

class _FpasswordState extends State<Fpassword> {
  final _formKey = GlobalKey<FormState>();
  bool Confirmpasswordd = true;
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2F2E4D),
          title: Text('Forgot Password'),
        ),
        body: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                          ),
                          hintText: "abc123@gmail.com",
                          hintStyle: TextStyle(),
                        ),
                        validator: (value) {
                          if (value == null) {
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
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2F2E4D)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            forgotpwd();
                          }
                        },
                        child: Text('Save'),
                      ),
                    )
                  ]),
            )));
  }

  void _Confirmpasswordd() {
    setState(() {
      Confirmpasswordd = !Confirmpasswordd;
    });
  }

  void forgotpwd() async {
    http.Response res = await AuthRepo.registerApi(email: email);
    print(1111111);
    // print(res.body);
    print("${RegisterUrl.baseuri}?action=forgotpwd&email=" + email);
    if (res != null) {
      var response = jsonDecode(res.body);

      if (response["message"] == "EmailID is Right") {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                content: Text("${response["message"]}"),
              ),
            )
            .closed
          ..then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Forgotpwd(
                        email: email,
                      ))));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // duration: const Duration(seconds: 3),
            content: Text("EmailID is Not correct"),
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
    required String email,
  }) async {
    return await get(
        Uri.parse("${RegisterUrl.baseuri}?action=forgotpwd&email=" + email));
    // body: {'mno': '$mno', 'pwd': '$pwd'});
  }
}
