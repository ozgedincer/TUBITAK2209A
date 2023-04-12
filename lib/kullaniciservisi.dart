import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_a/kullanici.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class KullaniciServisi{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    // veri kayıt
    Future kullaniciEkle(String kullaniciID,String telefon, GeoPoint konum ) async {
      var ref= _firestore.collection("kullanici");


      var kullaniciref= await ref.add({
        'telefon':telefon,
        'konum':konum,
      });

      return Kullanici(kullaniciID:kullaniciref.id,telefon:telefon,konum:konum);

    }





}