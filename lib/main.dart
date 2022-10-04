import "package:flutter/material.dart";
import 'settings.dart';
import 'profile_page/profile_page.dart';
import 'user_properties_page/user_properties_page.dart';
import 'home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State {
  var _currentPage = 0;

  var pages = [HomePage(), UserPropertiesPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ToDo App",
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Settings.backgroundColor,
            body: Center(child: pages.elementAt(_currentPage)),
            bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: Settings.homePageName),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: Settings.userPropertiesPageName),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: Settings.profilePageName),
                ],
                currentIndex: _currentPage,
                fixedColor: Settings.backgroundColor,
                onTap: (int inIndex) {
                  setState(() {
                    _currentPage = inIndex;
                  });
                }),
          ),
        ));
  }
}
