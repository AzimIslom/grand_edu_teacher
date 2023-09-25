import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grand_edu_teacher/models/cat_model.dart';
import 'package:grand_edu_teacher/models/homework_model.dart';
import 'package:grand_edu_teacher/models/theme_model.dart';
import 'package:grand_edu_teacher/models/unit_model.dart';
import 'package:grand_edu_teacher/services/auth_service.dart';

import '../models/attendence_model.dart';
import '../models/branch_model.dart';
import '../models/group_model.dart';
import '../models/reception_model.dart';
import '../models/student_model.dart';
import '../models/support_model.dart';
import '../models/teacher_model.dart';
import '../utils/api.dart';

final fb = FBService();
final _fb = FirebaseFirestore.instance;

class FBService {
  ///add

  Future<void> addAttendance(
    List<AttendanceModel> attendance,
    GroupModel group,
  ) async {
    final time = group.lessons.last;
    final CollectionReference ref = _fb
        .collection(api.table)
        .doc(group.id)
        .collection("${time.year}${time.month}${time.day}");
    for (var i in attendance) {
      await ref.doc(i.student).set(i.toJson());
    }
    group.unit++;
    updateGroup(group);
  }

  /// get
  Future<TeacherModel> currTeacher() async {
    return await specialTeacher(auth.tel);
  }

  Future<UnitModel?> speUnit(String tel, int unit) async {
    try {
      final res = await _fb
          .collection(api.unit)
          .doc(tel)
          .collection(unit.toString())
          .doc(unit.toString())
          .get();
      return UnitModel.fromJson(res.data()!);
    } catch (e) {
      return null;
    }
  }

  // Future<List<ThemeModel>> allThemes() async {
  //   final data = await _fb.collection(api.themes).get();
  //   return data.docs.map((e) => ThemeModel.fromJson(e.data())).toList();
  // }

  // Future<List<CatModel>> allCats(String theme) async {
  //   final data =
  //       await _fb.collection(api.cat).doc(theme).collection(theme).get();
  //   return data.docs.map((e) => CatModel.fromJson(e.data())).toList();
  // }

  Future<List<HomeworkModel>> homework(String group, List<String> stu) async {
    List<HomeworkModel> hw = [];
    for (var s in stu) {
      final a =
          await _fb.collection(api.hw).doc(group).collection(s).doc(s).get();
      hw.add(HomeworkModel.fromJson(a.data()!));
    }
    return hw;
  }

  Future<List<HomeworkModel>> homeworks(GroupModel group) async {
    try {
      List<HomeworkModel> homeworks = [];
      for (var i in group.students) {
        final res = await _fb
            .collection(api.hw)
            .doc(group.id)
            .collection(i)
            .doc(i)
            .get();
        homeworks.add(HomeworkModel.fromJson(res.data()!));
      }
      return homeworks;
    } catch (e) {
      print("homeworks: $e\n\n\n\n\n\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<TeacherModel>> teachers() async {
    try {
      final data = await _fb.collection(api.apiTeachers).get();
      final result = data.docs
          .map(
            (e) => TeacherModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<ReceptionModel>> receptions() async {
    try {
      final data = await _fb.collection(api.apiReceptions).get();
      final result = data.docs
          .map(
            (e) => ReceptionModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<SupportModel>> supports() async {
    try {
      final data = await _fb.collection(api.apiSupports).get();
      final result = data.docs
          .map(
            (e) => SupportModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<GroupModel>> groups() async {
    try {
      final data = await _fb.collection(api.group).get();
      final result = data.docs
          .map(
            (e) => GroupModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("groups: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<BranchModel>> branches() async {
    try {
      final data = await _fb.collection(api.branch).get();
      final result = data.docs
          .map(
            (e) => BranchModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("groups: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<StudentModel>> students() async {
    try {
      final data = await _fb.collection(api.apiStudents).get();
      final result = data.docs
          .map(
            (e) => StudentModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("students: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<AttendanceModel>> attendance(GroupModel group, int index) async {
    final time = group.lessons[index];
    final data = await _fb
        .collection(api.table)
        .doc(group.id)
        .collection(
          "${time.year}${time.month}${time.day}",
        )
        .get();
    return data.docs
        .map(
          (e) => AttendanceModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

//************************************************
//************************************************
//************************************************
//specific
  Future<GroupModel> specialGroup(String id) async {
    print(id);
    final data = await _fb.collection(api.group).doc(id).get();
    return GroupModel.fromJson(data.data()!);
  }

  Future<TeacherModel> specialTeacher(String id) async {
    try {
      final data = await _fb.collection(api.apiTeachers).doc(id).get();
      return TeacherModel.fromJson(data.data()!);
    } catch (e) {
      return TeacherModel(
        tel: 'fake',
        surname: '',
        password: '',
        name: '',
        branch: '1',
        students: [],
        groups: [],
      );
    }
  }

  Future<ReceptionModel> specialReception(String id) async {
    final data = await _fb.collection(api.apiReceptions).doc(id).get();
    return ReceptionModel.fromJson(data.data()!);
  }

  Future<StudentModel> specialStudent(String id) async {
    final data = await _fb.collection(api.apiStudents).doc(id).get();
    return StudentModel.fromJson(data.data()!);
  }

  Future<BranchModel> specialBranch(String id) async {
    final data = await _fb.collection(api.branch).doc(id).get();
    return BranchModel.fromJson(data.data()!);
  }

  Future<List<GroupModel>> speGroup(String teacher) async {
    List<String> groupId = (await specialTeacher(teacher)).groups;
    List<GroupModel> groups = [];
    for (var id in groupId) {
      groups.add(await specialGroup(id));
    }
    return groups;
  }

//************************************************
//************************************************
//************************************************
  //update
  Future<void> addGroupTeacher(String group, String teacher) async {
    final t = await specialTeacher(teacher);
    t.groups.add(group);
    saveTeacher(t);
  }

  Future<void> addStudentGroup(String group, String student) async {
    final g = await specialGroup(group);
    g.students.add(student);
    await updateGroup(g);
  }

  Future<void> updateGroup(GroupModel group) async {
    await _fb.collection(api.group).doc(group.id).update(group.toJson());
  }

  Future<void> saveTeacher(TeacherModel teacher) async {
    await _fb
        .collection(api.apiTeachers)
        .doc(teacher.tel)
        .update(teacher.toJson());
  }

  Future<void> saveReception(ReceptionModel reception) async {
    await _fb
        .collection(api.apiReceptions)
        .doc(reception.tel)
        .update(reception.toJson());
  }
}
