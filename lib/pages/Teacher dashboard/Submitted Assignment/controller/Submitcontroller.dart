// ignore_for_file: file_names

import 'package:get/get.dart';

enum SelectNumber { all, seen, unseen }

class SubmitController extends GetxController {
  SelectNumber number = SelectNumber.all;
  RxInt selectNumber = 3.obs;
  static SubmitController instance = Get.find();
}
