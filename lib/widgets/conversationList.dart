import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  String attachedFile;
  bool isMessageRead;
  ConversationList({
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
    required this.attachedFile,
  });
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  bool _isFavorited = false;
  void _toggleFavorite() {
    if (_isFavorited) {
      setState(() {
        _isFavorited = false;
      });
    } else {
      setState(() {
        _isFavorited = true;
      });
    }
  }

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
                  getCircleAvatar(),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                widget.time,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: widget.isMessageRead
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
                                child: Text(
                                  widget.messageText,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: widget.isMessageRead
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: _toggleFavorite,
                                    icon: (_isFavorited
                                        ? Icon(
                                            Icons.star,
                                            color: Colors.amber[600],
                                          )
                                        : Icon(Icons.star_border))),
                              )
                            ],
                          ),
                          getAttachment(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCircleAvatar() {
    if (widget.imageUrl.isNotEmpty) {
      return CircleAvatar(
        backgroundImage: AssetImage(widget.imageUrl) as ImageProvider,
        maxRadius: 20,
      );
    } else {
      return CircleAvatar(
        backgroundColor: Color.fromRGBO(187, 247, 208, 1),
        child: const Text('A'),
        maxRadius: 20,
      );
    }
  }

  getAttachment() {
    if (widget.attachedFile.isNotEmpty) {
      return ButtonTheme(
        minWidth: 200.0,
        child: OutlinedButton(
            onPressed: () {},
            child: Text(
              widget.attachedFile,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            )),
      );
    } else {
      return Container();
    }
  }
}
