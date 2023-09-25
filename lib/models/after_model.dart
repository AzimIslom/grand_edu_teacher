class AfterModel {
  late String id;
  late String feedback;
  late DateTime time;

  AfterModel({
    required this.id,
    required this.time,
    required this.feedback,
  });

  AfterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = DateTime.parse(json['time']);
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'time': time.toIso8601String(),
        'feedback': feedback,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
