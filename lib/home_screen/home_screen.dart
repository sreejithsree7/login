// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield/constants/constans.dart';
import 'package:textfield/login_screen/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOME PAGE'),
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Are you sure?'),
                      title: Text('Alert!!'),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setBool('isLogin', false);
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('logout successfull')));
                            },
                            child: Text('yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'))
                      ],
                      // content: SizedBox(
                      //   height: 100,
                      //   width: 100,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         'Are you sure?',
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 20),
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         children: [
                      //           Text('yes'),
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           Text('No'),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                    );
                  },
                );
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: index % 2 == 0
              ? CircleAvatar(
                  backgroundImage: NetworkImage(imageUrls[index]),
                )
              : Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imageUrls[index]))),
                  height: 35,
                  width: 35,
                ),
          title: Text(studentNames[index]),
          subtitle: Text(studentMsg[index]),
          trailing: Text('$index'),
        ),
      ),
    );
  }
}
