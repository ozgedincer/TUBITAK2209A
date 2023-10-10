import 'package:deneme_a/MapToplayici.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:deneme_a/kullaniciservisi.dart';
import 'package:deneme_a/takipsayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class KayitEkrani extends StatefulWidget {
  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {

  String email = "";
  String sifre = "";
  String isim="";

  var _formAnahtari= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DÖNÜŞTÜR KAZAN"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
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
                  TextFormField(
                    onChanged: (alinanIsim) {
                      setState(() {
                        isim = alinanIsim;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: "Telefon",
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 50,),
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
                  SizedBox(height: 50,),
                  TextFormField(
                      onChanged: (alinanSifre) {
                        setState(() {
                          sifre = alinanSifre;
                        });
                      },
                      validator: (alinanSifre){
                        if (alinanSifre != null){
                          if (alinanSifre.length<8){
                            return 'Şifreniz En Az 8 Karakterden Oluşmalıdır';
                          }
                          else {
                            return null;
                          }
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Şifre",
                          border: OutlineInputBorder()
                      )
                  ),
                  SizedBox(height: 50,),
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
                        KayitEkle();

                      },
                      child: Text("KAYDOL"),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: RichText(
                        text: TextSpan(
                            text: 'Zaten Bir Hesabım Var.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Giriş Yap',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap=(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GirisEkrani()),
                                      );
                                    })
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future KayitEkle() async{
    if(_formAnahtari.currentState!.validate())
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: sifre.trim()).then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_)=>TakipSayfasi()),(route)=> false);
      });
    }

  }
}
