class AdditionalLessonModel {
  late String student;
  late String support;
  late DateTime time;
  late String target;
  late DateTime meeting;
  late String id;

  AdditionalLessonModel({
    required this.time,
    required this.student,
    required this.support,
    required this.meeting,
    required this.target,
    required this.id,
  });

  AdditionalLessonModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']);
    student = json['student'];
    support = json['support'];
    meeting = DateTime.parse(json['meeting']);
    target = json['target'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'time': time.toIso8601String(),
        'student': student,
        'support': support,
        'meeting': meeting.toIso8601String(),
        'target': target,
    'id': id,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
