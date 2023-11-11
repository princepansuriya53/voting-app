import 'package:flutter/material.dart';
import 'package:ova/home.dart';
import 'package:ova/login.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

final storage = GetStorage();

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  bool _values = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title: Text('Terms and conditione'.tr),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF627192),
          Color(0xFF627192),
          Color(0xFF627192),
        ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Online Voting App:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """We thank you for sparing your valuable time for using Voter Helpline Application. Before proceeding further, we encourage you to read the terms carefully and agree to abide by it. Should you have any reservations about the following terms set out for the app, you are free to exit and uninstall the app.""",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """This version of the Voter Helpline App has been built on the basis of functional testing and feedback through beta testing. Additional inputs from the users for this version shall be evaluated on their merit, and only suggestions found suitable by ECI shall be incorporated in the iterative builds and consequential final release of the app. Therefore, you are encouraged to always use the latest build of the Voter Helpline App whenever updates are available.""",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """The Voter Helpline App offers the convenience to all Citizensof finding names in the electoral roll, submitting online forms,checking the status of the application,filing complaints,viewing results, affidavits,counter-affidavits, and receiving the reply ontheir mobile app. With few clicks and minimal information, the user can find his/her voter id card using this application. The tag-based search, available at the dashboard of application,offers ease of access, and easy navigation.""",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """Citizens can browse the app, based on their own interests and learn more about Election Process in a more engaging way. The voters have access to everything about Election Commission of India. They can view the latest Press release, Current News, Events, Gallery and much more. This application is of 6 megabytes and it contains information of one terabyte.""",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  """The Election Commission of India does not give any warranties, whether express or implied, as to the suitability or usability of the mobile applications. ECI could use the uploaded data for official purpose as its own discretion without any further notice. Should you encounter any bugs, glitches, lack of functionality or other problems on the application, please let us know immediately by writing to us at itself.""",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: _values,
                      onChanged: (value) {
                        setState(() {
                          _values = value!;
                        });
                      }),
                  const Text(
                    'I accept the terms and conditions.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
                onPressed: _values ? _showlanguage : null,
                child: const Text(
                  'Click Me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showlanguage() {
    setState(() {
      _values == true;
      storage.write('term', _values);
    });
    print("---------------login---------------${storage.read('term')}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                storage.read('login') == null ? Login() : MyHomePage()));
  }
}
