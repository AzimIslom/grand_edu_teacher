import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_teacher/pages/home/imports.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../login/constants.dart';
import '../../../../models/group_model.dart';
import '../../../../models/student_model.dart';
import '../../../../models/teacher_model.dart';
import '../../../../services/fb_service.dart';
import '../../../../utils/lan.dart';
import '../../../../utils/titles.dart';
import '../../../../utils/utils.dart';
import '../../../student/imports.dart';
import '../../../student/inner/detail/imports.dart';
import '../homeworks/imports.dart';
import '../table/imports.dart';

part 'items.dart';
part 'page.dart';
part 'vm.dart';