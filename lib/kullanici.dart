import 'package:cloud_firestore/cloud_firestore.dart';

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

class Basvuru{
  String? basvuruID;
  String? atikTuru;
  String? agirlik;
  String? tasimaSirketi;
  String? Durum;

  Basvuru({this.basvuruID,this.atikTuru,this.agirlik,this.tasimaSirketi,this.Durum});

  factory Basvuru.fromSnapshot(DocumentSnapshot snapshot){
    return Basvuru(
      basvuruID: snapshot.id,
      atikTuru: snapshot["atikTuru"],
      agirlik: snapshot["agirlik"],
      tasimaSirketi: snapshot["tasimaSirketi"],
      Durum:snapshot ["Durum"],
    );
  }
}