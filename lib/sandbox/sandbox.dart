import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:report_generator/models/form_model.dart';
import 'package:report_generator/sandbox/sandbox1.dart';
import 'package:report_generator/sandbox/sandbox_con.dart';

import '../controller/task_controller.dart';
// import 'package:multi_form_app/contact_model.dart';

class ContactFormItemWidget extends StatefulWidget {
  ContactFormItemWidget(
      {Key? key,
      required this.contactModel,
      required this.onRemove,
      this.valueList,
      this.index})
      : super(key: key);

  final index;
  FormModel contactModel;
  final Function onRemove;
  var valueList;
  // final Function onAdd;
  final state = _ContactFormItemWidgetState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  final storage = FlutterSecureStorage();
  late String? token;

  var status_list = ["In Progress", "Completed"];
  var project_list = ["Morphfit", "Qbace", "TrueKarma"];

  String _currentSelectedValue = 'Morphfit';
  String _currentSelectedStatus = 'In Progress';
  late String _hour, _minute, _time;
  bool selectedStatus = false;
  bool selectedProject = false;
  List storeDatas = [];

  final dateController = TextEditingController();
  TaskController controller = TaskController();
  TextEditingController project_name = TextEditingController();
  TextEditingController task_name = TextEditingController();
  TextEditingController issue_id = TextEditingController();
  TextEditingController descriptions = TextEditingController();
  TextEditingController start_time = TextEditingController();

  TextEditingController end_time = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool projectDropDown = false;

  final now = DateTime.now();
  String formatter = "";

  bool isValidated() => state.validate();
}

class _ContactFormItemWidgetState extends State<ContactFormItemWidget> {
  final formKey = GlobalKey<FormState>();
  SandBoxController controller = SandBoxController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getToken();
    widget.formatter = DateFormat('dd-MM-y').format(widget.now);
    print("DATE" + widget.formatter);
    widget.dateController.text = widget.formatter;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              widget.index >= 1
                  ? GestureDetector(
                      onTap: () {
                        print("___________________");
                        print(widget.contactModel.id);
                        print(widget.index);
                        // print(widget.contactModel.length.toString())
                        // widget.onAdd();
                        //  widget.multiContactFormWidget.onAdd();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 76, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Color(0xFFF82626),
                            ),
                            Text(
                              "Delete this option",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFF82626),
                              )),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
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
                                            width: 350,
                                          ),
                                          child: TextFormField(
                                            controller: widget.dateController,
                                            readOnly: true,
                                            onChanged: (value) =>
                                                widget.contactModel.date =
                                                    widget.dateController.text,
                                            onSaved: (value) =>
                                                widget.contactModel.date =
                                                    widget.dateController.text,
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
                                            constraints:
                                                BoxConstraints.tightFor(
                                              width: 350,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: false,

                                                  // value: true,
                                                  items: widget.project_list
                                                      .map((item) {
                                                    return new DropdownMenuItem(
                                                      child: Container(
                                                        width:
                                                            150, //expand here
                                                        child: new Text(
                                                          item,
                                                        ),
                                                      ),
                                                      value: item,
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      print("id: ");
                                                      widget.selectedProject =
                                                          true;
                                                      widget._currentSelectedValue =
                                                          value.toString();
                                                      widget.contactModel
                                                              .projectName =
                                                          value.toString();
                                                      print("IDS" +
                                                          widget.contactModel.id
                                                              .toString() +
                                                          "value: " +
                                                          value.toString());

                                                      update(
                                                          widget.contactModel.id
                                                              .toString(),
                                                          value.toString());
                                                    });
                                                  },
                                                  hint: Container(
                                                    margin: EdgeInsets.all(8),
                                                    // width: 150, //and here
                                                    child: Text(
                                                      widget.selectedProject
                                                          ? widget
                                                              ._currentSelectedValue
                                                          : "Select ",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                            SizedBox(
                              height: 8.51,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          width: 350,
                                        ),
                                        child: TextFormField(
                                          validator: (value) =>
                                              value!.length > 3
                                                  ? null
                                                  : "Enter Name",
                                          controller: widget.task_name,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          width: 350,
                                        ),
                                        child: TextFormField(
                                          controller: widget.issue_id,
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
                                          onChanged: (val) {},
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          width: 350,
                                        ),
                                        child: TextFormField(
                                          controller: widget.start_time,
                                          readOnly: true,
                                          onTap: () async {
                                            final TimeOfDay? picked =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: widget.selectedTime,
                                            );
                                            print("Time Stamp" +
                                                picked.toString());
                                            if (picked != null)
                                              setState(() {
                                                widget.selectedTime = picked;
                                                print(widget.selectedTime);
                                                widget._hour = widget
                                                            .selectedTime.hour <
                                                        10
                                                    ? "0" +
                                                        widget.selectedTime.hour
                                                            .toString()
                                                    : widget.selectedTime.hour
                                                        .toString();
                                                widget._minute = widget
                                                            .selectedTime
                                                            .minute <
                                                        10
                                                    ? "0" +
                                                        widget
                                                            .selectedTime.minute
                                                            .toString()
                                                    : widget.selectedTime.minute
                                                        .toString();
                                                print(picked.period.name);
                                                widget._time = widget._hour +
                                                    ' : ' +
                                                    widget._minute +
                                                    ' ' +
                                                    (picked.period.name)
                                                        .toString()
                                                        .toUpperCase();

                                                print(widget._time);
                                                widget.start_time.text =
                                                    widget._time;
                                                // start_time.text = formatDate(
                                                // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
                                                // [hh, ':', nn, " ", am]).toString();
                                              });
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          width: 350,
                                        ),
                                        child: TextFormField(
                                          onTap: () async {
                                            final TimeOfDay? picked =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: widget.selectedTime,
                                            );
                                            if (picked != null)
                                              setState(() {
                                                widget.selectedTime = picked;
                                                print(widget.selectedTime);
                                                widget._hour = widget
                                                            .selectedTime.hour <
                                                        10
                                                    ? "0" +
                                                        widget.selectedTime.hour
                                                            .toString()
                                                    : widget.selectedTime.hour
                                                        .toString();
                                                widget._minute = widget
                                                            .selectedTime
                                                            .minute <
                                                        10
                                                    ? "0" +
                                                        widget
                                                            .selectedTime.minute
                                                            .toString()
                                                    : widget.selectedTime.minute
                                                        .toString();
                                                print(picked.period.name);
                                                widget._time = widget._hour +
                                                    ' : ' +
                                                    widget._minute +
                                                    ' ' +
                                                    (picked.period.name)
                                                        .toString()
                                                        .toUpperCase();

                                                print(widget._time);
                                                widget.end_time.text =
                                                    widget._time;
                                                // start_time.text = formatDate(
                                                // DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
                                                // [hh, ':', nn, " ", am]).toString();
                                              });
                                          },
                                          controller: widget.end_time,
                                          decoration: InputDecoration(
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            width: 350,
                                          ),
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

                                                // value: true,
                                                items: widget.status_list
                                                    .map((item) {
                                                  return new DropdownMenuItem(
                                                    child: Container(
                                                      width: 150, //expand here
                                                      child: new Text(
                                                        item,
                                                      ),
                                                    ),
                                                    value: item,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    widget.selectedStatus =
                                                        true;
                                                    print("RES" +
                                                        widget
                                                            ._currentSelectedStatus);
                                                    print("value" +
                                                        value.toString());
                                                    widget._currentSelectedStatus =
                                                        value.toString();
                                                  });
                                                },
                                                hint: Container(
                                                  margin: EdgeInsets.all(8),
                                                  // width: 150, //and here
                                                  child: Text(
                                                    widget.selectedStatus
                                                        ? widget
                                                            ._currentSelectedStatus
                                                        : "Select ",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
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
                        ),
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
                            constraints: BoxConstraints.tightFor(width: 300),
                            child: TextFormField(
                              controller: widget.descriptions,
                              minLines: 14,
                              maxLines: 14,
                              decoration: InputDecoration(
                                  hintText: "Type here",
                                  hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 0, 0, 0.4)),
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    //Validate Form Fields
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }

  void update(String id, String value) {
    try {
      print("habi mithuias");
      print(controller.values);
      print("habi mithuias");
      //code that has potential to throw an exception
      Map<String, dynamic> jsonFormat = {"id": id, "value": value};
      print("objectdfdg" + jsonFormat.toString());

      var d = controller.values.add(jsonFormat);
      controller.addValue.add(0);
      // returnMovies.addAll(json.decode(returnUpcoming.body))
      print("habi ");
      print(controller.values);
      print("habi ");
      print(controller.values.toString());
    } catch (e) {
      //code
      print(e.toString());
    }
  }
}
