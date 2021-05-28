import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('lib/assets/lost.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20
                        )
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter e-mail",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30.0),
                          ),
                          MaterialButton(
                            height: 45.0,
                            minWidth: 90.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Icon(FontAwesomeIcons.signInAlt),
                            onPressed: (){},
                            splashColor: Colors.deepOrangeAccent,
                              ),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
