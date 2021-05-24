import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirsRoute(),
  ));
}

class FirsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to other route"),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go back!!"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}