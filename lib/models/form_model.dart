class FormModel {
  int id;
  String? date;
  String? projectName;
  String? taskName;
  String? issueId;
  String? startTime;
  String? endTime;
  String? descriptions;
  String? status;

  FormModel({
    required this.id,
    this.date,
    this.projectName,
    this.taskName,
    this.issueId,
    this.startTime,
    this.endTime,
    this.descriptions,
    this.status,
  });
}
