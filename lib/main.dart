import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Parser'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Name: " + mydata[index]['name']),
                          Text("Gender: " + mydata[index]['gender']),
                          Text("Age: " + mydata[index]['age']),
                          Text("Hair Color: " + mydata[index]['hair_color']),
                          Text("Height: " + mydata[index]['height']),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                );
              }),
        ),
      ),
    );
  }
}
