import 'package:flutter/material.dart';
import 'package:lanceme_up/model/user.dart';
import 'package:lanceme_up/widgets/conversationList.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  List<Users> chatUsers = [
    Users(
        text: "Welcome to LMU mailer",
        secondaryText:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        image: "assets/images/user1.png",
        time: "8:00 AM",
        attachedFile: ""),
    Users(
        text: "Unread email & starred",
        secondaryText:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        image: "",
        time: "Dec 19",
        attachedFile: ""),
    Users(
        text: "Important Email",
        secondaryText:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        image: "",
        time: "Dec 18",
        attachedFile: ""),
    Users(
        text: "Email with Attachment",
        secondaryText:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        image: "",
        time: "8:00 AM",
        attachedFile: "CoverPreview.jpg"),
    Users(
        text: "Email with zip Attachment",
        secondaryText:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
        image: "",
        time: "8:00 AM",
        attachedFile: "image_file.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search mails",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade100)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/images/user.png')),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('All Inbox'),
          ),
          SingleChildScrollView(
            child: Container(
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name: chatUsers[index].text,
                    messageText: chatUsers[index].secondaryText,
                    imageUrl: chatUsers[index].image,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 1) ? true : false,
                    attachedFile: chatUsers[index].attachedFile,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromRGBO(187, 247, 208, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.edit),
              ),
              Text('Compose New Email'),
            ],
          ),
        ),
      ),
    );
  }
}
