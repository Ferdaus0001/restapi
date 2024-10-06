import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotosModlesHomeScreen extends StatefulWidget {
  const GetPhotosModlesHomeScreen({super.key});

  @override
  State<GetPhotosModlesHomeScreen> createState() => _GetPhotosModlesHomeScreenState();
}

class _GetPhotosModlesHomeScreenState extends State<GetPhotosModlesHomeScreen> {
  List<Getphootsmodles2> phootsList = [];

  Future<List<Getphootsmodles2>> getphotosapi() async {
    final response = await http.get(Uri.parse('https://upload-img-cloduniry.vercel.app/api/v1/all-images'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      phootsList.clear(); // Clear the list before adding new items
      for (Map<String, dynamic> i in data) {
        phootsList.add(Getphootsmodles2(avatar: i['avatar']));
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
        title: Text('Get Photos Models'),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getphotosapi(),
          builder: (context, AsyncSnapshot<List<Getphootsmodles2>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading images'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No images found'));
            }

            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data![index].avatar),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Getphootsmodles2 {
  final String avatar;
  Getphootsmodles2({required this.avatar});
}
