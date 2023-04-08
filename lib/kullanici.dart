import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Kullanici{
  String? kullaniciID;
  String? telefon;
  GeoPoint? konum;

  Kullanici({this.kullaniciID,this.telefon,this.konum});

  factory Kullanici.fromSnapshot(DocumentSnapshot snapshot){
    return Kullanici(
      kullaniciID: snapshot.id,
      telefon: snapshot["telefon"],
      konum: snapshot["konum"],
    );
  }
}