import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/src/dynamicUI/controller/list_controller.dart';
import 'package:state_management/src/dynamicUI/view/addList.dart';

class HomeList extends StatelessWidget {
  HomeList({super.key});
  ListUserController controller = Get.put(ListUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home List'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: ListTile(
                title: Text(controller.userList[index].name!),
                subtitle: Text(controller.userList[index].phoneNumber!),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddListScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
