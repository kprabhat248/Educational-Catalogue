class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData('Electronics', 'Bipolar Junction', '17 Nov 2022',
      '20 Nov 2022', 'Pending'),
  AssignmentData('Data Structures', 'Bst and Avl Trees', '18 Nov 2022',
      '22 Nov 2021', 'Submitted'),
  AssignmentData('Computer Organisation ', 'Cache management', '21 Oct 2022',
      '22 Oct 2022', 'Not Submitted'),
  AssignmentData('Discrete Structures', 'Graph theory', '17 Nov 2022',
      '30 Nov 2022', 'Pending'),
];
