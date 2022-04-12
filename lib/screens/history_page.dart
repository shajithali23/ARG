import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../constants/custom_color.dart';
import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String url =
      "https://hihdw5fsnk.execute-api.ap-southeast-1.amazonaws.com/dev/arg_project";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjEwODAwLCJzdWIiOiJzaGFqaXRoQGdtYWlsLmNvbSIsImlhdCI6MTY0OTU1NTU1Mn0.FVGL9Pz5ECSxz2O9jsXDoJPBfk0Wq7tsGi6qvPawqZA";
  String selectedValue = "";

  List data = [];
  getData() async {
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    int listLength = jsonResponse["data"]["noRecords"];
    setState(() {
      data = jsonResponse["data"]["records"];
      selectedValue = data[0]["id"];
    });
    for (int i = 0; i < listLength; i++) {}
    print(data);
  }

  TextEditingController dateController = TextEditingController();
  String _currentSelectedValue = 'Morphfit';
  bool selectedProject = false;
  var project_list = ["Morphfit", "Qbace", "TrueKarma"];
  String _selectedDate = '';
  bool dateRange = false;
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('MMM,dd,yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('MMM,dd,yyyy').format(args.value.endDate ?? args.value.startDate)}';
        print(args.value.startDate);
        print(args.value.endDate);
        print(_range);
        dateController.text = _range;
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  getTableData() async {
    String url =
        "https://hihdw5fsnk.execute-api.ap-southeast-1.amazonaws.com/dev/viewtaskbyuserid?userId=1001&date=04%2F12%2F2022";
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print("---------->>>>>>");
    print(jsonResponse);
// final Uri uri = SimplifiedUri.uri('http://api.mysite.com/users', params);
// final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
// final response = await http.get(uri, headers: headers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getTableData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFF004BDB),
        title: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 212, height: 34),
          child: Image.asset(
            "assets/images/logo2.png",
          ),
        ),
        actions: [
          Center(
            child: Text(
              "Home",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              // style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Center(
              child: Container(
                width: 1,
                height: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              "Profile",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            width: 80,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(100, 40, 100, 0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 30.0,
                          offset: Offset(0, 4)),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 12),
                      child: Text(
                        "Report History",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date Range",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: 280, height: 35),
                                        child: TextFormField(
                                          controller: dateController,
                                          onTap: () {
                                            setState(() {
                                              dateRange = !dateRange;
                                            });
                                          },
                                          readOnly: true,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 6, top: 2.0),
                                              hintText: "Select ",
                                              hintStyle: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.calendar,
                                                  size: 18,
                                                  color: Color.fromRGBO(
                                                      77, 77, 77, 1),
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.4)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Project",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 250, height: 35),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                isExpanded: false,
                                                value: selectedValue,
                                                items: data.map((project) {
                                                  return DropdownMenuItem(
                                                    child: Text(project[
                                                        "projectName"]), //label of item
                                                    value: project[
                                                        "id"], //value of item
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedProject = true;
                                                    _currentSelectedValue =
                                                        value.toString();
                                                    selectedValue =
                                                        value.toString();
                                                    print(
                                                        _currentSelectedValue);
                                                  });
                                                },
                                                hint: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  // width: 150, //and here
                                                  child: Text(
                                                    selectedProject
                                                        ? _currentSelectedValue
                                                        : "Select ",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    decorationColor:
                                                        Colors.red),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: 250, height: 40),
                                  child: TextFormField(
                                    // controller: dateController,

                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400)),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 2, left: 6),
                                        hintText: "Search ",
                                        hintStyle: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Icon(
                                            Icons.search,
                                            color:
                                                Color.fromRGBO(77, 77, 77, 1),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.4)),
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Stack(
                        children: [
                          DataTables(),
                          dateRange
                              ? Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 24),
                                      padding: EdgeInsets.only(top: 24),
                                      width: 520,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 4.0,
                                          ),
                                        ],
                                      ),
                                      child: SfDateRangePicker(
                                        onSelectionChanged: _onSelectionChanged,

                                        enableMultiView: true,
                                        viewSpacing: 20,

                                        headerHeight: 40,
                                        // headerHeight: 30,
                                        extendableRangeSelectionDirection:
                                            ExtendableRangeSelectionDirection
                                                .both,
                                        rangeSelectionColor:
                                            kPrimaryColor.withOpacity(0.4),
                                        selectionShape:
                                            DateRangePickerSelectionShape
                                                .rectangle,
                                        selectionRadius: 0.0,
                                        startRangeSelectionColor: kPrimaryColor,
                                        endRangeSelectionColor: kPrimaryColor,
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        headerStyle: DateRangePickerHeaderStyle(
                                            textAlign: TextAlign.center),
                                        initialSelectedRange: PickerDateRange(
                                            DateTime.now().subtract(
                                                const Duration(days: 31)),
                                            DateTime.now()
                                                .add(const Duration(days: 0))),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(left: 24),
                                      // padding: EdgeInsets.only(top: 24),
                                      width: 520,

                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                dateRange = !dateRange;
                                              });
                                            },
                                            icon: Icon(Icons.close)),
                                      ),
                                    )
                                  ],
                                )
                              : Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.only(left: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      // padding: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataTables extends StatelessWidget {
  DataTables({
    Key? key,
  }) : super(key: key);

  List<Map> _books = [
    {'id': "01", 'title': 'QBace, PIMG, ShopQ', 'date': '04 / 21 / 2022'},
    {'id': "02", 'title': 'QBace', 'date': '04 / 20 / 2022'},
    {'id': "03", 'title': 'ShopQ', 'date': '04 / 19 / 2022'},
    {'id': "04", 'title': 'ShopQ', 'date': '04 / 18 / 2022'},
    {'id': "05", 'title': 'ShopQ ,QBace', 'date': '04 / 17 / 2022'},
    {'id': "06", 'title': 'PIMG', 'date': '04 / 16 / 2022'},
    {'id': "07", 'title': 'ShopQ', 'date': '04 / 15 / 2022'},
    {'id': "08", 'title': 'ShopQ', 'date': '04 / 14 / 2022'},
    {'id': "09", 'title': 'ShopQ ,QBace', 'date': '04 / 13 / 2022'},
    {'id': "10", 'title': 'PIMG', 'date': '04 / 12 / 2022'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [_createDataTable()],
      ),
    );
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
              DataCell(Text(book['id'].toString())),
              DataCell(Text(book['title'])),
              DataCell(Text(book['date'])),
              DataCell(Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  "assets/images/download.png",
                  height: 18,
                  width: 18,
                ),
              ))
            ]))
        .toList();
  }

  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 35,
        showCheckboxColumn: true,
        dataRowHeight: 30,
        headingTextStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.4)),
        headingRowColor:
            MaterialStateProperty.all(Color.fromRGBO(41, 93, 192, 0.05)),
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('SI no')),
      DataColumn(label: Text('Project')),
      DataColumn(label: Text('Created on')),
      DataColumn(label: Text('Action'))
    ];
  }
}
