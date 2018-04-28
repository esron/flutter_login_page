import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  bool _isLogginIn = true;

  void _toggleLogin() {
    setState(() {
          _isLogginIn = !_isLogginIn;
        });
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() => {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          ),
          new Center(
            child: new Container(
              width: 300.0,
              height: 350.0,
              padding: EdgeInsets.all(10.0),
              color: Colors.white30,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage('assets/logo.png'),
                    width: _iconAnimation.value * 100,
                  ),
                  new Form(
                    child: Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.white, fontSize: 20.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: 'Enter Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: 'Enter Password',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          new MaterialButton(
                            minWidth: 150.0,
                            color: (_isLogginIn
                                ? Colors.redAccent
                                : Colors.white70),
                            textColor: Colors.black,
                            child: (_isLogginIn
                                ? new Text('Sign in')
                                : new Text('Sing up')),
                            onPressed: () => {},
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                          ),
                          new MaterialButton(
                            minWidth: 150.0,
                            color: Colors.white70,
                            textColor: Colors.black87,
                            child: (_isLogginIn
                                ? new Text('Sign up')
                                : new Text('Back to Login')),
                            onPressed: _toggleLogin,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
