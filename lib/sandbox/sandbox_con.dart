import 'dart:async';

import 'package:report_generator/sandbox/sandbox.dart';

class SandBoxController {
  List<ContactFormItemWidget> contactForms = List.empty(growable: true);
  StreamController streamController = StreamController();
  List<Map<String, dynamic>> values = [];

  StreamSink get addValue => streamController.sink;
  Stream get getValue => streamController.stream;
}
