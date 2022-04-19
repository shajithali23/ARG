import 'package:flutter/material.dart';

class Employee {
  String firstName;
  String lastName;
  int id;
  String email;
  Employee(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.email});
  static List<Employee> getUsers() {
    return <Employee>[
      Employee(
          firstName: "Shubham",
          lastName: "B",
          id: 1001,
          email: "shubham.b@walkingtree.tech"),
      Employee(
          firstName: "HariKrishna",
          lastName: "S",
          id: 1001,
          email: "harikrishna.s@walkingtree.tech"),
      Employee(
          firstName: "Vishnu",
          lastName: "P",
          id: 1001,
          email: "vishnu.p@walkingtree.tech"),
      Employee(
          firstName: "Suman",
          lastName: "R",
          id: 1001,
          email: "Suman.r@walkingtree.tech "),
      Employee(
          firstName: "Prashanth",
          lastName: "K",
          id: 1001,
          email: "Prashanth.k@walkingtree.tech ")
    ];
  }
}

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  late List<Employee> emps;
  @override
  void initState() {
    emps = Employee.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: tableBody(
              context,
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        child: Expanded(
          child: DataTable(
            dataRowHeight: 50,
            dividerThickness: 1,
            columnSpacing: 88,
            columns: [
              DataColumn(
                label: Text(
                  "First Name",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
                numeric: false,
                tooltip: "This is First Name",
              ),
              DataColumn(
                label: Text(
                  "Last Name",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text(
                  "Id",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
                numeric: true,
              ),
              DataColumn(
                label: Text(
                  "Email Id",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
                numeric: false,
              ),
            ],
            rows: emps
                .map(
                  (emp) => DataRow(cells: [
                    DataCell(
                      Text(emp.firstName),
                    ),
                    DataCell(
                      Text(emp.firstName),
                    ),
                    DataCell(
                      Text('${emp.id}'),
                    ),
                    DataCell(
                      Text('${emp.email}'),
                    ),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
