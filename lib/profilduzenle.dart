import 'package:deneme_a/profil.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class profilduzenle extends StatefulWidget {
  @override
  State<profilduzenle> createState() => _profilduzenleState();
}

class _profilduzenleState extends State<profilduzenle> {
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

          Center(  child:Text('Profilinizi Düzenleyin',style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold,
              height:13)) ,),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "İsim Soyisim",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Telefon Numarası",
                border: OutlineInputBorder()
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
              child: Text("Kaydet"),
            ),
          ),







        ],),),);

  }
}