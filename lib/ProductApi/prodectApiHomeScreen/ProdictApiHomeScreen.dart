import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../ProdictModles/ProdectModles.dart';

class ProdictApiHomeScreen extends StatefulWidget {
  const ProdictApiHomeScreen({super.key});

  @override
  State<ProdictApiHomeScreen> createState() => _ProdictApiHomeScreenState();
}

class _ProdictApiHomeScreenState extends State<ProdictApiHomeScreen> {
  List<ProdectModles> ProdictListApi = [];
  Future<List<ProdectModles>> GetProdictApi()async{
    final respins = await http.get(Uri.parse('https://freetestapi.com/api/v1/airports'));
    var data = jsonDecode(respins.body.toString());
    if(respins.statusCode == 200){
      ProdictListApi.clear();
      for(Map  i in data ){
        ProdictListApi.add(ProdectModles.fromJson(i));

      }
      return ProdictListApi;
    }else{
      return ProdictListApi;

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('ProdictApiHomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Column(
            children: [
                  FutureBuilder(future: GetProdictApi(), builder: (context , shaphot ){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ProdictListApi.length,
                          itemBuilder: (context , indext ){
                        return Card(
                          shadowColor: Colors.black,
                          shape: LinearBorder.start(side: BorderSide(color: Colors.blue)),
                          elevation: 11,
                          child: Expanded(child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(shaphot.data![indext].name.toString()),
                                  SizedBox(height: 6,),
                                  Text(  ' City : '+  shaphot.data![indext].city.toString()),
                                SizedBox(height: 6,),

                                Text(  ' Services  :  '+ shaphot.data![indext].services.toString()),
                                SizedBox(height: 7,),
                                CircleAvatar (child: Text(shaphot.data![indext].id.toString())),
                                SizedBox(height: 6,),
                                Text( ' AirLines : : '+ shaphot.data![indext].airlines.toString()),
                                SizedBox(height: 6,),
                               Text(shaphot.data![indext].contactInfo.toString()),
                                SizedBox(height: 6,),

                                Text(  'terminals' +shaphot.data![indext].terminals.toString()),
                                SizedBox(height: 6,),

                                Text(shaphot.data![indext].code.toString()),
                                SizedBox(height: 6,),
                                Text(shaphot.data![indext].timezone.toString()),

                              ],
                            ),
                          ),

                          ),
                        );
                      }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
