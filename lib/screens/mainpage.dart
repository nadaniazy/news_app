import 'package:flutter/material.dart';
import 'package:news_app/screens/profile.dart';

import 'Home.dart';
import 'favourite.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  List screens = [Home(), Favourite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.125,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
                bottom: MediaQuery.of(context).size.height * 0.03),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: BottomNavigationBar(
                  currentIndex: currentindex,
                  onTap: (index) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  fixedColor: Colors.brown,
                  selectedIconTheme: IconThemeData(color: Color(0xffFF3A44)),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedItemColor: Color(0xffA6A6A6),
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Color(0xffA6A6A6)),
                  selectedLabelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite_outline,
                        ),
                        label: "Favourite"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.face_outlined,
                        ),
                        label: "Profile"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: screens[currentindex]);
  }
}
