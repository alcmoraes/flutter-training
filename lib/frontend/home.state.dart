import 'package:flutter/material.dart';
import 'package:layout_training/frontend/home.dart';
import 'package:layout_training/models/auth.dart';
import 'package:layout_training/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste de Android :)"),
      ),
      drawer: Drawer(child: DrawerCustom()),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                    padding: EdgeInsets.all(32),
                    child: Text('Menu',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)))
              ]),
              Container(
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8.0),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: <Widget>[
                      OutlineButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/todos");
                          },
                          child: Center(child: Text("TODO List") ),
                      ),
                    ],
                  )
              )
            ]
          )
      )
    );
  }
}
