import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://randomuser.me/api/?results=15";
  List data=[];

  Future<String> makeRequest() async {
    var response = await http.get(Uri.parse(url),
        headers: {'Accept': 'application/json'});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['results'];
    });

    //print('Nombre: '+ data[0]['name']['first']);
    //print('Apellido: '+ data[0]['name']['last']);
    return response.body.toString();
  }

  @override
  void initState(){
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text(data[i]['name']['first']),
            subtitle: Text(data[i]['cell']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[i]['picture']['thumbnail']),
            ),
            onTap: (){
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ContactDetail(data[i])
                )
              );
            },
          );
        },
      )
    );
  }
}

class ContactDetail extends StatelessWidget {
  ContactDetail(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact details..."),
      ),
      body: Center(
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            image: DecorationImage(
              image: NetworkImage(data['picture']['large']),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(55)
            ),
              border: Border.all(
              color: Colors.red,
                  width: 4
          )
          ),
        ),
      ),
    );
  }
}
