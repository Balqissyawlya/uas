import 'package:flutter/material.dart';
import 'package:uas/home.dart';

class coba extends StatelessWidget {
  const coba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ElevatedButton(
          onPressed: () {
            print('tes');
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Home_page()));
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              primary: Color.fromARGB(255, 13, 155, 0)),
          child: Text(
            'Buy',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )),
      ),
    );
  }
}
