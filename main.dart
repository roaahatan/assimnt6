import 'dart:wasm';

import 'package:ass6/splash_screen.dart';
import 'package:flutter/material.dart';



void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: "  CET Groups ",

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  List<String> groups = [ ];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text("CET Groups"),

    ),
    drawer: new Drawer(
      child: new ListView(
         children: <Widget>[
           new ListTile(
             title: new Text("CET Students Manager"),
             subtitle: Text("CET app "),
           ),
           new ListTile(
               title: new Text("groups"),
               trailing: new Icon(Icons.group),

           ),
           new ListTile(
               title: new Text("Notifications"),
               trailing: new Icon(Icons.notifications_active),
           ),
           new ListTile(
             title: new Text("about app"),
             trailing: new Icon(Icons.announcement ),
           ),
         ],
      ),
    ),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      child: Text('+'),
      onPressed: onPressed,



    ),

    body: groups.isEmpty

        ? Center(child: Text('empty'))
        : ListView(

      children: [
        ...groups.map(
              (group) => Card(
              elevation: 3,
              child: Dismissible(
                  background: Container(
                      child: const Icon(Icons.delete),
                      color: Colors.red),

                 key: UniqueKey(),





              child: ListTile(
                title: Text(group),
                trailing: Icon(Icons.details),

                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => page1()

                    )
                ),

              )
              )
          ),
        )
      ],


    ),
  );

  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(" add  group"),
        content: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(60)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              suffixIcon: Icon(Icons.group),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Group name ......",


            ),
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("add"),
            color: Colors.blueGrey,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("exit"),
            color: Colors.blueGrey,
            onPressed: () {
              controller.clear();
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}
class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Create Student"),

      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("CET Students Manager"),
              subtitle: Text("CET app "),
            ),
            new ListTile(
              title: new Text("groups"),
              trailing: new Icon(Icons.group),

            ),
            new ListTile(
              title: new Text("Notifications"),
              trailing: new Icon(Icons.notifications_active),
            ),
            new ListTile(
              title: new Text("about app"),
              trailing: new Icon(Icons.announcement ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: Text('+'),
          onPressed: (){ }



      ),
      body: Container(
        child: Center(
          child: Text(
            'No students yet \n'
                'Please add your students now',
            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),
          ),

        ),
      ),
    );

  }




}