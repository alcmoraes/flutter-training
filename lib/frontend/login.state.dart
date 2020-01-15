import 'package:flutter/material.dart';

import 'package:layout_training/frontend/login.dart';
import 'package:layout_training/models/auth.dart';
import 'package:layout_training/widgets/form/validators.dart';
import 'package:layout_training/widgets/input/transparent.input.dart';
import 'package:provider/provider.dart';

class LoginScreenState extends State<LoginScreen> {
  
  Map<String, String> loginForm = {};

  void _updateField(String field, String value) {
    setState(() {
      loginForm[field] = value;
    });
  }

  final _formKey = GlobalKey<FormState>();

  Future<bool> _loginAction() async {
    await new Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: new Container(),
            centerTitle: true,
            title: Consumer<AuthModel>(builder: (context, auth, child) {
              return Text(
                  'Hallo ${auth?.credentials["login"] ?? ""}');
            })),
        body: Center(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(36),
                        child: Consumer<AuthModel>(
                            builder: (context, auth, child) {
                          if (auth.isAuthenticated) {
                            return Text('You are now authenticated!');
                          }
                          return Text('Not yet authenticated');
                        })),
                    Container(
                      padding: EdgeInsets.all(36),
                      child: TransparentInput(
                          validator: Validators.notEmptyValidator,
                          placeholder: "Login",
                          onChanged: (v) => this._updateField("login", v)
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 36, top: 0, bottom: 36, right: 36),
                        child: TransparentInput(
                          validator: Validators.notEmptyValidator,
                            obscure: true,
                            placeholder: "Password",
                            onChanged: (v) => this._updateField("password", v)
                        )
                    ),
                    FlatButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Text('Authenticate credentials'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return WillPopScope(
                                onWillPop: () async => false,
                                child: Center(child: CircularProgressIndicator()),
                              );
                            });
                            await _loginAction();
                            Provider.of<AuthModel>(context, listen: false)
                                .authUser(loginForm);
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.pushNamed(context, "/");
                          }
                        }),
                    FlatButton(
                        textColor: Colors.black12,
                        child: Text('Deauthenticate credentials'),
                        onPressed: () {
                          Provider.of<AuthModel>(context, listen: false)
                              .deauthUser();
                        })
                  ],
                )))));
  }
}
