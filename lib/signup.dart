import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool password = true;
  bool Confirmpasswordd = true;

  String fname = '';
  String pwd = '';
  String cpwd = '';
  String lname = '';
  String mno = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF627192),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 70),
                Center(
                  child: Image.asset(
                    'image/signup.png',
                    height: 150,
                    width: 300,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'login'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 80),
                                        child: Text(
                                          'login1'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "login2".tr,
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            fillColor: Colors.orangeAccent),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'login3';
                                          }
                                          // Return null if the entered password is valid
                                          return null;
                                        },
                                        onChanged: (value) => fname = value,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                //confirmPassword
                                Flexible(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Text(
                                          'login4'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "login5".tr,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              fillColor: Colors.orangeAccent),
                                          validator: (value) {
                                            if (value != null &&
                                                value.trim().isEmpty) {
                                              return 'login6'.tr;
                                            }
                                          },
                                          onChanged: (value) {
                                            lname = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: 280),
                              child: Text(
                                'login7'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(right: 80),
                                    hintText: "login8".tr,
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    fillColor: const Color(0x0ff63200),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'login9'.tr;
                                    }
                                    // Check if the entered email has the right format
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return 'login10'.tr;
                                    }
                                    // Return null if the entered email is valid
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 80),
                                        child: Text(
                                          'login11'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextFormField(
                                        obscureText: password,
                                        decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: _passwordd,
                                              child: Icon(password
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                            ),
                                            hintText: 'login12'.tr,
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            fillColor: Colors.orangeAccent),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'login13'.tr;
                                          }
                                          if (value.trim().length < 8) {
                                            return 'login14'.tr;
                                          }
                                          // Return null if the entered password is valid
                                          return null;
                                        },
                                        onChanged: (value) => pwd = value,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                //confirmPassword
                                Flexible(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Text(
                                          'login15'.tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: TextFormField(
                                          obscureText: Confirmpasswordd,
                                          decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                onTap: _Confirmpasswordd,
                                                child: Icon(Confirmpasswordd
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                              ),
                                              hintText: 'login16'.tr,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              fillColor: Colors.orangeAccent),
                                          validator: (value) {
                                            if (value != null &&
                                                value.trim().isEmpty) {
                                              return 'login17'.tr;
                                            }
                                            if (value != pwd) {
                                              return 'login18'.tr;
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            cpwd = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 250),
                              child: Text(
                                'login19'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9, right: 9),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "login20".tr,
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    fillColor: Colors.orangeAccent),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'login21'.tr;
                                  }
                                  if (value.trim().length < 10) {
                                    return 'login22'.tr;
                                  }
                                  // Return null if the entered password is valid
                                  return null;
                                },
                                onChanged: (value) => mno = value,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF2F2E4D)),
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => const Login()));
                                  // }
                                  if (_formKey.currentState!.validate()) {
                                    registerfun();
                                  }
                                },
                                child: Text('login23'.tr),
                              ),
                            ),
                          ],
                        )))
              ]),
            ),
          ),
        ));
  }

  void _passwordd() {
    setState(() {
      password = !password;
    });
  }

  void _Confirmpasswordd() {
    setState(() {
      Confirmpasswordd = !Confirmpasswordd;
    });
  }

  void registerfun() async {
    http.Response res = await AuthRepo.registerApi(
        mno: mno, pwd: pwd, fname: fname, lname: lname, email: email);
    //print(1111111);
    print(res.body);
    print("${RegisterUrl.baseuri}?action=signup&mno=" +
        mno +
        "&pwd=" +
        pwd +
        "&fname=" +
        fname +
        "&lname=" +
        lname +
        "&email=" +
        email);
    if (res != null) {
      var response = jsonDecode(res.body);

      if (response["message"] == "Successfully Register") {
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

class RegisterUrl {
  static String baseuri = 'https://vstechno.co.in/news/api/user.php';
}

class AuthRepo {
  static Future registerApi(
      {required String fname,
      required String lname,
      required String email,
      required String mno,
      required String pwd}) async {
    return await get(Uri.parse("${RegisterUrl.baseuri}?action=signup&mno=" +
        mno +
        "&pwd=" +
        pwd +
        "&fname=" +
        fname +
        "&lname=" +
        lname +
        "&email=" +
        email));
    // body: {'mno': '$mno', 'pwd': '$pwd'});
  }
}
