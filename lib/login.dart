import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:ova/forgotpassword.dart';
import 'Signup.dart';
import 'home.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool password = true;
  bool _email = true;
  String email = '';
  String pwd = '';
  bool shouldPop = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          SystemChannels.platform.invokeMethod('SystemNavigator.pop') as bool,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF627192),
            Color(0xFF627192),
            Color(0xFF627192),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Welcome Back',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                          Lottie.asset(
                            'image/login1.json',
                            height: 150,
                            width: 200,
                          )
                        ],
                      )
                    ],
                  )),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xFF627192),
                                      blurRadius: 20,
                                      offset: Offset(10, 10))
                                ]),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 230),
                                  child: Text(
                                    'E-Mail',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "abc123@gmail.com",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        //.trim(remove space)
                                        return 'Please enter your email address';
                                      }
                                      // Check if the entered email has the right format
                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      // Return null if the entered email is valid
                                      return null;
                                    },
                                    onChanged: (value) => email = value,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Padding(
                                  padding: EdgeInsets.only(right: 210),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  child: TextFormField(
                                    obscureText: password,
                                    decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap: _passwordd,
                                          child: Icon(password
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        hintText: "Enter Password",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: Colors.orangeAccent),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Fpassword()),
                                    );
                                  },
                                  child: const Text('Forgot Password?')),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF2F2E4D)),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  loginfun();
                                }
                              },
                              child: const Text('  Login  '),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account ?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                                child: const Text('Signup',
                                    style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _passwordd() {
    setState(() {
      password = !password;
    });
  }

  void loginfun() async {
    http.Response res = await AuthRepo.registerApi(pwd: pwd, email: email);
    print(
        "${RegisterUrl.baseuri}?action=signin&email=" + email + "&pwd=" + pwd);
    var response = jsonDecode(res.body);
    var response1 = jsonDecode(res.body)['data'];
    print("------------------$response");
    print('**********$response1');
    if (response["message"] == "Successfully Login") {
      setState(() {
        storage.write('login', response1);
        storage.write('email', response1[0]['email']);
        storage.write('xyz', response1[0]['Users_id']);
        print("^^^^^^^^^^^^^^^^^^^^${response1[0]['Users_id']}");
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text("${response["message"]}"),
            ),
          )
          .closed
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())));
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

class RegisterUrl {
  static String baseuri = 'https://vstechno.co.in/news/api/user.php';
}

class AuthRepo {
  static Future registerApi(
      {required String email, required String pwd}) async {
    return await get(Uri.parse(
        "${RegisterUrl.baseuri}?action=signin&email=" + email + "&pwd=" + pwd));
    // body: {'mno': '$mno', 'pwd': '$pwd'});
  }
}
