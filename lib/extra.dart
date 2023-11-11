import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = <Widget>[];

  @override
  void initState() {
    pages.add(HomeScreen());
    pages.add(CategoryScreen());
    pages.add(SettingScreen());
    pages.add(menuscreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('BottomNavigationBar')),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category,
                      color: Colors.white,
                    ),
                    label: 'Category',
                    backgroundColor: Colors.black38),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.black38),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                    label: 'Setting',
                    backgroundColor: Colors.black38),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    label: 'menus',
                    backgroundColor: Colors.black38),
              ],
              currentIndex: _currentIndex,
              backgroundColor: Colors.pink,
              selectedItemColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        // focusColor: Colors.green,
        // backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
        child: const Icon(
          Icons.playlist_add_rounded,
          size: 30,
          color: Colors.white,
        ),
        // onPressed: () => setState(() {
        //   _currentIndex = 1;
        // }),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Signin()));
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
        child: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
          child: Text('Category', style: TextStyle(color: Colors.white))),
    );
  }
}

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
          child: Text('Settings', style: TextStyle(color: Colors.white))),
    );
  }
}

class menuscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
          child: Text('menu', style: TextStyle(color: Colors.white))),
    );
  }
}
