import 'package:flutter/Material.dart';


class kayitsayfasi extends StatelessWidget {
  const kayitsayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top:50),
                child: Center(
                  child: Text('Dönüştür Kazana Hoş Geldin!',style: TextStyle(
                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                  ),),
                )
            ),
          ],
        ),
      ) ,


    );
  }
}