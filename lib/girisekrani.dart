import 'package:deneme_a/harita.dart';
import 'package:deneme_a/giris.dart';
import 'package:deneme_a/kayitekrani.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/takipsayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class GirisEkrani extends StatefulWidget {
  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  String email = "";
  String sifre = "";
  var _formAnahtari= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(child: Text('DönüştürKazana Hoş geldin!',style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
              ),),),
                  Container(alignment:Alignment.bottomCenter,
                child: Image.asset("assets/image/foto3.png",cacheWidth: 334,cacheHeight: 265,),),
                  TextFormField(
                    onChanged: (alinanMail) {
                      setState(() {
                        email = alinanMail;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                      onChanged: (alinanSifre) {
                        setState(() {
                          sifre = alinanSifre;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Şifre",
                          border: OutlineInputBorder()
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: TextButton(
                          child: Text('Şifremi Unuttum'),

                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_)=>SifreYenileme()),(route)=> false);
                          }
                      )
                    ),
                  ),
                  SizedBox(height: 0,),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600)
                      ),
                      onPressed: () {
                       GirisYap();
                      },
                      child: Text("GİRİŞ YAP"),
                    ),
                  ),
                  Container(alignment: Alignment.bottomLeft,width: 120,height: 25,
                    child: (Text ('Hesabınız yok mu?')

                    ),),
                  Container(alignment: Alignment.center,width: 150,height: 70,
                    child: TextButton(onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KayitEkrani() ),
                    ),
                      child: Text("Kayıt Ol",),style: TextButton.styleFrom(
                          primary: Colors.blue
                      ),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future GirisYap() async{
    if(_formAnahtari.currentState!.validate()){
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: sifre.trim()).then((value){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_)=>TakipSayfasi()),(route)=> false);
      });
    }
    else {

    }
  }
}
