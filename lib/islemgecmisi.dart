import 'package:deneme_a/harita.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class islemgecmisi extends StatefulWidget {
  @override
  State<islemgecmisi> createState() => _islemgecmisiState();
}

class _islemgecmisiState extends State<islemgecmisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Center(
            child:Text('İŞLEM GEÇMİŞİ',style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold,
                height:4)) ,),





        ],),),);

  }
}