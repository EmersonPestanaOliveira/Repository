import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScreenHomeBloc {

  var dados;

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  void LoadingDatabase() async {
    Firestore db = Firestore.instance;
    db.collection("usuarios")
        .snapshots()
        .listen(
            (snapshot) {
          for (DocumentSnapshot item in snapshot.documents) {
            dados = item.data;
            print("dados: " + dados["nome"] + "  Idade: " + dados["age"]);
          }
        }
    );
  }
}