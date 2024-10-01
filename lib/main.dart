import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RESTHomeScreens/RESTHomeScreens.dart';

void main(){
  runApp(RESTAPIs());
}



class RESTAPIs extends StatelessWidget{
  const RESTAPIs({super.key});

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: RESTHomeScreen(),
     );
  }

}