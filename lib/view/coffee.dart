import 'package:flutter/material.dart';
import 'package:uas/model/menu.dart';
import 'package:uas/viewmodel/fetchmenu.dart';

class Coffee extends StatefulWidget {
  _CoffeeState createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {
  List<coffee> cof = [];
  networkCof a = networkCof();

  getData() async {
    cof = await a.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: cof.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(cof: cof[index])));
                },
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          cof[index].gambar,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                cof[index].nama,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text(
                              cof[index].harga,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final coffee cof;

  const Detail({Key? key, required this.cof}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget judul = Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(cof.nama,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Text(
                  cof.harga,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          )
        ],
      ),
    );

    Widget bagianDesc = Container(
      padding: EdgeInsets.all(10),
      child: Text(
        cof.deskripsi,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(cof.nama),
      ),
      body: ListView(
        children: [
          Image.network(
            cof.gambar,
            width: 600,
            fit: BoxFit.cover,
          ),
          judul,
          bagianDesc,
        ],
      ),
    );
  }
}

// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, annotate_overrides, file_names, unused_import
