import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;

import '../APIModelsData/APIModelsDatas.dart';

class APIHomeScreen extends StatefulWidget {
  const APIHomeScreen({super.key});

  @override
  State<APIHomeScreen> createState() => _APIHomeScreenState();
}

class _APIHomeScreenState extends State<APIHomeScreen> {
  List<ApiModelsDatas>  PostList  = [];

  Future<List<ApiModelsDatas>> getpushapi()async{

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        PostList.add(ApiModelsDatas.fromJson(i));
      }
       return PostList;
    }else{
return PostList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('APIHomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
       Expanded(
         child: FutureBuilder(future: getpushapi(),
             builder: (context ,shapshot){
           if(!shapshot.hasData){
             PostList.clear();
            return Text('Loding ');
           }else{
           return ListView.builder(
             itemCount: PostList.length,
               itemBuilder: (context , indext ){
         
                 return Card(
                   elevation: 11,
                   shadowColor: Colors.blue,
                   child: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Title ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                     Text(PostList[indext].title.toString()),
                         Text('Descreptions ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                         Text(PostList[indext].body.toString()),
                       ],
                     ),
                   ),
                 );
               });
           }
             }),
       )
        ],
      ),
    );
  }
}
