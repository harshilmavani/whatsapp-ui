import 'package:flutter/material.dart';

import 'data.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_call),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    insetPadding: EdgeInsets.only(bottom: 200),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data[index]['image']),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, left: 7),
                              child: Text(
                                data[index]['category'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(data[index]['image']),
              ),
            ),
            title: Text(data[index]['category']),
            subtitle: Text(data[index]['price'].toString()),
            trailing: Icon(Icons.call),
          );
        },
      ),
    );
  }
}
