// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  String name;
  String time;
  String icon;
  bool isRead;

  NotificationList({
    Key? key,
    required this.name,
    required this.time,
    required this.icon,
    required this.isRead,
  }) : super(key: key);
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 2.0))),
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getIcon(),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Text(
                              widget.name,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  widget.time,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: widget.isRead
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: IconButton(
                    onPressed: () {},
                    icon: widget.isRead
                        ? Icon(
                            Icons.circle,
                            color: Colors.green.shade600,
                            size: 15,
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getIcon() {
    switch (widget.icon) {
      case "download":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.green.shade600,
          child: Image.asset('assets/icons/download.png'),
        );

      case "mention":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.grey.shade600,
          child: Icon(Icons.alternate_email),
        );

      case "track":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.blue.shade600,
          child: Icon(Icons.av_timer_rounded),
        );

      case "remove":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.red.shade600,
          child: Image.asset('assets/icons/remove.png'),
        );

      case "reject":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.orange.shade600,
          child: Icon(
            Icons.cancel_outlined,
            color: Colors.white,
          ),
        );

      case "accept":
        return CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.green.shade400,
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ),
        );
    }
  }
}
