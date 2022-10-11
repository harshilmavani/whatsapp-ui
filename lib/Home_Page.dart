import 'package:flutter/material.dart';
import 'package:wpui/calls_screen.dart';
import 'package:wpui/chats_screen.dart';
import 'package:wpui/status_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
        title: Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value) {},
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
          controller: tabController,
          labelPadding: EdgeInsets.symmetric(vertical: 10),
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
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
