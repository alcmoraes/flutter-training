import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:layout_training/models/auth.dart';

class DrawerCustom extends StatefulWidget {
  DrawerCustom({Key key}) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Consumer<AuthModel>(builder: (context, auth, child) {
                  if (auth.isAuthenticated) {
                    return Text('Oi ${auth?.credentials["login"] ?? ""}');
                  }
                  return Text('Don\'t know how you get here!');
                }),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                      title: Text('Home')),
                  ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/todos");
                      },
                      title: Text('TODO List'))
                ],
              ),
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Provider.of<AuthModel>(context, listen: false).deauthUser();
                Navigator.pushNamed(context, "/login");
              },
            )
          ],
        ),
      ),
    );
  }
}
