class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(26, 'Dec', 'ELectronics', 'Monday', '9:00am'),
  DataSheet(27, 'Dec', 'Data Structures', 'Tuesday', '10:00am'),
  DataSheet(13, 'Dec', 'Computer Organisation', 'Wednesday', '9:30am'),
  DataSheet(14, 'Dec', 'Automata Theory', 'Thursday', '11:00am'),
  DataSheet(15, 'Dec', 'Discrete Structures', 'Friday', '9:00am'),
];
