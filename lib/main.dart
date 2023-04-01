import 'package:deneme_a/harita.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:deneme_a/kayitekrani.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:deneme_a/takipsayfasi.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: KayitUygulama(),
    debugShowCheckedModeBanner: false,
  ));
}

class KayitUygulama extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TakipSayfasi();
  }
}

