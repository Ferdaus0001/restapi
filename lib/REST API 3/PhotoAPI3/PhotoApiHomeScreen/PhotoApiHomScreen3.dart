import 'dart:convert';

import 'package:flutter/material.dart';

import '../PhotoApi3Moldels/PhotoModels3.dart';
import 'package:http/http.dart'as http ;

class PhotoApiHomScreen3 extends StatefulWidget {
  const PhotoApiHomScreen3({super.key});

  @override
  State<PhotoApiHomScreen3> createState() => _PhotoApiHomScreen3State();
}

class _PhotoApiHomScreen3State extends State<PhotoApiHomScreen3> {
  List<PhotoModels3> PhotoListApi = [];
  Future<List<PhotoModels3>> GetPhotoApi()async{
    final respons = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(respons.body.toString());
    if(respons.statusCode == 200){
      for(Map i in  data){
        PhotoListApi.add(PhotoModels3.fromJson(i));
      }
      return PhotoListApi;
    }else{
      return PhotoListApi;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('PhotoApiHomScreen3'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              FutureBuilder(future: GetPhotoApi(), builder: (context ,AsyncSnapshot<List<PhotoModels3>> shophot){
                // if(shophot.hasData){
                //   return  Center(child: CircularProgressIndicator());
                // }
                return Expanded(
                  child: ListView.builder(
                    itemCount: PhotoListApi.length,
                      itemBuilder: (context, indext ){
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage((shophot.data![indext].url.toString()),)),
                      subtitle: Text(shophot.data![indext].title.toString()),
                      title: Text(shophot.data![indext].albumId.toString()),
                      trailing: CircleAvatar(child: Text(shophot.data![indext].id.toString())),
                    );
                  }),
                );
              })
          ],
        ),
      ),
    );
  }
}
