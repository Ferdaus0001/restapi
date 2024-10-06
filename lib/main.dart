import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'APIHomeScreens/APIHomeScreens.dart';
import 'GetphoptModels2/GetPhootsModelsHomeScreen.dart';
import 'LoginApi/LoginAPIHomeScreen/LoginAPIHomeScreens.dart';
import 'PhotosAPI/PhotosAPIHomeScreen.dart';

import 'PostApiLoginFrom/LoginApiHomeScreen.dart';
import 'ProductApi/prodectApiHomeScreen/ProdictApiHomeScreen.dart';
import 'REST API 3/PhotoAPI3/PhotoApiHomeScreen/PhotoApiHomScreen3.dart';
import 'REST API 3/REST API HomeScreen3/APIHomeScreen3.dart';
import 'RESTAPI2/UserApiHomeScreens2.dart';
import 'UserApi/UserApiHomeScreen.dart';

void main() {
  runApp(RESTAPIs());
}

class RESTAPIs extends StatelessWidget {
  const RESTAPIs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginApiHomeScreen(),
    );
  }
}
