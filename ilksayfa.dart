import 'package:flutter/material.dart';
import 'package:tubitakproje/pages/girissayfasi.dart';
void main(){
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                child: Text('Dönüştür Kazan',style: TextStyle(
                    color: Colors.black,fontSize: 36, fontWeight: FontWeight.bold,  ) ),
              )
              ),
              Container(alignment: Alignment.bottomCenter,width: 250, height: 225,
                  child: Image.asset("assets/image/foto1.png",cacheHeight: 205, cacheWidth: 248,),
                ),
              Container(
                width: 256,height: 42, alignment: Alignment.bottomCenter,
                child: Text('Atıklarınızı etkin bir şekilde yönetin!', style: TextStyle(
                color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold,
              ),),),
              Container(height: 96,width: 222,alignment: Alignment.bottomCenter,
                  child: Text('İsraf tamamen atık yönetimi ile ilgilidir. Burada size en yakın satıcılarla iletişim kurabilirsiniz.',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),
              Container(alignment: Alignment.center,width: 364,height: 180,
                child: ElevatedButton(onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => girissayfasi()),
                ), child:
                Text("Başlayalım",),style:ElevatedButton.styleFrom(
                  primary: Colors.green
                ),
                )
              )
            ],
          )
        ),
      ),
    );

  }

}