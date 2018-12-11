import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platfrom = const MethodChannel('soni.aditya.com/info');
  String _message = 'No Messages yet.';

  @override
  void initState() {
    _getMessage().then((String newMessage) {
      setState(() {
        _message = newMessage;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyHomePage'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(_message),
          )
        ],
      ),
    );
  }

  Future<String> _getMessage() async {
    String value;
    try {
      value = await platfrom.invokeMethod('getMessage');
    } catch (expect) {
      print(expect);
    }
    return value;
  }
}
