import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Chat Uygulaması Arayüzü ', home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Uygulaması')),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu yeniMesaj = MesajBalonu(gelenMesaj);
      mesajListesi.insert(0, yeniMesaj);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.0),
      child: Row(
        children: <Widget>[
          Flexible(child: TextField(controller: t1)),
          IconButton(
            onPressed: () => listeyeEkle(t1.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: mesajListesi.length,
              itemBuilder: (_, index) => mesajListesi[index],
              reverse: true,
            ),
          ),
          Divider(thickness: 1.0),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı1";

// ignore: must_be_immutable
class MesajBalonu extends StatelessWidget {
  String mesaj;
  MesajBalonu(this.mesaj);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(child: Text(isim[0])),
          Column(children: <Widget>[Text(isim), Text(mesaj)]),
        ],
      ),
    );
  }
}
