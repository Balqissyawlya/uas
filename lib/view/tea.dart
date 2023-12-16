import 'package:flutter/material.dart';
import 'package:uas/model/menu.dart';
import 'package:uas/viewmodel/fetchmenu.dart';

class Tea extends StatefulWidget {
  _TeaState createState() => _TeaState();
}

class _TeaState extends State<Tea> {
  List<tea> te = [];
  networkTe a = networkTe();

  getData() async {
    te = await a.getData();
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
            itemCount: te.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(te: te[index])));
                },
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          '${te[index].gambar}',
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
                                '${te[index].nama}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text(
                              '${te[index].harga}',
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
  final tea te;

  const Detail({Key? key, required this.te}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget judul = Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(te.nama,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Text(
                    te.harga,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget bagianDesc = Container(
      padding: EdgeInsets.all(10),
      child: Text(
        te.deskripsi,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(te.nama),
      ),
      body: ListView(
        children: [
          Image.network(
            te.gambar,
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

// ignore_for_file: unnecessary_string_interpolations, unused_import, use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, annotate_overrides, prefer_const_constructors, camel_case_types, file_names
