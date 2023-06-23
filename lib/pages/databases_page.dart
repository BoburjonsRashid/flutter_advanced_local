import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/user_model.dart';

import '../service/get_service.dart';
import '../service/hive_service.dart';
import '../service/log_service..dart';

class DatabasePage extends StatefulWidget {
  static final String id = "/database_page";
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  @override
  void initState() {
  super.initState ();

  var user = User ("101", "pdp@gmail.com", "123qwe");
  GetService.storeUser (user);
  var user2 = GetService.loadUser();
  LogService.i(user2.toJson().toString());
  }



  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
     title: const Text ("Database"), ), // AppBar
     body: const Center (
     child: Text("Local Databases"),)
    );
  }
}
