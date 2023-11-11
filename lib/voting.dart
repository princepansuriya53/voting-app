import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ova/home.dart';

final storage = GetStorage();

class Voting extends StatefulWidget {
  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  bool _values = false;
  List<HomeModel> votinglist = [
    HomeModel(
        Image: 'image/modig.png', party_name: 'voting1'.tr, party_id: "1"),
    HomeModel(Image: 'image/INC.webp', party_name: 'voting2'.tr, party_id: "2"),
    HomeModel(Image: 'image/aap.png', party_name: 'voting3'.tr, party_id: "3"),
    HomeModel(Image: 'image/sp.jpeg', party_name: 'voting4'.tr, party_id: "4"),
    HomeModel(
        Image: 'image/nota2.png', party_name: 'voting12'.tr, party_id: "5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2E4D),
        title: Text('voting'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "voting5".tr,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              itemCount: votinglist.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return App().cards(
                  column: [
                    const SizedBox(height: 15),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage(votinglist[index].Image),
                        radius: 30,
                      ),
                      title: Text(votinglist[index].party_name,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      trailing: TextButton(
                        child: Text(
                          'voting6'.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showAlertDialog(votinglist[index].party_id,
                              votinglist[index].party_name);
                        },
                      ),
                    )
                  ],
                  height: 100,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showlanguage() {
    setState(() {
      _values == true;
      storage.write('term', _values);
    });
    print("--login--${storage.read('term')}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                storage.read('login') == null ? Voting() : MyHomePage()));
  }

  void showAlertDialog(
    party_id,
    party_name,
  ) {
    final _snackBar2 = SnackBar(
      content: Text('voting7'.tr),
      duration: const Duration(seconds: 1),
      onVisible: () {
        print('Snackbar is visible');
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(30.0),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('voting8'.tr),
          content: Text('voting9'.tr),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  setState(() {
                    storage.write('voting', true);
                  });
                  votingfun(party_id, party_name);
                  Navigator.pop(context);
                  _values ? _showlanguage : null;
                },
                child: Text('voting10'.tr)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('voting11'.tr)),
          ],
        );
      },
    );
  }

  void votingfun(party_id1, party_name1) async {
    http.Response res = await authrepo.votingapi(
        user_id: storage.read('xyz'),
        party_id: party_id1.toString(),
        party_name: party_name1);
    print(res.body);
    if (res != null) {
      var response = jsonDecode(res.body);
      if (response['message'] == 'Vote Successfully') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response['message']}')))
            .closed
          ..then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())));
      }
    }
  }
}

class votingurl {
  static String baseuri = 'https://vstechno.co.in/news/api/user.php';
}

class authrepo {
  static Future votingapi(
      {required String user_id,
      required String party_id,
      required String party_name}) async {
    return await post(Uri.parse("${votingurl.baseuri}?action=voteradd"), body: {
      'user_id': '$user_id',
      'party_id': '$party_id',
      'party_name': '$party_name'
    });
  }
}

class HomeModel {
  var Image;
  var party_name;
  var party_id;
  HomeModel(
      {required this.Image, required this.party_name, required this.party_id});
}

class App {
  Widget cards({
    required List<Widget> column,
    required double height,
  }) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Card(
          color: const Color(0xFF627192),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: column,
          ),
        ),
      ),
    );
  }
}
