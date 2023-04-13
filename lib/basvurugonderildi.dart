import 'package:deneme_a/harita.dart';
import 'package:deneme_a/profil.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class basvurugonderildi extends StatefulWidget {
  @override
  State<basvurugonderildi> createState() => _basvurugonderildiState();
}

class _basvurugonderildiState extends State<basvurugonderildi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:Icon(Icons.account_circle_outlined),label: 'Profil'),
        BottomNavigationBarItem(icon:Icon(Icons.add_alert_rounded),label: 'Başvur'),
        BottomNavigationBarItem(icon:Icon(Icons.airplay),label: 'Geçmiş'),
      ]),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Center(),
          SizedBox(height: 90,),
          Container(alignment:Alignment.bottomCenter,width: 250,height: 225,
            child: Image.asset("assets/image/foto6.png",cacheWidth: 334,cacheHeight: 265,),),
          SizedBox(height: 50,),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text('Başvurunuz başarılı bir şekilde gönderildi.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
            ),
          ),
          SizedBox(height: 50,),
          Container(alignment: Alignment.center,
            width: double.infinity,
            height: 38,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.bold)
              ),
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => profil() ))

              ,
              child: Text("Tamam"),
            ),
          ),
        ],),),);

  }
}