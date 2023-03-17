import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /*  bu yapı sayesinde istediğimiz kodlamayı belirli aralılarla çalıştırabiliyoruz. bahsi geçen aralık zamansal bir aralıktır.
    1 sn de 1 kodlamayı çalıştırmak gibi    */
  // geri sayım uygulaması yapacağız butona bastığımızda 10 9 8 .. şeklinde ve 0 olduğunda tekrar 10 a dönecek

  late Timer zamanlayici; // sayesinde timer ı başlatacağız veya durduracağız
  int kalanSure = 10;  // 10dan geriye doğru azaltacağız

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geri Sayım"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Kalan Süre : $kalanSure sn", style: TextStyle(fontSize: 30),),
            ElevatedButton(
                onPressed: (){  // butona bastığımızda timer ı çalıştıracağız
                  zamanlayici = Timer.periodic(Duration(seconds: 1), (timer) {  // Duration(seconds: 1) 1 sn aralıkla çalıştırılacak
                    // 1 saniye aralıklarla çalıştıracağımız kodu buraya yazacağız
                    setState(() { // 1 sn aralıklarla arayüzü güncelleyeceğiz ve kalanSure yi sürekli güncel tutmaya çalışacağız
                      if(kalanSure < 1){  // kalanSure 0 olduğunda
                        kalanSure = 10; // tekrar başa döndürüp 10 yapıyoruz
                        zamanlayici.cancel(); // ve zamankayıcı geriye doğru akmasın diye durduruyoruz
                      } else  { // kalanSure 0 dan büyükse 1er 1er azaltacağız
                        kalanSure = kalanSure - 1;
                      }
                    });
                  });
                },  //
                child: Text("Başla"))
          ],
        ),
      ),
    );
  }
}
