import 'package:deneme_a/harita.dart';
import 'package:deneme_a/profil.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class adres extends StatefulWidget {
  @override
  State<adres> createState() => _adresState();
}

class _adresState extends State<adres> {
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
          Center(
            child:Text('Adresinizi Girin',style: TextStyle(
                color: Colors.black, fontSize: 14,height: 10, fontWeight: FontWeight.bold
            )) ,),
          Container(width: 245, height:40 ,
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration( prefixIcon: Icon(Icons.accessibility_new_rounded),
                  border: OutlineInputBorder(),
                  labelText: 'Konum'
              ) ,
            ),
          ),

      Container(alignment:Alignment.bottomCenter,width: 250,height: 230,
    child: Image.asset("assets/image/foto5.png",cacheWidth: 300,cacheHeight: 246,),

    ),
          SizedBox(height: 50,),
          Container(alignment: Alignment.center,
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.bold)
              ),
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => profil() ))

              ,
              child: Text("Başlayalım"),
            ),
          ),


    ],),),);

  }
}