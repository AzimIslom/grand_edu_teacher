import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_teacher/models/group_model.dart';
import 'package:grand_edu_teacher/models/student_model.dart';
import 'package:grand_edu_teacher/models/teacher_model.dart';
import 'package:grand_edu_teacher/pages/student/inner/payments/imports.dart';
import 'package:grand_edu_teacher/pages/student/inner/table/imports.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../login/constants.dart';
import '../../../../services/fb_service.dart';
import '../../../../utils/lan.dart';
import '../../../../utils/titles.dart';
import '../../../../utils/utils.dart';
import 'chart.dart';
part 'items.dart';
part 'page.dart';
part 'vm.dart';