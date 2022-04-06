import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReportGenerate extends StatefulWidget {
  ReportGenerate({Key? key}) : super(key: key);

  @override
  State<ReportGenerate> createState() => _ReportGenerateState();
}

class _ReportGenerateState extends State<ReportGenerate> {
  var list = ["1", "2", "3"];

  String _currentSelectedValue = 'Morphfit';
  String _currentSelectedStatus = 'In Progress';
  late String _hour, _minute, _time;

  final dateController = TextEditingController();
  TextEditingController start_time = TextEditingController();

  TextEditingController end_time = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool projectDropDown = false;

  final now = DateTime.now();
  String formatter = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formatter = DateFormat('dd-MM-y').format(now);
    print("DATE" + formatter);
    dateController.text = formatter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  blurRadius: 30.0,
                  offset: Offset(0, 4)),
            ]),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 12),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                  Text(
                    "Generate Report",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
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
                                              width: 350, height: 50),
                                          child: TextFormField(
                                            controller: dateController,
                                            readOnly: true,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            decoration: InputDecoration(
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.calendar,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              width: 350, height: 50),
                                          child: !projectDropDown
                                              ? FormField<String>(
                                                  builder:
                                                      (FormFieldState<String>
                                                          state) {
                                                    return InputDecorator(
                                                      decoration:
                                                          InputDecoration(
                                                              // labelStyle: textStyle,
                                                              errorStyle: TextStyle(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  fontSize:
                                                                      16.0),
                                                              hintText:
                                                                  'Please select expense',
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0))),
                                                      isEmpty:
                                                          _currentSelectedValue ==
                                                              '',
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          value:
                                                              _currentSelectedValue,
                                                          isDense: true,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              _currentSelectedValue =
                                                                  newValue
                                                                      .toString();
                                                              state.didChange(
                                                                  newValue);
                                                            });
                                                          },
                                                          items: <String>[
                                                            'Morphfit',
                                                            'Qbace',
                                                            'TrueKarma',
                                                            'ShopQ'
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )

                                              //   isExpanded: true,
                                              //   value: _currentSelectedValue,
                                              //   icon: Icon(
                                              //       Icons.arrow_drop_down),
                                              //   iconSize: 24,
                                              //   elevation: 16,
                                              //   decoration: InputDecoration(
                                              //       hintStyle:
                                              //           GoogleFonts.poppins(
                                              //               textStyle: TextStyle(
                                              //                   fontWeight:
                                              //                       FontWeight
                                              //                           .w400,
                                              //                   color: Colors
                                              //                       .black)),
                                              //       border: OutlineInputBorder(
                                              //           borderSide:
                                              //               BorderSide(
                                              //                   color: Color
                                              //                       .fromRGBO(
                                              //                           0,
                                              //                           0,
                                              //                           0,
                                              //                           0.4)),
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(6))),
                                              //   style: GoogleFonts.poppins(
                                              //       textStyle: TextStyle(
                                              //           fontWeight:
                                              //               FontWeight.w400,
                                              //           color: Colors.black)),
                                              //   onChanged: (newValue) {
                                              //     setState(() {
                                              //       _currentSelectedValue =
                                              //           newValue.toString();
                                              //     });
                                              //   },
                                              //   items: <String>[
                                              //     'Morphfit',
                                              //     'Qbace',
                                              //     'TrueKarma',
                                              //     'ShopQ'
                                              //   ].map<
                                              //           DropdownMenuItem<
                                              //               String>>(
                                              //       (String value) {
                                              //     return DropdownMenuItem<
                                              //         String>(
                                              //       value: value,
                                              //       child: Text(value),
                                              //     );
                                              //   }).toList(),
                                              // )
                                              : TextFormField(
                                                  readOnly: true,
                                                  onTap: () {
                                                    setState(() {
                                                      projectDropDown = true;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: "Select",
                                                      suffixIcon: Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.black,
                                                      ),
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black)),
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.4)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6))),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.51,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Task",
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
                                              width: 350, height: 50),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Type here",
                                                hintStyle: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Issue ID",
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
                                              width: 350, height: 50),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Type here",
                                                hintStyle: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400)),
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
                                ],
                              ),
                              SizedBox(
                                height: 8.51,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Start time",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 350, height: 50),
                                          child: TextFormField(
                                            controller: start_time,
                                            readOnly: true,
                                            onTap: () async {
                                              final TimeOfDay? picked =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: selectedTime,
                                              );
                                              if (picked != null)
                                                setState(() {
                                                  selectedTime = picked;
                                                  print(selectedTime);
                                                  _hour = selectedTime.hour < 10
                                                      ? "0" +
                                                          selectedTime.hour
                                                              .toString()
                                                      : selectedTime.hour
                                                          .toString();
                                                  _minute =
                                                      selectedTime.minute < 10
                                                          ? "0" +
                                                              selectedTime
                                                                  .minute
                                                                  .toString()
                                                          : selectedTime.minute
                                                              .toString();
                                                  print(picked.period.name);
                                                  _time = _hour +
                                                      ' : ' +
                                                      _minute +
                                                      ' ' +
                                                      (picked.period.name)
                                                          .toString()
                                                          .toUpperCase();

                                                  print(_time);
                                                  start_time.text = _time;
                                                  // start_time.text = formatDate(
                                                  // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
                                                  // [hh, ':', nn, " ", am]).toString();
                                                });
                                            },
                                            decoration: InputDecoration(
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.clock,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "End time",
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
                                              width: 350, height: 50),
                                          child: TextFormField(
                                            onTap: () async {
                                              final TimeOfDay? picked =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: selectedTime,
                                              );
                                              if (picked != null)
                                                setState(() {
                                                  selectedTime = picked;
                                                  print(selectedTime);
                                                  _hour = selectedTime.hour < 10
                                                      ? "0" +
                                                          selectedTime.hour
                                                              .toString()
                                                      : selectedTime.hour
                                                          .toString();
                                                  _minute =
                                                      selectedTime.minute < 10
                                                          ? "0" +
                                                              selectedTime
                                                                  .minute
                                                                  .toString()
                                                          : selectedTime.minute
                                                              .toString();
                                                  print(picked.period.name);
                                                  _time = _hour +
                                                      ' : ' +
                                                      _minute +
                                                      ' ' +
                                                      (picked.period.name)
                                                          .toString()
                                                          .toUpperCase();

                                                  print(_time);
                                                  end_time.text = _time;
                                                  // start_time.text = formatDate(
                                                  // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
                                                  // [hh, ':', nn, " ", am]).toString();
                                                });
                                            },
                                            controller: end_time,
                                            decoration: InputDecoration(
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.clock,
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
                                ],
                              ),
                              SizedBox(
                                height: 8.51,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Status",
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
                                              width: 350, height: 50),
                                          child: 1 == 1
                                              ? FormField<String>(
                                                  builder:
                                                      (FormFieldState<String>
                                                          state) {
                                                    return InputDecorator(
                                                      decoration:
                                                          InputDecoration(
                                                              // labelStyle: textStyle,
                                                              errorStyle: TextStyle(
                                                                  color: Colors
                                                                      .redAccent,
                                                                  fontSize:
                                                                      16.0),
                                                              hintText:
                                                                  'Please select expense',
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0))),
                                                      isEmpty:
                                                          _currentSelectedStatus ==
                                                              '',
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          value:
                                                              _currentSelectedStatus,
                                                          isDense: true,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              _currentSelectedStatus =
                                                                  newValue
                                                                      .toString();
                                                              state.didChange(
                                                                  newValue);
                                                            });
                                                          },
                                                          items: <String>[
                                                            'In Progress',
                                                            'Completed',
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : TextFormField(
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                      hintText: "Select",
                                                      suffixIcon: Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.black,
                                                      ),
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black)),
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.4)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                    width: 350,
                                  )
                                  //     Container(
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             "Date",
                                  //             style: GoogleFonts.poppins(
                                  //                 textStyle: TextStyle(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color: Colors.black)),
                                  //           ),
                                  //           SizedBox(
                                  //             height: 4,
                                  //           ),
                                  //           ConstrainedBox(
                                  //             constraints:
                                  //                 BoxConstraints.tightFor(width: 300),
                                  //             child: TextFormField(
                                  //               decoration: InputDecoration(
                                  //                   suffixIcon: Icon(
                                  //                     Icons.date_range,
                                  //                     color:
                                  //                         Color.fromRGBO(77, 77, 77, 1),
                                  //                   ),
                                  //                   border: OutlineInputBorder(
                                  //                       borderSide: BorderSide(
                                  //                           color: Color.fromRGBO(
                                  //                               0, 0, 0, 0.4)),
                                  //                       borderRadius:
                                  //                           BorderRadius.circular(6))),
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  // //
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tightFor(width: 300),
                                child: TextFormField(
                                  minLines: 14,
                                  maxLines: 14,
                                  decoration: InputDecoration(
                                      hintText: "Type here",
                                      hintStyle: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.4)),
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xFF0046BE),
                        ),
                        Text(
                          "Add another option",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0046BE),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   child: Column(
            //     children: [
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Expanded(
            //               flex: 2,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Date",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 decoration: InputDecoration(
            //                                     suffixIcon: Padding(
            //                                       padding:
            //                                           const EdgeInsets.only(
            //                                               top: 8.0),
            //                                       child: FaIcon(
            //                                         FontAwesomeIcons.calendar,
            //                                         color: Color.fromRGBO(
            //                                             77, 77, 77, 1),
            //                                       ),
            //                                     ),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 24,
            //                       ),
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Project",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 readOnly: true,
            //                                 decoration: InputDecoration(
            //                                     hintText: "Select",
            //                                     suffixIcon: Icon(
            //                                       Icons.arrow_drop_down,
            //                                       color: Colors.black,
            //                                     ),
            //                                     hintStyle: GoogleFonts.poppins(
            //                                         textStyle: TextStyle(
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color: Colors.black)),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 8.51,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Task",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 decoration: InputDecoration(
            //                                     hintText: "Type here",
            //                                     hintStyle: GoogleFonts.poppins(
            //                                         textStyle: TextStyle(
            //                                             fontWeight:
            //                                                 FontWeight.w400)),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 24,
            //                       ),
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Issue ID",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 decoration: InputDecoration(
            //                                     hintText: "Type here",
            //                                     hintStyle: GoogleFonts.poppins(
            //                                         textStyle: TextStyle(
            //                                             fontWeight:
            //                                                 FontWeight.w400)),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 8.51,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Start time",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 decoration: InputDecoration(
            //                                     suffixIcon: Padding(
            //                                       padding:
            //                                           const EdgeInsets.only(
            //                                               top: 8.0),
            //                                       child: FaIcon(
            //                                         FontAwesomeIcons.clock,
            //                                         color: Color.fromRGBO(
            //                                             77, 77, 77, 1),
            //                                       ),
            //                                     ),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 24,
            //                       ),
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "End time",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 decoration: InputDecoration(
            //                                     suffixIcon: Padding(
            //                                       padding:
            //                                           const EdgeInsets.only(
            //                                               top: 8.0),
            //                                       child: FaIcon(
            //                                         FontAwesomeIcons.clock,
            //                                         color: Color.fromRGBO(
            //                                             77, 77, 77, 1),
            //                                       ),
            //                                     ),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 8.51,
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         child: Column(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Status",
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       fontWeight: FontWeight.w500,
            //                                       color: Colors.black)),
            //                             ),
            //                             SizedBox(
            //                               height: 4,
            //                             ),
            //                             ConstrainedBox(
            //                               constraints: BoxConstraints.tightFor(
            //                                   width: 350),
            //                               child: TextFormField(
            //                                 readOnly: true,
            //                                 decoration: InputDecoration(
            //                                     hintText: "Select",
            //                                     suffixIcon: Icon(
            //                                       Icons.arrow_drop_down,
            //                                       color: Colors.black,
            //                                     ),
            //                                     hintStyle: GoogleFonts.poppins(
            //                                         textStyle: TextStyle(
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color: Colors.black)),
            //                                     border: OutlineInputBorder(
            //                                         borderSide: BorderSide(
            //                                             color: Color.fromRGBO(
            //                                                 0, 0, 0, 0.4)),
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 6))),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 24,
            //                       ),

            //                       Container(
            //                         width: 350,
            //                       )
            //                       //     Container(
            //                       //       child: Column(
            //                       //         mainAxisAlignment: MainAxisAlignment.start,
            //                       //         crossAxisAlignment: CrossAxisAlignment.start,
            //                       //         children: [
            //                       //           Text(
            //                       //             "Date",
            //                       //             style: GoogleFonts.poppins(
            //                       //                 textStyle: TextStyle(
            //                       //                     fontWeight: FontWeight.w500,
            //                       //                     color: Colors.black)),
            //                       //           ),
            //                       //           SizedBox(
            //                       //             height: 4,
            //                       //           ),
            //                       //           ConstrainedBox(
            //                       //             constraints:
            //                       //                 BoxConstraints.tightFor(width: 300),
            //                       //             child: TextFormField(
            //                       //               decoration: InputDecoration(
            //                       //                   suffixIcon: Icon(
            //                       //                     Icons.date_range,
            //                       //                     color:
            //                       //                         Color.fromRGBO(77, 77, 77, 1),
            //                       //                   ),
            //                       //                   border: OutlineInputBorder(
            //                       //                       borderSide: BorderSide(
            //                       //                           color: Color.fromRGBO(
            //                       //                               0, 0, 0, 0.4)),
            //                       //                       borderRadius:
            //                       //                           BorderRadius.circular(6))),
            //                       //             ),
            //                       //           )
            //                       //         ],
            //                       //       ),
            //                       //     ),
            //                       // //
            //                     ],
            //                   ),
            //                 ],
            //               )),
            //           Expanded(
            //             child: Container(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Description",
            //                     style: GoogleFonts.poppins(
            //                         textStyle: TextStyle(
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.black)),
            //                   ),
            //                   SizedBox(
            //                     height: 4,
            //                   ),
            //                   ConstrainedBox(
            //                     constraints:
            //                         BoxConstraints.tightFor(width: 300),
            //                     child: TextFormField(
            //                       minLines: 14,
            //                       maxLines: 14,
            //                       decoration: InputDecoration(
            //                           hintText: "Type here",
            //                           hintStyle: GoogleFonts.poppins(
            //                               textStyle: TextStyle(
            //                                   fontWeight: FontWeight.w400)),
            //                           border: OutlineInputBorder(
            //                               borderSide: BorderSide(
            //                                   color:
            //                                       Color.fromRGBO(0, 0, 0, 0.4)),
            //                               borderRadius:
            //                                   BorderRadius.circular(6))),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Container(
            //         margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Icon(
            //               Icons.add,
            //               color: Color(0xFF0046BE),
            //             ),
            //             Text(
            //               "Add another option",
            //               style: GoogleFonts.poppins(
            //                   textStyle: TextStyle(
            //                 fontWeight: FontWeight.w400,
            //                 color: Color(0xFF0046BE),
            //               )),
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFDE5353))),
                    child: Text(
                      "Clear",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Color(0xFFDE5353),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Color(0xFF295DC0),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF295DC0))),
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Color(0xFFffffff),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
