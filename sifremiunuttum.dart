import 'package:flutter/Material.dart';
import 'package:tubitakproje/pages/girissayfasi.dart';

class sifremiunuttum extends StatelessWidget {
  const sifremiunuttum({Key? key}) : super(key: key);

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
                    child: Text('Yeni şifrenizi belirleyin',style: TextStyle(
                        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                    ),),
                  )
              ),
              Container(child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address'
                ),

              ),),Container(
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New password'
                  ) ,
                ),
              ),
              Container(
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm new password'
                  ) ,
                ),
              ),
              Container(alignment:Alignment.bottomCenter,width: 278,height: 172,
                child: Image.asset("assets/image/foto4.png",cacheWidth: 278,cacheHeight: 172,),

              ),
              Container(alignment: Alignment.center,width: 364,height: 180,
                  child: ElevatedButton(onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => girissayfasi()),
                  ), child:
                  Text("Kaydet",),style:ElevatedButton.styleFrom(
                      primary: Colors.green
                  ),
                  )
              )

            ],

          )
      ),

    );
  }
}