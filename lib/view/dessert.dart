import 'package:flutter/material.dart';
import 'package:uas/model/menu.dart';
import 'package:uas/viewmodel/fetchmenu.dart';

class Dessert extends StatefulWidget {
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  List<dessert> des = [];
  networkDes a = networkDes();

  getData() async {
    des = await a.getData();
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
            itemCount: des.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(des: des[index])));
                },
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          des[index].gambar,
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
                                des[index].nama,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text(
                              des[index].harga,
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
  final dessert des;

  const Detail({Key? key, required this.des}) : super(key: key);

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
                  child: Text(des.nama,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Text(
                  des.harga,
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
        des.deskripsi,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(des.nama),
      ),
      body: ListView(
        children: [
          Image.network(
            des.gambar,
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
