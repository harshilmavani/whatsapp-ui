import 'package:flutter/material.dart';
import 'package:wpui/data.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
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
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(data[index]['image']),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.message,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.call,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.video_call_rounded,
                                    color: Colors.teal,
                                  ),
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                            ),
                          )
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
            title: Text(
              data[index]['title'],
              maxLines: 1,
            ),
            subtitle: Text(data[index]['category']),
            trailing: Text(data[index]['price'].toString()),
          );
        },
      ),
    );
  }
}
