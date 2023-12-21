import 'package:deneme_a/BottomNavBarExample.dart';
import 'package:deneme_a/HomePage.dart';
import 'package:deneme_a/basvuru.dart';
import 'package:deneme_a/basvuruGecmisi.dart';
import 'package:deneme_a/blockchain.dart' as b;
import 'package:deneme_a/api.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/toplayiciGiris.dart';
import 'package:flutter/material.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:deneme_a/kayitekrani.dart';
import 'package:deneme_a/verifyphone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'basvuru.dart';
import 'islemGecmisi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}



