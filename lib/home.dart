import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'feedback.dart';
import 'formdata/form6.dart';
import 'help.dart';
import 'login.dart';
import 'otp.dart';
import 'piechart.dart';
import 'result.dart';
import 'setting.dart';
import 'dart:convert';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get_storage/get_storage.dart';
import 'candidate.dart';
import 'counting.dart';
import 'status.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'voteridupload.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'dart:io';

final storage = GetStorage();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image = null;
  late final _picker = ImagePicker();
  String user_id = storage.read('xyz');
  List user = [];
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    print('@@@@@@@@@@@${storage.read('xyz')}');
    var url =
        "https://vstechno.co.in/news/api/user.php?action=getprofiledetails&user_id=$user_id";
    print("!!!!!!!!!!!!!$url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var item = jsonDecode(response.body)['data'];
      print(item);
      setState(() {
        storage.write('emailid', item[0]['EmailId']);
      });
    } else {
      setState(() {
        user = [];
      });
    }
  }

  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  Future getImagebyGallery(context) async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        storage.write('image', image.path);
      }
      Navigator.pop(context);
    });
  }

  Future getImagebyCamera(context) async {
    final PickedFile? image =
        await _picker.getImage(source: ImageSource.camera);
    setState(
      () {
        if (image != null) {
          _image = File(image.path);
          storage.write('image', image.path);
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          SystemChannels.platform.invokeMethod('SystemNavigator.pop') as bool,
      child: SideMenu(
          key: _sideMenuKey,
          menu: buildMenu(),
          type: SideMenuType.shrikNRotate,
          radius: BorderRadius.circular(20),
          background: Color(0xFF2F2E4D),
          closeIcon: const Icon(Icons.cancel),
          child: IgnorePointer(
              ignoring: isOpened,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF2F2E4D),
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => toggleMenu(),
                    ),
                    title: Text('IVOTE'.tr),
                  ),
                  body: Container(
                    width: double.infinity,
                    child: Column(children: [
                      SizedBox(height: 20),
                      Image.asset('image/4585.png'),
                      SizedBox(height: 110),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      offset: Offset(5, 8),
                                      color: Colors.black54,
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  child: Card(
                                    color: Color(0xFF627192),
                                    elevation: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('image/checklist.png',
                                            height: 75, width: 100),
                                        Text(
                                          'home'.tr,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                        Text('home1'.tr,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => data()));
                                  },
                                ),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      offset: Offset(5, 8),
                                      color: Colors.black54,
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                    child: Card(
                                      color: Color(0xFF627192),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'image/checklist.png',
                                              height: 90,
                                              width: 100,
                                            ),
                                            Text('home2'.tr,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white)),
                                          ]),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Candidate()));
                                    }),
                              )
                            ]),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 8),
                              color: Colors.black54,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: InkWell(
                            child: Card(
                              color: Color(0xFF627192),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'image/checklist.png',
                                    height: 90,
                                    width: 100,
                                  ),
                                  Text('home3'.tr,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white)),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedbackK()));
                            }),
                      ),
                    ]),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.miniCenterDocked,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        storage.write('image', null);
                        storage.write('login', null);
                      });
                      print(
                          "------------------------------${storage.read('login')}");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    backgroundColor: Color(0xFF2F2E4D),
                    child: const Icon(
                      Icons.logout,
                    ),
                    //params
                  ),
                  bottomNavigationBar: BottomAppBar(
                      shape: const CircularNotchedRectangle(),
                      notchMargin: 5,
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: BottomNavigationBar(
                            items: [
                              BottomNavigationBarItem(
                                icon: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => data()));
                                  },
                                  child: const Icon(
                                    Icons.file_present_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                label: 'home4'.tr,
                                backgroundColor: Colors.black38,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Help()));
                                  },
                                  child: const Icon(Icons.category,
                                      color: Colors.white),
                                ),
                                label: 'home5'.tr,
                                backgroundColor: Colors.black38,
                              ),
                            ],
                            backgroundColor: Color(0xFF2F2E4D),
                            unselectedItemColor: Colors.white,
                            selectedItemColor: Colors.white,
                          ),
                        ),
                      ))))),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: storage.read('image') == null
                      ? CircleAvatar(
                          child: InkWell(
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 150,
                            ),
                            onTap: () => getImage(context),
                          ),
                        )
                      : Stack(children: [
                          CircleAvatar(
                            backgroundImage:
                                FileImage(File(storage.read('image'))),
                            radius: 50,
                          ),
                          Positioned(
                            right: 5.0,
                            child: InkWell(
                                child: const Icon(Icons.camera_alt_outlined,
                                    size: 30, color: Colors.white),
                                onTap: () => getImage(context)),
                          )
                        ]),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => data()));
            },
            leading:
                const Icon(Icons.border_color, size: 20.0, color: Colors.white),
            title: Text("home6".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Status()));
            },
            leading: const Icon(Icons.delivery_dining_rounded,
                size: 20.0, color: Colors.white),
            title: Text("home7".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Upload()));
            },
            leading: const Icon(Icons.document_scanner_sharp,
                size: 20.0, color: Colors.white),
            title: Text("home8".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              // print("------------------------${storage.read('voting')}");
              // storage.read('voting') == null
              //     ?
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OTPP()));
              // : null;
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => OTPP()));
            },
            leading: const Icon(Icons.document_scanner_sharp,
                size: 20.0, color: Colors.white),
            title: Text("home9".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Piechart()));
            },
            leading: const Icon(Icons.pie_chart_rounded,
                size: 20.0, color: Colors.white),
            title: Text("home10".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Count()));
            },
            leading: const Icon(Icons.format_list_numbered_sharp,
                size: 20.0, color: Colors.white),
            title: Text("home11".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Result()));
            },
            leading: const Icon(Icons.paste_rounded,
                size: 20.0, color: Colors.white),
            title: Text("home12".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedbackK()));
            },
            leading: const Icon(Icons.feedback_rounded,
                size: 20.0, color: Colors.white),
            title: Text("home13".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Help()));
            },
            leading:
                const Icon(Icons.help_rounded, size: 20.0, color: Colors.white),
            title: Text("home14".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Setting()));
            },
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: Text("home17".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            dense: true,
          ),
        ],
      ),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  Future<void> getImage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(height: 1, color: Colors.blue),
                ListTile(
                  title: Text('home18'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery(context),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: Text('home19'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading:
                      const Icon(Icons.camera_alt_rounded, color: Colors.blue),
                  onTap: () => getImagebyCamera(context),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
              ],
            ),
          ),
        );
      },
    );
  }
}
