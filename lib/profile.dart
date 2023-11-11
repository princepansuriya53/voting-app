import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:ova/updateprofile.dart';
import 'package:image_picker/image_picker.dart';

final storage = GetStorage();

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image = null;
  late final _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
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
        user = item; 
        storage.write('fname', user[0]['FirstName']);
        storage.write('lname', user[0]['LastName']);
        storage.write('eid', user[0]['EmailId']);
        storage.write('mno', user[0]['MobileNo']);
        storage.write('add', user[0]['Address']);
        storage.write('city', user[0]['City']);
        storage.write('state', user[0]['State']);
      });
    } else {
      setState(() {
        user = [];
      });
    }
  }

  Future getImagebyGallery(context) async {
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2F2E4D),
          title: Text('Profile'),
        ),
        body: ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: storage.read('image') == null
                          ? CircleAvatar(
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 150,
                                ),
                                onTap: () => getImage(context),
                              ),
                            )
                          : Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(storage.read('image'))),
                                  radius: 50,
                                ),
                                Positioned(
                                  right: 5.0,
                                  child: InkWell(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      // This is where the _image value sets to null on tap of the red circle icon
                                      onTap: () => getImage(context)),
                                )
                              ],
                            ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 68,
                          width: 400,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text('Userid'),
                                subtitle: Text(user[index]['Users_id']),
                              )),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 68,
                          width: 400,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text('Firstname'),
                                subtitle: Text(user[index]['FirstName']),
                              )),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 68,
                          width: 400,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text('Lastname'),
                                subtitle: Text(user[index]['LastName']),
                              )),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 68,
                          width: 400,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text('Email'),
                                subtitle: Text(user[index]['EmailId']),
                              )),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 68,
                          width: 400,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text('Mobile No'),
                                subtitle: Text(user[index]['MobileNo']),
                              )),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF2F2E4D)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Uprofile()));
                      },
                      child: const Text('Update Profile'),
                    ),
                  ],
                )));
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
                  title: const Text('Gallery',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.photo, color: Colors.blue),
                  onTap: () => getImagebyGallery(context),
                ),
                const Divider(height: 1, color: Colors.blueGrey),
                ListTile(
                  title: const Text('Camera',
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
