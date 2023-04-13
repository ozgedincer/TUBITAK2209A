import 'package:deneme_a/basvurugonderildi.dart';
import 'package:flutter/Material.dart';
import 'package:deneme_a/adres.dart';
import 'package:deneme_a/profil.dart';
import 'package:deneme_a/basvuru.dart';
import 'package:deneme_a/profilduzenle.dart';
import 'islemgecmisi.dart';

class navigate extends StatefulWidget
{   navigate({Key? key}) : super(key: key);
@override   State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  int currentIndex = 0;
  final screens = [
    profil(),
    basvuru(),
    islemgecmisi(),
    basvurugonderildi(),

  ];
  @override   Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index ),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_rounded),label: 'Başvur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),label: 'Geçmiş',
          ),


        ],

      ),




    );


  }

}
