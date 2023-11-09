import 'package:deneme_a/basvuruGecmisi.dart';
import 'package:deneme_a/profilduzenle.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class profil extends StatefulWidget {
  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Center(),
          Container(color: Colors.green, width: 450,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage("assets/image/foto6.jpeg"),),),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text('Özge Dinçer'),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('ozgedincer@posta.mu.edu.tr'),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text('+90 530 000 00 00'),
            ),
          ),
          SizedBox(height: 35,),
          Container(alignment: Alignment.center,
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.bold)
              ),
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => profilduzenle() ))

              ,
              child: Text("Profil Düzenle"),
            ),
          ),
          SizedBox(height: 35,),
          Container(alignment: Alignment.center,
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.bold)
              ),
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => basvuruGecmisi() ))

              ,
              child: Text("Adres Düzenle"),
            ),
          ),







        ],),),);

  }
}