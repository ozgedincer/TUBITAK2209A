import 'package:deneme_a/basvurugonderildi.dart';
import 'package:deneme_a/harita.dart';
import 'package:deneme_a/profil.dart';
import 'package:deneme_a/sifreyenileme.dart';
import 'package:deneme_a/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class basvuru extends StatefulWidget {
  @override
  State<basvuru> createState() => _basvuruState();
}

class _basvuruState extends State<basvuru> {
  Object? val = -1;
  Object? val1 = -1;
  Object? val2 = -1;
  Object? val3 = -1;
  Object? val4 = -1;
  Object? vall = -1;
  Object? vall1 = -1;
  Object? vall2 = -1;
  Object? vall3 = -1;
  Object? vall4 = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(child: Text("Atık Türünü Giriniz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),

          Container(
            child: RadioListTile(

                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                },
              toggleable: true,
              activeColor: Colors.green,
              title: const Text("Elektronik"),
            ),

          ),
          Container(
            child: RadioListTile(
              value: 1,
              groupValue: val1,
              onChanged: (value) {
                setState(() {
                  val1 = value;
                });
              },
              toggleable: true,
              activeColor: Colors.green,
              title: const Text("Kağıt"),
            ),
          ),
          Container(
            child: RadioListTile(
              value: 1,
              groupValue: val2,
              onChanged: (value) {
                setState(() {
                  val2 = value;
                });
              },
              toggleable: true,
              activeColor: Colors.green,
              title: const Text("Metal"),
            ),
          ),
          Container(
            child: RadioListTile(
              value: 1,
              groupValue: val3,
              onChanged: (value) {
                setState(() {
                  val3 = value;
                });
              },
              toggleable: true,
              activeColor: Colors.green,
              title: const Text("Plastik"),
            ),
          ),
          Container(
            child: RadioListTile(
              value: 1,
              groupValue: val4,
              onChanged: (value) {
                setState(() {
                  val4 = value;
                });
              },
              toggleable: true,
              activeColor: Colors.green,
              title: const Text("Diğer"),
            ),
          ),

            Container(child: Text("Ağırlık(KG) Giriniz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
            Container(
              child: RadioListTile(

                value: 1,
                groupValue: vall,
                onChanged: (value) {
                  setState(() {
                    vall = value;
                  });
                },
                toggleable: true,
                activeColor: Colors.green,
                title: const Text("Elektronik"),
              ),

            ),
            Container(
              child: RadioListTile(
                value: 1,
                groupValue: vall1,
                onChanged: (value) {
                  setState(() {
                    vall1 = value;
                  });
                },
                toggleable: true,
                activeColor: Colors.green,
                title: const Text("Kağıt"),
              ),
            ),
            Container(
              child: RadioListTile(
                value: 1,
                groupValue: vall2,
                onChanged: (value) {
                  setState(() {
                    vall2 = value;
                  });
                },
                toggleable: true,
                activeColor: Colors.green,
                title: const Text("Metal"),
              ),
            ),
            Container(
              child: RadioListTile(
                value: 1,
                groupValue: vall3,
                onChanged: (value) {
                  setState(() {
                    vall3 = value;
                  });
                },
                toggleable: true,
                activeColor: Colors.green,
                title: const Text("Plastik"),
              ),
            ),
            Container(
              child: RadioListTile(
                value: 1,
                groupValue: vall4,
                onChanged: (value) {
                  setState(() {
                    vall4 = value;
                  });
                },
                toggleable: true,
                activeColor: Colors.green,
                title: const Text("Diğer"),
              ),
            ),
            Container(alignment: Alignment.center,
              width: double.infinity,
              height: 19,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.bold)
                ),
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => basvurugonderildi() ))

                ,
                child: Text("Kaydet"),
              ),
            ),

        ],),),);

  }
}