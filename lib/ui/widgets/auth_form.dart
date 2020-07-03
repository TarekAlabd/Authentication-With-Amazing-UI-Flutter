import 'package:flutter/material.dart';
import 'package:login_register_auth/ui/screens/auth_screen.dart';
import 'package:login_register_auth/ui/widgets/original_button.dart';
import 'package:login_register_auth/services/auth.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                hintText: 'ex: test@gmail.com',
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'You must enter a valid email' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            SizedBox(height: 20),
            OriginalButton(
              text: widget.authType == AuthType.login ? 'Login' : 'Register',
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if (widget.authType == AuthType.login) {
                    await authBase.loginWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('home');
                  } else {
                    await authBase.registerWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('home');
                  }
//                  print(_email);
//                  print(_password);
                }
              },
            ),
            SizedBox(height: 6),
            FlatButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                  print(widget.authType);
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account?'
                    : 'Already have an account?',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
