import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../REST Models 3/Modles3.dart';

class APIHomeScreen3 extends StatefulWidget {
  const APIHomeScreen3({super.key});

  @override
  State<APIHomeScreen3> createState() => _APIHomeScreen3State();
}

class _APIHomeScreen3State extends State<APIHomeScreen3> {
  List<Modles2> PostList = [];

  Future<List<Modles2>> getPostList() async {
    final respons =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(respons.body.toString());
    if (respons.statusCode == 200) {
      PostList.clear();
      for (Map i in data) {
        PostList.add(Modles2.fromJson(i));
      }
      return PostList;
    } else {
      return PostList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Text('APIHomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: getPostList(),
                builder: (context, shapshot) {
                  if (!shapshot.hasData) {
                    return Center(child: Text('Loding '));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: PostList.length,
                          itemBuilder: (context, indext) {
                            return Card(
                              elevation: 6,
                                child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Title ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                 SizedBox(height: 7,),
                                 Text(PostList[indext].title.toString()),
                                  SizedBox(height: 7,),
                                  Text('Body ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text(PostList[indext].body.toString()),
                                  CircleAvatar (child: Text(PostList[indext].id.toString())),

                                ],
                              ),
                            ));
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
