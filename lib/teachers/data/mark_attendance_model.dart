// class StudentAttendance {
//   final String name;
//   final String studentClass;
//   String status; // "Present", "Absent", "Not Marked"

//   StudentAttendance({
//     required this.name,
//     required this.studentClass,
//     this.status = "Not Marked",
//   });
// }

class StudentAttendance {
  final String name;
  final String date;
  final String id;
  final String className;
  final bool isMarked;
  final String status; // "Present", "Absent", "Not Marked"

  StudentAttendance({
    required this.name,
    required this.date,
    required this.id,
    required this.className,
    required this.isMarked,
    required this.status,
  });
}
