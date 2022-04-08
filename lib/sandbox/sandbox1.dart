import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:report_generator/models/form_model.dart';
import 'package:report_generator/sandbox/sandbox.dart';
import 'package:report_generator/sandbox/sandbox_con.dart';

class MultiContactFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MultiContactFormWidgetState();
  }
}

class _MultiContactFormWidgetState extends State<MultiContactFormWidget> {
  SandBoxController sandBoxController = SandBoxController();
  // List<ContactFormItemWidget> contactForms = List.empty(growable: true);

  // late List<Map<String, dynamic>> _values;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sandBoxController.values = [{}];
    print(sandBoxController.contactForms.length);
    setState(() {
      FormModel _contactModel =
          FormModel(id: sandBoxController.contactForms.length);
      sandBoxController.contactForms.add(ContactFormItemWidget(
        index: sandBoxController.contactForms.length,
        contactModel: _contactModel,
        onRemove: () => onRemove(_contactModel),
        valueList: sandBoxController.values,
        // onAdd: () => onAdd(),
      ));
      print("LEN" + sandBoxController.contactForms.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ElevatedButton(
      //     // color: Theme.of(context).primaryColor,
      //     onPressed: () {
      //       onSave();
      //     },
      //     child: Text("Save"),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     onAdd();
      //   },
      // ),
      body: StreamBuilder(
          stream: sandBoxController.getValue,
          builder: (context, s) {
            return Container(
              // width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: sandBoxController.contactForms.length,
                      itemBuilder: (_, index) {
                        print("index" + index.toString());
                        return sandBoxController.contactForms[index];
                      }),
                  GestureDetector(
                    onTap: () {
                      print("hai");
                      onAdd();
                      // widget.onAdd();
                      //  widget.multiContactFormWidget.onAdd();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 94, vertical: 8),
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      // alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 12),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
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
                          GestureDetector(
                            onTap: () {
                              onSave();
                              // log(dateController.text);
                              // log(_currentSelectedValue);
                              // log(task_name.text);
                              // log(issue_id.text);
                              // log(start_time.text);
                              // log(end_time.text);
                              // log(_currentSelectedStatus);
                              // log(descriptions.text);
                              // controller.addTask(
                              //     date: dateController.text,
                              //     startTime: start_time.text,
                              //     issueId: issue_id.text,
                              //     endTime: end_time.text,
                              //     projectName: _currentSelectedValue,
                              //     taskName: task_name.text,
                              //     status: _currentSelectedStatus,
                              //     desc: descriptions.text,
                              //     token: token.toString(),
                              //     context: context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  onSave() {
    print("hai");
    bool allValid = true;
    print("hai1");
    print(sandBoxController.contactForms);

    // for (var element in contactForms) {
    //   allValid = (allValid && element.isValidated());
    //   print(allValid);
    // }
    // print("hai2");

    sandBoxController.contactForms
        .forEach((element) => allValid = (allValid && element.isValidated()));
    if (allValid) {
      print("object");
      List<String?> taskName = sandBoxController.contactForms
          .map((e) => e.contactModel.taskName)
          .toList();
      debugPrint("$taskName");
    } else {
      debugPrint("Form is Not Valid");
    }
  }

  //Delete specific form
  onRemove(FormModel contact) {
    setState(() {
      int index = sandBoxController.contactForms
          .indexWhere((element) => element.contactModel.id == contact.id);

      if (sandBoxController.contactForms != null)
        sandBoxController.contactForms.removeAt(index);
    });
  }

  onAdd() {
    print("my" + sandBoxController.contactForms.length.toString());

    setState(() {
      FormModel _contactModel =
          FormModel(id: sandBoxController.contactForms.length);
      sandBoxController.contactForms.add(ContactFormItemWidget(
        index: sandBoxController.contactForms.length,
        contactModel: _contactModel,
        // onAdd: onAdd(),
        onRemove: () => onRemove(_contactModel),
      ));
    });
    print(sandBoxController.contactForms.length);
  }
}
