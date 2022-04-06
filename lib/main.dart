import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:report_generator/screens/home_page.dart';
import 'package:report_generator/screens/sign_in.dart';

import 'screens/report_generate_page.dart';
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

  late String? value, id;

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
    id = await storage.read(key: "id");
    print(value);
    print(id);
    if (value == null) {
      setState(() {
        home = ReportGenerate();
      });
    } else {
      setState(() {
        home = HomePage();
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
