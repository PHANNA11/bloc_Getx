import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:state_management/src/getx_app/controller/counter_controller.dart';
import 'package:state_management/src/getx_app/view/getx_page2.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Test Getx'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => GetxPage2());
                },
                icon: const Icon(Icons.next_plan))
          ],
        ),
        body: Center(
          child: Text(
            controller.number.value.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.small(
              heroTag: 'de',
              onPressed: () {
                controller.decrement();
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton.small(
              heroTag: 'in',
              onPressed: () {
                controller.increment();
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      );
    });
  }
}
