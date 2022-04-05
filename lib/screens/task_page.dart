import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:report_generator/controller/task_controller.dart';
import 'package:http/http.dart' as http;
import 'package:report_generator/models/project_model.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController(
    initialPage: 0,
  );
  List projectNameList = ["Morphfit", "Qbace"];
  late TabController _tabController;
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final taskName = TextEditingController();
  final taskid = TextEditingController();
  final projectName = TextEditingController();
  final taskDescription = TextEditingController();
  int selectedIndex = 0;
  final now = DateTime.now();
  String formatter = "";
  String status = "In Progress";
  String? _startTime;
  TaskController controller = TaskController();
  String? _endTime;
  String dropdownValue = 'One';
  List<Project> countryList = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    formatter = DateFormat('yMd').format(now);
    dateController.text = formatter;
    print("A");
    getData();
  }

  getData() async {
    var pro = await controller.getProjectName();
    var projects = pro as Map;
    print(projects["data"]["records"][0]['projectName']);
    //  for (final name in projects.keys) {
    //         final value = projects[name];
    //         print('$name,$value'); // prints entries like "AED,3.672940"
    //         await storage.write(
    //           key: name,
    //           value: value.toString(),
    //         );
    //       }
    // projectNameList = controller.getProjectName();
    // setState(() {
    //   projectNameList;
    // });
    // projectNameList.toString();
    // projectNameList = pro.cast<String>();
    print(projects.runtimeType);

    print("EXECUTE");
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _controller.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    taskName.dispose();
    taskDescription.dispose();
  }

  void onAddButtonTapped(int index) {
    // use this to animate to the page
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

    // // or this to jump to it without animating
    // pageController.jumpToPage(index);
  }

  Future<void> _show(TextEditingController controller) async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _startTime = result.format(context);
        controller.text = _startTime!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          color: Color.fromRGBO(10, 228, 176, 0.6),
          child: Container(
            padding: EdgeInsets.all(0.0),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/sign.png"),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 220),
              color: Colors.white,
              child: Column(children: [
                Container(
                    height: 45,
                    decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        // borderRadius: BorderRadius.only(bottomLeft: )
                        ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          RawMaterialButton(
                              fillColor: Color.fromRGBO(10, 228, 176, 0.8),
                              onPressed: () {
                                onAddButtonTapped(0);
                              },
                              child: Text("Task Page")),
                          RawMaterialButton(
                              onPressed: () {
                                onAddButtonTapped(1);
                              },
                              child: Text("Report")),
                        ],
                      ),
                    )),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    children: [
                      Expanded(
                          child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: dateController,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder()),
                                    )
                                  ],
                                )),
                                SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Project Name"),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder()),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Task ID"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()),
                                    )
                                  ],
                                )),
                                SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Task Name"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: taskName,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Status"),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 0;
                                      status = "In Progress";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.amber),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                          ),
                                          selectedIndex == 0
                                              ? Container(
                                                  height: 12,
                                                  width: 12,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.amber),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("In Progress"),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 1;
                                      status = "Completed";
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                          ),
                                          selectedIndex == 1
                                              ? Container(
                                                  height: 12,
                                                  width: 12,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.green),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("Completed"),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Start Time"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      controller: startTimeController,
                                      onTap: () {
                                        _show(startTimeController);
                                      },
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.av_timer,
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder()),
                                    )
                                  ],
                                )),
                                SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("End Time"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        readOnly: false,
                                        onTap: () {
                                          _show(endTimeController);
                                        },
                                        controller: endTimeController,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.av_timer,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder()),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Description"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    minLines: 2,
                                    maxLines: null,
                                    controller: taskDescription,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Text("Cancel",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      log("STATUS:--> " + status.toString());
                                      controller.addTask(
                                          dateController.text,
                                          startTimeController.text,
                                          endTimeController.text,
                                          status,
                                          taskName.text,
                                          taskDescription.text,
                                          context);
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Text("Add",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(10, 228, 176, 0.65),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                10, 228, 176, 0.65))),
                                    child: Text(
                                      "Save",
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                      Container(
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
