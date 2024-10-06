import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserApiModels/UserApiModels.dart';

class UserApiHomeScreens extends StatefulWidget {
  const UserApiHomeScreens({super.key});

  @override
  State<UserApiHomeScreens> createState() => _UserApiHomeScreensState();
}

class _UserApiHomeScreensState extends State<UserApiHomeScreens> {
  List<UserApiModels> UserList = [];
  Future<List<UserApiModels>> getuserApi() async {
    final respins = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(respins.body.toString());
    if (respins.statusCode == 200) {
      for (Map i in data) {
        UserList.add(UserApiModels.fromJson(i));
      }

      return UserList;
    } else {
      return UserList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserApiHomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getuserApi(),
            builder: (BuildContext context,
                AsyncSnapshot<List<UserApiModels>> snapshot) {
              if(!snapshot.hasData){
                return Center(
                  child:  CircularProgressIndicator(),
                );

              }else{
                return ListView.builder(
                    itemCount: UserList.length,

                    itemBuilder: (context, indext){

                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           CostomRow(name: 'Name ', value: snapshot.data![indext].name.toString()),
                              SizedBox(height: 3,),
                              CostomRow(name: 'username', value: snapshot.data![indext].username.toString()),
                              SizedBox(height: 3,),
                              CostomRow(name: 'email ', value: snapshot.data![indext].email.toString()),
                              CostomRow(name: 'address ', value: snapshot.data![indext].address!.city.toString()),
                              SizedBox(height: 3,),
                              CostomRow(name: 'street ', value: snapshot.data![indext].address!.street.toString()),
                              CostomRow(name: 'phone ', value: snapshot.data![indext].phone.toString()),


                            ],
                          ),
                        ),
                      );
                    });
              }

            },
          ))
        ],
      ),
    );
  }
}


class CostomRow extends StatelessWidget {
  String name , value ;
  CostomRow({super.key, required this.name, required this.value});


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(name),
          Text(value),

        ],

      ),
    );
  }
}
