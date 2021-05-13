import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScreenRegisterBloc{

   String name = " ";
   String age = " ";

  final StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

   void dispose() {
     _streamController.close();
   }

   void SendDatabaseRegister( ){
     print("nome:" + name);
   Firestore db = Firestore.instance;
   db.collection("usuarios")
   .add(
     {
       "nome" : name,
       "age" : age,
     }
   );

 }




}
