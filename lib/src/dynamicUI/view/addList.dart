import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:state_management/src/dynamicUI/controller/list_controller.dart';
import 'package:state_management/src/dynamicUI/model/user_model.dart';

class AddListScreen extends StatelessWidget {
  AddListScreen({super.key});
  ListUserController controller = Get.put(ListUserController());
  int length = 3;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListUserController>(
        init: controller,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: const Text('Add User'),
            ),
            body: ListView.builder(
              itemCount: controller.listFormAddUser.length,
              itemBuilder: (context, index) {
                return buildFormAdd(
                    isAdd: controller.listFormAddUser.length == 1
                        ? true
                        : controller.listFormAddUser.length > 1 &&
                            index == controller.listFormAddUser.length - 1,
                    index: index);
              },
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  controller.userList.addAll(controller.listFormAddUser);
                  controller.listFormAddUser = <UserModel>[UserModel()].obs;
                  controller.update();
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Add User',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildFormAdd(
      {TextEditingController? idController,
      TextEditingController? nameController,
      TextEditingController? phoneController,
      bool isAdd = true,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        onChanged: (value) {
                          controller.listFormAddUser[index].id =
                              int.parse(value);
                        },
                        controller: idController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'ID'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        onChanged: (value) {
                          controller.listFormAddUser[index].name = value;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        onChanged: (value) {
                          controller.listFormAddUser[index].phoneNumber = value;
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Phone'),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                mini: true,
                elevation: 0,
                backgroundColor: isAdd ? Colors.blueAccent : Colors.redAccent,
                onPressed: () {
                  if (isAdd) {
                    controller.listFormAddUser.add(UserModel());
                  } else {
                    controller.listFormAddUser.removeAt(index);
                  }
                  controller.update();
                },
                child: Icon(
                  isAdd ? Icons.add : Icons.remove,
                  size: 28,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
