import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Employee {
  Employee(this.id, this.name, this.designation, this.salary, this.startTime,
      this.endTime, this.duration, this.status, this.description);
  final int id;
  final String name;
  final String designation;
  final int salary;
  final String startTime;
  final String endTime;
  final String duration;
  final String status;
  final String description;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'designation', value: dataGridRow.designation),
              DataGridCell<int>(
                  columnName: 'salary', value: dataGridRow.salary),
              DataGridCell<String>(
                  columnName: 'Start Time', value: dataGridRow.startTime),
              DataGridCell<String>(
                  columnName: 'End Time', value: dataGridRow.endTime),
              DataGridCell<String>(
                  columnName: 'Duration', value: dataGridRow.duration),
              DataGridCell<String>(
                  columnName: 'Status', value: dataGridRow.status),
              DataGridCell<String>(
                  columnName: 'Description', value: dataGridRow.description),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'salary')
              ? Alignment.center
              : Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late EmployeeDataSource _employeeDataSource;

  List<Employee> _employees = <Employee>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000, "10:15 AM", "12:15 AM",
          "02:00", "Completed", "Description"),
      Employee(10001, 'James', 'Project Lead', 20000, "10:15 AM", "12:15 AM",
          "02:00", "Completed", "Description"),
      Employee(10001, 'James', 'Project Lead', 20000, "10:15 AM", "12:15 AM",
          "02:00", "Completed", "Description"),
      Employee(10001, 'James', 'Project Lead', 20000, "10:15 AM", "12:15 AM",
          "02:00", "Completed", "Description"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Header(),
          Container(
            padding: EdgeInsets.fromLTRB(18, 12, 0, 0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 4.0,
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            selectedIndex = 0;
                          });
                        }),
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Text("Daily Report",
                                  style: selectedIndex == 0
                                      ? GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF295DC0),
                                              fontWeight: FontWeight.w500))
                                      : GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.3)),
                                          fontWeight: FontWeight.w500)),
                              selectedIndex == 0
                                  ? Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      color: Color(0xFF295DC0),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Text("Monthly Report",
                                  style: selectedIndex == 0
                                      ? GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.3)),
                                          fontWeight: FontWeight.w500)
                                      : GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF295DC0),
                                              fontWeight: FontWeight.w500))),
                              selectedIndex == 0
                                  ? Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      // color: Color(0xFF295DC0),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      color: Color(0xFF295DC0),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                selectedIndex == 1
                    ? Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FilterField(
                                hint: "Year", icon: Icons.arrow_drop_down),
                            SizedBox(
                              width: 12,
                            ),
                            FilterField(
                                hint: "Project", icon: Icons.arrow_drop_down),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FilterField(
                                hint: "Date", icon: FontAwesomeIcons.calendar),
                            SizedBox(
                              width: 12,
                            ),
                            FilterField(
                                hint: "Project", icon: Icons.arrow_drop_down),
                            SizedBox(
                              width: 12,
                            ),
                            FilterField(hint: "Search", icon: Icons.search),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          selectedIndex == 0
              ? Column(
                  children: [
                    ShadowContainer(
                      child: AddIcon(),
                    ),
                    ShadowContainer(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 18),
                                child: Text(
                                  "04/02/2022",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(0, 0, 0, 0.8),
                                          fontWeight: FontWeight.w500)),
                                )),
                            Container(
                                child: Row(
                              children: [
                                ActionButton(
                                  child: Image.asset(
                                    "assets/images/copy.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: "Copy",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ActionButton(
                                  child: Icon(
                                    Icons.edit,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                  ),
                                  label: "Edit",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ActionButton(
                                  child: Icon(Icons.delete,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  label: "Delete",
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                              ],
                            ))
                          ],
                        ),
                        Divider(),
                        SfDataGrid(
                          source: _employeeDataSource,
                          columns: <GridColumn>[
                            GridColumn(
                                columnName: 'id',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Date',
                                    ))),
                            GridColumn(
                                columnName: 'name',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Project'))),
                            GridColumn(
                                columnName: 'designation',
                                width: 120,
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Task'))),
                            GridColumn(
                                columnName: 'salary',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Issue Id'))),
                            GridColumn(
                                columnName: 'startTime',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Start Time'))),
                            GridColumn(
                                columnName: 'endTime',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('End Time'))),
                            GridColumn(
                                columnName: 'duration',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Durations'))),
                            GridColumn(
                                columnName: 'status',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Status'))),
                            GridColumn(
                                columnName: 'description',
                                columnWidthMode: ColumnWidthMode.lastColumnFill,
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Description'))),
                          ],
                        ),
                      ],
                    )),
                    ShadowContainer(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 18),
                                child: Text(
                                  "04/02/2022",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(0, 0, 0, 0.8),
                                          fontWeight: FontWeight.w500)),
                                )),
                            Container(
                                child: Row(
                              children: [
                                ActionButton(
                                  child: Image.asset(
                                    "assets/images/copy.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  label: "Copy",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ActionButton(
                                  child: Icon(
                                    Icons.edit,
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                  ),
                                  label: "Edit",
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ActionButton(
                                  child: Icon(Icons.delete,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  label: "Delete",
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                              ],
                            ))
                          ],
                        ),
                        Divider(),
                        SfDataGrid(
                          source: _employeeDataSource,
                          columns: <GridColumn>[
                            GridColumn(
                                columnName: 'id',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Date',
                                    ))),
                            GridColumn(
                                columnName: 'name',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Project'))),
                            GridColumn(
                                columnName: 'designation',
                                width: 120,
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Task'))),
                            GridColumn(
                                columnName: 'salary',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Issue Id'))),
                            GridColumn(
                                columnName: 'startTime',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Start Time'))),
                            GridColumn(
                                columnName: 'endTime',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('End Time'))),
                            GridColumn(
                                columnName: 'duration',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Durations'))),
                            GridColumn(
                                columnName: 'status',
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Status'))),
                            GridColumn(
                                columnName: 'description',
                                columnWidthMode: ColumnWidthMode.lastColumnFill,
                                label: Container(
                                    color: Color.fromRGBO(41, 93, 192, 0.2),
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text('Description'))),
                          ],
                        ),
                      ],
                    )),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      child: Table(border: TableBorder.all(), children: [
                        TableRow(children: [
                          Text(
                            "Education",
                            textScaleFactor: 1.5,
                          ),
                          Text("Institution name", textScaleFactor: 1.5),
                          Text("University", textScaleFactor: 1.5),
                        ]),
                      ]),
                    )
                  ],
                )
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.child,
    required this.label,
  }) : super(key: key);
  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        child,
        SizedBox(
          width: 4,
        ),
        Text(label),
      ],
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class AddIcon extends StatelessWidget {
  const AddIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.add,
        size: 24,
        color: Color.fromRGBO(41, 93, 192, 1),
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        "Add New",
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(41, 93, 192, 1),
                fontWeight: FontWeight.w500)),
      )
    ]);
  }
}

class FilterField extends StatelessWidget {
  const FilterField({
    Key? key,
    required this.hint,
    required this.icon,
  }) : super(key: key);
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 250, height: 40),
      child: TextFormField(
        // controller: dateController,
        readOnly: true,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(fontWeight: FontWeight.w400)),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 4, left: 8),
            hintText: hint,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FaIcon(
                icon,
                color: Color.fromRGBO(77, 77, 77, 1),
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.4)),
                borderRadius: BorderRadius.circular(6))),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      color: Color(0xFF295DC0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 150, height: 32),
            child: Image.asset(
              "assets/images/logo2.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              "Logout",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
