// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Text(
                      'Lancemeup',
                      style: TextStyle(
                        color: Color.fromRGBO(15, 14, 19, 1),
                        fontSize: 14,
                      ),
                    ),
                    Icon(CupertinoIcons.chevron_down)
                  ],
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/lego.png'),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.search,
                      color: Color.fromRGBO(15, 14, 19, 1),
                    ),
                  ),
                ],
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.lightGreen,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                        child: Row(
                      children: [
                        Icon(Icons.work_outline_rounded),
                        Text('Project Tools'),
                      ],
                    )),
                    Tab(
                        child: Row(
                      children: [
                        Icon(CupertinoIcons.chat_bubble),
                        Text('Chat'),
                      ],
                    )),
                    Tab(
                        child: Row(
                      children: [
                        Icon(CupertinoIcons.folder),
                        Text('Drive'),
                      ],
                    )),
                    Tab(
                        child: Row(
                      children: [
                        Icon(Icons.av_timer_rounded),
                        Text('Track'),
                      ],
                    )),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ProjectPage(),
              Text('two'),
              Text('three'),
              Text('three'),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WorkCard(template: "Kanban"),
          WorkCard(template: "Scrum"),
          WorkCard(template: "Bug Report"),
        ],
      ),
    );
  }
}

class WorkCard extends StatelessWidget {
  const WorkCard({
    Key? key,
    required this.template,
  }) : super(key: key);
  final String template;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(213, 218, 225, 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Revamp Project',
                    style: TextStyle(
                      color: Color.fromRGBO(15, 14, 19, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ImageIcon(
                      AssetImage("assets/icons/globe.png"),
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    'Template:',
                    style: TextStyle(
                      color: Color.fromRGBO(136, 150, 171, 1),
                      fontSize: 14,
                    ),
                  ),
                  Text(template),
                  Text('')
                ]),
                TableRow(children: [
                  Text(
                    'Status:',
                    style: TextStyle(
                      color: Color.fromRGBO(136, 150, 171, 1),
                      fontSize: 14,
                    ),
                  ),
                  Text('On Hold'),
                  Text('')
                ]),
                TableRow(children: [
                  Text(
                    'Last Updated',
                    style: TextStyle(
                      color: Color.fromRGBO(136, 150, 171, 1),
                      fontSize: 14,
                    ),
                  ),
                  Text('2m ago'),
                  Text('')
                ])
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: LinearPercentIndicator(
              //leaner progress bar
              width: 288,
              barRadius: const Radius.circular(8),
              animation: true, //animation to show progress at first
              animationDuration: 1000,
              lineHeight: 7.0, //height of progress bar
              trailing: Padding(
                //sufix content
                padding: EdgeInsets.only(left: 15),
                child: Text("40%"), //right content
              ),
              percent: 0.4, // 30/100 = 0.3

              progressColor: Colors
                  .lightGreen, //percentage progress bar color//background progressbar color
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 130,
            // alignment: FractionalOffset.centerLeft,
            child: new Stack(
              //alignment:new Alignment(x, y)
              children: <Widget>[
                Image.asset('assets/images/7.png'),
                new Positioned(
                  left: 20.0,
                  child: new Image.asset('assets/images/6.png'),
                ),
                new Positioned(
                  left: 40.0,
                  child: new Image.asset('assets/images/3.png'),
                ),
                new Positioned(
                  left: 60.0,
                  child: new Image.asset('assets/images/7.png'),
                ),
                new Positioned(
                  left: 80.0,
                  child: new Image.asset('assets/images/6.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
