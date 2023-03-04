import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lanceme_up/ui/auth/login_screen.dart';
import 'package:lanceme_up/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade300, width: 2.0))),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user1.png')
                              as ImageProvider,
                          maxRadius: 30,
                        ),
                        Positioned(
                            right: 0,
                            top: 40,
                            child: Icon(
                              Icons.circle,
                              color: Colors.green.shade400,
                              size: 20,
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jane Copper',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'janecopper@gmail.com',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 2.0))),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_search_outlined),
                                Text(' Set Status')
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.green.shade400,
                                  size: 12,
                                ),
                                Text(' Online'),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.person),
                                Text(' Account')
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text(' Activity')
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.person_2),
                                Text(' Connections')
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 2.0))),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'App Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.bell),
                                Text(' Notifications')
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.palette_outlined),
                                Text(' Appearance')
                              ],
                            ),
                            Row(
                              children: [
                                Text(' Light'),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 2.0))),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/privacy.png'),
                            Text(' Privacy Policy')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.doc_text),
                            Text(' Terms & Conditions')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.question_circle),
                                Text(' Help & Support')
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.question_circle),
                                Text(" FAQ's")
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text('Account')),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 250,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text('Are you sure?',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              'Are you sure you want to Logout from the Workspace?'),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                                minimumSize:
                                                    const Size.fromHeight(50),
                                              ),
                                              onPressed: () {
                                                auth.signOut().then((value) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginScreen()));
                                                }).onError((error, stackTrace) {
                                                  Utils().toastMessage(
                                                      error.toString());
                                                });
                                              },
                                              child: const Text('Logout'),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              minimumSize:
                                                  const Size.fromHeight(50),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                              Text(
                                " Logout",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
