import 'package:flutter/material.dart';
import 'package:lanceme_up/ui/home_pages/email_page.dart';
import 'package:lanceme_up/ui/home_pages/home_page_one.dart';
import 'package:lanceme_up/ui/home_pages/notifications_page.dart';
import 'package:lanceme_up/ui/home_pages/profile_page.dart';
import 'package:lanceme_up/ui/home_pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> listWidgets = [
    HomeDetail(),
    SearchPage(),
    EmailPage(),
    NotificationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidgets[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 2.0))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Color.fromRGBO(85, 105, 135, 1),
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/Search.png"),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mail_outline,
                  ),
                  label: 'Email',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/notifications.png"),
                  ),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/profile.png"),
                  ),
                  label: 'Profile',
                ),
              ],
              // selectedItemColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
