import 'package:get/get.dart';
import 'package:state_management/src/dynamicUI/model/user_model.dart';

class ListUserController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> listFormAddUser = <UserModel>[UserModel()].obs;
}
