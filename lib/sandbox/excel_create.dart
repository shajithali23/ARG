import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:report_generator/models/excel_model.dart';
import 'package:report_generator/service/remote_services.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateExcel extends StatefulWidget {
  const CreateExcel({Key? key}) : super(key: key);

  @override
  State<CreateExcel> createState() => _CreateExcelState();
}

class _CreateExcelState extends State<CreateExcel> {
  List<JsonToExcel>? jsonToExcel;
  var excel = Excel.createExcel();
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjEwODAwLCJzdWIiOiJzaGFqaXRoQGdtYWlsLmNvbSIsImlhdCI6MTY0OTU1NTU1Mn0.FVGL9Pz5ECSxz2O9jsXDoJPBfk0Wq7tsGi6qvPawqZA";
  RemoteService service = RemoteService();
  getTableData() async {
    String url =
        "https://hihdw5fsnk.execute-api.ap-southeast-1.amazonaws.com/dev/viewtaskbyuserid?userId=1001&date=04%2F12%2F2022";
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print("---------->>>>>>");
    final length = jsonResponse["data"]["Count"];
    print(jsonResponse["data"]);
    for (int i = 0; i < length; i++) {
      print(jsonResponse["data"]["Items"][i]["date"]);
      print(jsonResponse["data"]["Items"][i]["id"]);
      print(jsonResponse["data"]["Items"][i]["task"][0]["projectName"]);
      print("||||||");
    }

// final Uri uri = SimplifiedUri.uri('http://api.mysite.com/users', params);
// final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
// final response = await http.get(uri, headers: headers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // service.getData();
    getTableData();
  }

  downloadExcel() {
    final Workbook workbook = Workbook(0);
    //Adding a Sheet with name to workbook.
    final Worksheet sheet = workbook.worksheets.addWithName('Table');
    Style globalStyle = workbook.styles.add('style');
//set back color by hexa decimal.
    globalStyle.backColor = '#4285f4';
//set font name.
    globalStyle.fontName = 'Calibri';

//set font size.
    globalStyle.fontSize = 12;
//set font color by hexa decimal.
    globalStyle.fontColor = '#000000';
//set font italic.
    globalStyle.italic = true;
//set font bold.
    globalStyle.bold = true;
//set font underline.
    //set wraper text.
    globalStyle.wrapText = true;
//set indent value.
    // globalStyle.indent = 1;
//set horizontal alignment type.
    globalStyle.hAlign = HAlignType.left;
//set vertical alignment type.
    globalStyle.vAlign = VAlignType.bottom;
//set text rotation.
    // globalStyle.rotation = 90;
//set all border line style.
    globalStyle.borders.all.lineStyle = LineStyle.thin;
//set border color by hexa decimal.
    globalStyle.borders.all.color = '#000000';

    sheet.getRangeByName('A1').setText('Date');
    sheet.getRangeByName('B1').setText('Project');
    sheet.getRangeByName('C1').setText('Task ID');
    sheet.getRangeByName('D1').setText('Task');
    sheet.getRangeByName('E1').setText('Status');
    sheet.getRangeByName('F1').setText('Start Time');
    sheet.getRangeByName('G1').setText('End Time');
    sheet.getRangeByName('H1').setText('Duration');
    sheet.getRangeByName('I1').setText('Description');
    final Style headingStyle = workbook.styles.add('HeadingStyle');
    headingStyle.bold = true;
    headingStyle.hAlign = HAlignType.center;
    headingStyle.vAlign = VAlignType.center;
    headingStyle.wrapText = true;
    headingStyle.backColor = '#A4C2F4';
//set font name.
    headingStyle.fontName = 'Calibri';

//set font size.
    headingStyle.fontSize = 12;
//set font color by hexa decimal.
    headingStyle.fontColor = '#000000';
    final Style bodyStyle = workbook.styles.add('BodyStyle');
    bodyStyle.bold = false;
    bodyStyle.hAlign = HAlignType.center;
    bodyStyle.vAlign = VAlignType.center;
    bodyStyle.wrapText = true;

    sheet.getRangeByName('A1').cellStyle = headingStyle;
    sheet.getRangeByName('B1').cellStyle = headingStyle;
    sheet.getRangeByName('C1').cellStyle = headingStyle;
    sheet.getRangeByName('D1').cellStyle = headingStyle;
    sheet.getRangeByName('E1').cellStyle = headingStyle;
    sheet.getRangeByName('F1').cellStyle = headingStyle;
    sheet.getRangeByName('G1').cellStyle = headingStyle;
    sheet.getRangeByName('H1').cellStyle = headingStyle;
    sheet.getRangeByName('I1').cellStyle = headingStyle;
    // sheet.getRangeByName('A1:I1').columnWidth = 30;

    final Range range = sheet.getRangeByName('A1:I1');
    // sheet.getRangeByName('A2:I100'). = 31;

    sheet.getRangeByName('A2:I2').cellStyle = bodyStyle;

    final List<Object> list = [
      "01 / 04 / 2022",
      "Morphfit",
      "-",
      "Morphfit trainer app fix and build",
      "Completed",
      "07:50",
      "09:30",
      "01:40",
      "Fixed the bugs and build the app"
    ];

//Import the Object list to Sheet
    sheet.importList(list, 2, 1, false);
    sheet.autoFitRow(1);

    sheet.autoFitColumn(4);
    sheet.autoFitRow(2);

    print(sheet.getFirstRow());
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("DOWNLOAD"),
        onPressed: () {
          downloadExcel();
        },
      )),
    );
  }
}
