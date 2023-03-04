import 'package:flutter/Material.dart';
import 'package:tubitakproje/pages/kayitsayfasi.dart';
import 'package:tubitakproje/pages/sifremiunuttum.dart';

class girissayfasi extends StatelessWidget {
  const girissayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Container(alignment:Alignment.bottomCenter,width: 250,height: 225,
              child: Image.asset("assets/image/foto3.png",cacheWidth: 334,cacheHeight: 265,),
              
            ),
            Container(child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email'
              ),

            ),),Container(
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password'
                ) ,
              ),
            ),
            Container(alignment: Alignment.center,width: 150,height: 70,
                child: TextButton(onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sifremiunuttum()),
                ), child:
                Text("Şifremi Unuttum",),style:TextButton.styleFrom(
                    primary: Colors.blue
                ),
                )

            ),
            Container(alignment: Alignment.center,width: 364,height: 50,
                child: ElevatedButton(onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => girissayfasi()),
                ), child:
                Text("Kullanıcı Girişi Yap",),style:ElevatedButton.styleFrom(
                    primary: Colors.green
                ),
                )
            ),
            Container(
              alignment: Alignment.bottomLeft,width: 120,height: 25,
              child: (Text ('Hesabınız yok mu?')

            ),),

            Container(alignment: Alignment.center,width: 150,height: 70,
            child: TextButton(onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => kayitsayfasi() ),
            ),
            child: Text("Kayıt Ol",),style: TextButton.styleFrom(
                primary: Colors.blue
              ),),
            )


          ],

          )
      ),

    );
  }
}
