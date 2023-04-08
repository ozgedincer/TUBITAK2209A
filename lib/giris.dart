import 'package:deneme_a/harita.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class giris extends StatefulWidget {
  @override
  State<giris> createState() => _girisState();
}

class _girisState extends State<giris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Center(
        child:Text('DönüştürKazan',style: TextStyle(
            color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold,
            height:4)) ,),

          Container(alignment:Alignment.bottomCenter,
            child: Image.asset("assets/image/foto1.png",cacheWidth: 248,cacheHeight: 205,),),
          Container(
            width: 256,height: 42, alignment: Alignment.bottomCenter,
            child: Text('Atıklarınızı etkin bir şekilde yönetin!', style: TextStyle(
              color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold,height:-1
            ),),),
          Container(height: 70,width: 222,alignment: Alignment.bottomCenter,
            child: Text('İsraf tamamen atık yönetimi ile ilgilidir. Burada size en yakın satıcılarla iletişim kurabilirsiniz.',style: TextStyle(
              fontSize: 14,
            ),),
          ),
          SizedBox(height: 50,),
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
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => GirisEkrani() ))

              ,
              child: Text("Başlayalım"),
            ),
          ),







        ],),),);

}
}