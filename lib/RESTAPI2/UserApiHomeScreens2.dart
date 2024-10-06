import 'dart:convert';

import 'package:flutter/material.dart';

import 'Api2Models/UserApiModles2/UserApiModles2.dart';
import 'package:http/http.dart'as http;

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<UserApiModles2> UserListApi = [];
  Future<List<UserApiModles2>> GetUserApi ()async{
    final respons = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(respons.body.toString());
    if(respons.statusCode == 200){
      UserListApi.clear();
      for(Map  i in data){
        UserListApi.add(UserApiModles2.fromJson(i));
      }
       return UserListApi;

    }else{
      return UserListApi;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Api '),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
      ),
      body: SafeArea(
        child: Column(
          children: [
           FutureBuilder(future: GetUserApi(), builder: (context, AsyncSnapshot<List<UserApiModles2>> shopshot){
             if(shopshot.hasData){
               return Center(child: CircularProgressIndicator(),);
             }else{
               return ListView.builder(
                   itemCount: UserListApi.length,
                   itemBuilder: (context, indext ){
                     return Card(
                       child: Column(
                         children: [
                          Row(
                            children: [
                              Text(shopshot.data![indext].name.toString()),
                            ],
                          )
                         ],
                       ),
                     );
                   }
               );
             }

           })
          ],
        ),
      ),
    );
  }
}
