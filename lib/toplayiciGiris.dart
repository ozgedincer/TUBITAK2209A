import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_a/basvuru.dart';
import 'package:deneme_a/islemGecmisi.dart';
import 'package:deneme_a/main.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class toplayiciGiris extends StatefulWidget {
  @override
  State<toplayiciGiris> createState() => _toplayiciGirisState();
}

class _toplayiciGirisState extends State<toplayiciGiris> {
  String email = "";
  String sifre = "";
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
                  SizedBox(height: 50,),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SifreYenileme()),);
                            }
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
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
                        GirisYap();
                      },
                      child: Text("GİRİŞ YAP"),
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

  Future<void> GirisYap() async {
    if (_formAnahtari.currentState!.validate()) {
      try {
        var querySnapshot = await FirebaseFirestore.instance
            .collection('toplayici')
            .where('email', isEqualTo: email)
            .where('sifre', isEqualTo: sifre)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => islemGecmisi()),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Hata'),
                content: Text('Giriş bilgileri hatalı. Lütfen tekrar deneyin.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Kapat'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Giriş sırasında hata oluştu: $e');
      }
    }
  }

}
