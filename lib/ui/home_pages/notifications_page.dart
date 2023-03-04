import 'package:flutter/material.dart';
import 'package:lanceme_up/model/notification.dart';
import 'package:lanceme_up/widgets/notificationList.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notifications> notifications = [
    Notifications(
      text: "Jane Cooper has downloaded 'Wireframing Landing Page'",
      time: "2m ago",
      icon: "download",
    ),
    Notifications(
      text: "Jane Cooper has mentioned you on Lancemeup workspace",
      time: "2m ago",
      icon: "mention",
    ),
    Notifications(
      text: "[REMINDER] Due date of Lancemeup Projects task will be coming",
      time: "2m ago",
      icon: "track",
    ),
    Notifications(
      text: "Jane Copper has removed you from workspace",
      time: "2m ago",
      icon: "remove",
    ),
    Notifications(
      text: "Jane Copper reject the invitation from workspace",
      time: "2m ago",
      icon: "reject",
    ),
    Notifications(
      text: "Jane Copper accepted the invitation from workspace",
      time: "2m ago",
      icon: "accept",
    ),
    Notifications(
      text: "Jane Copper accepted the invitation from workspace",
      time: "2m ago",
      icon: "accept",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Color.fromRGBO(15, 14, 19, 1),
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('All')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('Invites')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('Mentions')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('Workspace')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('Emails')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Text('Unread')),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: ListView.builder(
                itemCount: notifications.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  return NotificationList(
                    name: notifications[index].text,
                    time: notifications[index].time,
                    icon: notifications[index].icon,
                    isRead: (index == 0 || index == 1) ? true : false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
