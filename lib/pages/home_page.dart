import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/databases_page.dart';
import 'package:flutter_advanced/service/log_service..dart';
import 'package:flutter_advanced/service/prefs_service.dart';

import '../model/user_model.dart';
import '../service/http_service.dart';
import '../service/model/post_model.dart';
import '../service/secure_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

   void initState() {

    super.initState();
   //_apiPostList();
    var post = Post(id: 1, title: "PDP", body: "Online", userId: 1);
   // _apiPostCreate (post);
    //_apiPostUpdate(post);
    _apiPostDelete(post);
  }
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      LogService.i(response.toString()), });
  }
  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      LogService.i(response.toString()), });
  }
  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      LogService.i(response.toString()), });
  }
  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty()).then((response) => {
      LogService.i(response.toString()), });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container (
          padding: const EdgeInsets.all (30), child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center,
            children: [
            MaterialButton (
            color: Colors.blue,
            onPressed: () {
            },
            child: const Text ("str_packages").tr(), ) ,
              MaterialButton (
                color: Colors.blue,
                onPressed: () {
                },
                child: const Text ("str_localization").tr(), ) ,
              MaterialButton (
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, DatabasePage.id);
                },
                child: const Text ("str_local_databases").tr(), ) ,
              MaterialButton (
                color: Colors.blue,
                onPressed: () {

                },
                child: const Text ("str_networking").tr(), ) ,

              Row(
                children: [
                  SizedBox(width: 30,),
                  MaterialButton (
                    color: Colors.greenAccent,
                    onPressed: () {
                      context. setLocale (const Locale ('en' , 'Us'));
                    },
                    child: const Text ("english"), ) ,
                  const SizedBox(width: 12,),
                  MaterialButton (
                    color: Colors.red,
                    onPressed: () {
                      context. setLocale (const Locale ('ru' , 'RU'));
                    },
                    child: const Text ("russian"), ) ,
                  const SizedBox(width: 12,),
                  MaterialButton (
                    color: Colors.yellow,
                    onPressed: () {
                      context. setLocale (const Locale ('uz' , 'UZ'));
                    },
                    child: const Text ("uzb"), ) ,
                ],
              )
            ])
    )// MaterialButton
    );
  }
}
