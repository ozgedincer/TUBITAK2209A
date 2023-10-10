import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_a/kullanici.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class KullaniciServisi{

  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  // kayıt ekle
  Future addUser(String kullaniciID,String telefon, GeoPoint konum ) async {
    var ref= _firestore.collection("kullanici");
    var kullaniciref= await ref.add({
      'telefon':telefon,
      'konum':konum,
    });

    return Kullanici(kullaniciID:kullaniciref.id,telefon:telefon,konum:konum);

  }

  // basvuru ekle
  Future addRequest(int basvuruID,String atikTuru,String agirlik,String tasimaSirketi,String Durum)async{
    var ref=_firestore.collection("basvuru");
    var basvururef1=await ref.add({
      'agirlik':agirlik,
      'atikTuru':atikTuru,
      'tasimaSirketi':tasimaSirketi,
      'Durum':Durum,
    });
    return Basvuru(basvuruID: basvururef1.id,atikTuru: atikTuru,agirlik: agirlik,tasimaSirketi: tasimaSirketi,Durum: Durum);
  }

  //konum bilgisi al
  Future getData() async {
    GeoPoint g;
    FirebaseFirestore.instance
        .collection("kullanici").doc('8a7T602KRvQcJMhH8sBf')
        .get()
        .then((value){
      g=value.data()!["konum"];
      LatLng latLng=LatLng(g.latitude, g.longitude);
      print(latLng) ;
    });
  }

  //basvuru gecmisini al
  Stream<QuerySnapshot> getAct() {
    var ref = _firestore.collection("basvuru").snapshots();
    return ref;
  }
  //basvuru gecmisini sil
  Future<void> removeAct(String docId) {
    var ref = _firestore.collection("basvuru").doc(docId).delete();

    return ref;
  }


  //durum güncelle
  Future<void> updateDurum(String documentId, String newDurum) async {
    try {
      await _firestore
          .collection('basvuru')
          .doc(documentId)
          .update({'Durum': newDurum});
      print('Durum güncellendi.');
    } catch (e) {
      print('Durum güncelleme hatası: $e');
    }
  }

}