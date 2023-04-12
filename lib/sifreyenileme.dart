
import 'package:deneme_a/harita.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SifreYenileme extends StatefulWidget {
  @override
  State<SifreYenileme> createState() => _SifreYenilemeState();
}

class _SifreYenilemeState extends State<SifreYenileme> {
  String email = "";
  var _formAnahtari= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(child: Text('Yeni şifrenizi belirleyin',style: TextStyle(
                  color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),),
                  SizedBox(height: 60,),
                  TextFormField(
                    onChanged: (alinanMail) {
                      setState(() {
                        email = alinanMail;
                      });
                    },
                    validator: (alinanMail){
                      if(alinanMail.toString().contains('@')){
                        return null;
                      }
                      else if (alinanMail != null){
                        return 'Geçerli Bir Email Adresİ Giriniz';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600)
                      ),
                      onPressed: () {
                        SifreYenileme();
                      },
                      child: Text("ŞİFRE AL"),
                    ),
                  ),

                  Container(alignment:Alignment.bottomCenter,
                    child: Image.asset("assets/image/foto4.png",cacheWidth: 278,cacheHeight: 172,),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future SifreYenileme() async{
    if(_formAnahtari.currentState!.validate()){
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => Navigator.of(context).pop());}
  }
}
