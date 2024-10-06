import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Api2Models/Modles2.dart';

class Api2HomeScreen extends StatefulWidget {
  const Api2HomeScreen({super.key});

  @override
  State<Api2HomeScreen> createState() => _Api2HomeScreenState();
}

class _Api2HomeScreenState extends State<Api2HomeScreen> {
  List<Modles2> Postlit = [];
  Future<List<Modles2>> Getpost()async{
    final respin = await http.get(Uri.parse('afasdfsdfd'));
    var data = jsonDecode(respin.body.toString());
    if(respin.statusCode == 200){
      for(Map i in data ){
        Postlit.add(Modles2.fromJson(i));

      }
      return Postlit;
    }else{
      return Postlit;
    }
  }


  // List<Modles2> Posltlist = [];
  // Future<List<Modles2>> getpostlist ()async {
  //   final respons = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var data = jsonDecode(respons.body.toString());
  //   if(respons.statusCode == 200 ){
  //     for(Map i in data){
  //       Posltlist.add(Modles2.fromJson(i));
  //
  //     }
  //     return Posltlist;
  //   }else{
  //     return Posltlist;
  //   }
  // }
  // List<Modles2> Postlist = [];
  // Future<List<Modles2>> getpostapoi() async {
  //   final respins =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var data = jsonDecode(respins.body.toString());
  //   if (respins.statusCode == 200) {
  //     for (Map i in data) {
  //       Postlist.add(Modles2.fromJson(i));
  //     }
  //     return Postlist;
  //   } else {
  //     return Postlist;
  //   }
  // }

  //
  //
  // List<Modles2>  postlist = [];
  //  Future<List<Modles2>> getpostapi ()async {
  //    final respins = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //    var data = jsonDecode(respins.body.toString());
  //    if(respins.statusCode == 200 ){
  //     for(Map i  in data ){
  //       postlist.add(Modles2.fromJson(i));
  //
  //
  //      }
  //     return postlist;
  //    }else{
  //    return postlist;
  //    }
  //  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api 2 Home '),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
