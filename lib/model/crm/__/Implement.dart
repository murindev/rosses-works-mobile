class Implement {
  int id;
  int parent;
  int lidId; // lid_id
  String date;
  int master;
  String startDate; // start_date
  String startTime; // start_date
  String endDate; // end_date
  String endTime; // end_date
  int user;
  String note;
  int reason;

  //created_at
  //updated_at

  Implement(
      {this.id,
      this.parent,
      this.lidId,
      this.date,
      this.master,
      this.startDate,
      this.startTime,
      this.endDate,
      this.endTime,
      this.user,
      this.note,
      this.reason});

  factory Implement.fromJson(Map json) {
    List startDateList = json['start_date'].toString().split(' ');
    List endDateList = json['end_date'].toString().split(' ');

    return Implement(
        id: json['id'],
        parent: json['parent'],
        lidId: json['lid_id'],
        date: json['date'],
        master: json['master'],
        startDate: startDateList[0],
        startTime: startDateList[1],
        endDate: endDateList[0],
        endTime: endDateList[1],
        user: json['user'],
        note: json['note'],
        reason: json['reason']);
  }
  //Map<String, dynamic>.from(yourData)
/*  factory Implement.fromMap(Map ob) {
    return Implement(
        id: ob['id'],
        parent: ob['parent'],
        lidId: ob['lid_id'],
        date: ob['date'],
        master: ob['master'],
        startDate: ob['startDate'],
        endDate: ob['endDate'],
        user: ob['user'],
        note: ob['note'],
        reason: ob['reason']);
  }*/
}
