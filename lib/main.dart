import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:report_generator/screens/sign_in.dart';

import 'screens/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();

  late String? value;

  Widget home = Scaffold(
      body: Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  check() async {
    value = await storage.read(key: "token");
    print(value);
    if (value == null) {
      setState(() {
        home = SignIn();
      });
    } else {
      setState(() {
        home = TaskPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}
