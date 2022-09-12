import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String? errorText = null;

  void _resetPassword () {
    print('reset password');
  }

  void _auth() {
  final login = _loginTextController.text;
  final password = _passwordTextController.text;
  if (login == 'Admin' && password == 'Admin') {
    errorText = null;
    // Navigator.of(context).pushNamed('/main_screen');
    Navigator.of(context).pushReplacementNamed('/main_screen');
  } else { errorText = 'Не верный логин или пороль';}
  setState(() {

  });
  }
  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login to your account',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Center(

                  child: Text(
                'Введите ваш Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 100),
              if(errorText != null)
                ...[Text(errorText, style: TextStyle(color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
               SizedBox(height: 20,)
                ],

              TextField(

                controller: _loginTextController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_outlined),
                    hintText: 'Login',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordTextController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0))),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(

                      onPressed: _auth,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),

                  TextButton(
                      onPressed: _resetPassword,
                      child: Text('Reset password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ))),

                  TextButton(
                      onPressed: () {},
                      child: Text('Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ))),
                ],
              )
            ],
          ),
  ],
        ),
      ),
    );
  }
}
