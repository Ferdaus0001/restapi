import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PhotosApiModels/PhotosApiModelsdata.dart';

class PhotosAPIHomeScreens extends StatefulWidget {
  const PhotosAPIHomeScreens({super.key});

  @override
  State<PhotosAPIHomeScreens> createState() => _PhotosAPIHomeScreensState();
}

class _PhotosAPIHomeScreensState extends State<PhotosAPIHomeScreens> {
  List<Photosmodels> phootsList = [];

  Future<List<Photosmodels>> getphotosapi() async {
    final respons = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(respons.body.toString());

    if (respons.statusCode == 200) {
      phootsList.clear();  // Clear the list before adding new items
      for (Map<String, dynamic> i in data) {
        phootsList.add(Photosmodels(title: i['title'], avatar: i['url'], id: i['id']));
      }
      return phootsList;
    } else {
      return phootsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos API Home Screen'),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: FutureBuilder(
        future: getphotosapi(),
        builder: (context, AsyncSnapshot<List<Photosmodels>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shadowColor: Colors.blue,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data![index].avatar.toString()),
                      ),
                      title: Text(snapshot.data![index].title.toString()),
                      subtitle: Text('ID: ${snapshot.data![index].id.toString()}'),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
