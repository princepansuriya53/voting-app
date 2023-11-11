import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ova/extra.dart';
import 'package:ova/home.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final _formkey = GlobalKey<FormState>();
  final stored = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        elevation: 5,
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Color(0xFF2F2E4D),
        contentTextStyle: const TextStyle(
          fontSize: 17.5,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
          child: Text(
            'Data Of Candidate',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Form No.6 Data
              Text("${stored.read('GJ')}"),
              Text("${stored.read("Date1")}"),
              Text("${stored.read('bdayDocumnets')}"),
              //detail No2. data
              Text("${stored.read('Ename')}"),
              Text("${stored.read('Surname')}"),
              Text("${stored.read('Number')}"),
              Text("${stored.read('Mail')}"),
              //detail No3.data
              Text("${stored.read('RName')}"),
              Text("${stored.read('Relative')}"),
              //detail No4.data
              Text("${stored.read('ghar')}"),
              Text("${stored.read('seri')}"),
              Text("${stored.read('gam')}"),
              Text("${stored.read('postoff')}"),
              Text("${stored.read('Pcode')}"),
              Text("${stored.read('sv1')}"),
              Text("${stored.read('sv2')}"),
              // Page Data
              Text("${stored.read('Date2')}"),
              Text("${stored.read('nameapp')}"),
              Text("${stored.read('place')}"),
              //Elevated button(save)
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate())
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text('Successfully Saved')))
                            .closed
                          ..then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage())));
                    },
                    child: const Text('Save',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w600))),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
