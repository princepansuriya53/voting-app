import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ova/login.dart';

class Forgotpwd extends StatefulWidget {
  String email;
  Forgotpwd({required this.email});
  @override
  State<Forgotpwd> createState() => _ForgotpwdState();
}

class _ForgotpwdState extends State<Forgotpwd> {
  final _formKeyy = GlobalKey<FormState>();
  bool passwordd = true;
  bool Confirmpasswordd = true;
  String pwd = '';
  String cpwd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2F2E4D),
          title: Text('Forgot password'),
        ),
        body: Container(
            width: double.infinity,
            child: Form(
              key: _formKeyy,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15, top: 10),
                    //   child: Text(
                    //     '',
                    //     style: TextStyle(
                    //         color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10, left: 10),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       hintText: "abc123@gmail.com",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),
                    //     validator: (value) {
                    //       if (value == null || value.trim().isEmpty) {
                    //         //.trim(remove space)
                    //         return 'Please enter your email address';
                    //       }
                    //       // Check if the entered email has the right format
                    //       if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    //         return 'Please enter a valid email address';
                    //       }
                    //       // Return null if the entered email is valid
                    //       return null;
                    //     },
                    //     onChanged: (value) => email = value,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 1, right: 10),
                      child: TextFormField(
                        obscureText: passwordd,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _passwordd,
                              child: Icon(passwordd
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                            ),
                            fillColor: Colors.orangeAccent),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => pwd = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        obscureText: Confirmpasswordd,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _Confirmpasswordd,
                              child: Icon(Confirmpasswordd
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: "Enter Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF2F2E4D)),
                            ),
                            fillColor: Colors.orangeAccent),
                        validator: (value) {
                          if (value != null && value.trim().isEmpty) {
                            return 'Conform password is required please enter';
                          }
                          if (value != pwd) {
                            return 'Confirm password not matching';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          cpwd = value;
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2F2E4D)),
                      onPressed: () {
                        if (_formKeyy.currentState!.validate()) {
                          forgotpwdd();
                        }
                      },
                      child: Text('Submit'),
                    )
                  ]),
            )));
  }

  void _passwordd() {
    setState(() {
      passwordd = !passwordd;
    });
  }

  void _Confirmpasswordd() {
    setState(() {
      Confirmpasswordd = !Confirmpasswordd;
    });
  }

  void forgotpwdd() async {
    http.Response res =
        await AuthRepoo.registerApii(pwd: pwd, email: widget.email);
    //print(1111111);
    // print(res.body);
    print("${Forgoturl.baseurii}?action=chgforgotpwd&email=" +
        widget.email +
        "&pwd=" +
        pwd);
    if (res != null) {
      var response = jsonDecode(res.body);

      if (response["message"] == "password successfully updated") {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                // duration: const Duration(seconds: 3),
                content: Text("${response["message"]}"),
              ),
            )
            .closed
          ..then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login())));
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

class Forgoturl {
  static String baseurii = 'https://vstechno.co.in/news/api/user.php';
}

class AuthRepoo {
  static Future registerApii({
    required String email,
    required String pwd,
  }) async {
    return await get(Uri.parse(
        "${Forgoturl.baseurii}?action=chgforgotpwd&email=" +
            email +
            "&pwd=" +
            pwd));
    // body: {'mno': '$mno', 'pwd': '$pwd'});
  }
}
