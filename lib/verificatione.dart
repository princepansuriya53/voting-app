import 'package:flutter/material.dart';
import 'package:ova/otp.dart';
import 'package:get/get.dart';

class Verification extends StatefulWidget {
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  String verification = '';
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('verificatione'.tr);
      debugPrint(verification);
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text('verificatione1'.tr),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF627192),
          Color(0xFF627192),
          Color(0xFF627192),
        ])),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "verificatione2".tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.orangeAccent),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'verificatione3'.tr;
                  }
                  if (value.trim().length <=10) {
                    return 'verificatione4'.tr;
                  }
                  // Return null if the entered password is valid
                  return null;
                },
                onChanged: (value) => verification = value,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => OTP()));
                    // }
                  },
                  child: Text('verificatione5'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
