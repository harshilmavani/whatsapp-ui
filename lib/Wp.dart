import 'package:flutter/material.dart';

class Wp extends StatefulWidget {
  const Wp({Key? key}) : super(key: key);

  @override
  State<Wp> createState() => _WpState();
}

class _WpState extends State<Wp> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp',
        ),
        actions: [
          Icon(
            Icons.search,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("New Group"),
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                ),
                PopupMenuItem(
                  child: Text("Link devices"),
                ),
                PopupMenuItem(
                  child: Text("Starred Messages"),
                ),
                PopupMenuItem(
                  child: Text("Payments"),
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          labelPadding: EdgeInsets.symmetric(vertical: 10),
          controller: tabController,
          tabs: [
            Text("CHATS"),
            Text("STATUS"),
            Text("CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            height: 500,
            color: Colors.red,
          ),
          Container(
            height: 500,
            color: Colors.yellow,
          ),
          Container(
            height: 500,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
