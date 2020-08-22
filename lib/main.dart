import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'src/list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Revamped'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Student> _students = students;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.all(16.0),
        children: _students.map(_buildItem).toList(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(Student student) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: ExpansionTile(
        title: new Text(
          student.name,
          style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic),
        ),

        children: [
          Text(
            "My name is ${student.name},\nI am in ${student.stack}. I am ${student.age} years old.\nMy score: ${student.score} and my current percentage is ${student.percentage}",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(student.stack, style: TextStyle(color: Colors.redAccent),),
              MaterialButton(
                  child: Icon(Icons.launch, color: Colors.redAccent,),
                  onPressed: () async{
                    final genUrl = "https://google.com";
                    if(await canLaunch(genUrl)){
                      launch(genUrl);
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
