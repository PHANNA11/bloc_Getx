import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class GetxPage2 extends StatelessWidget {
  GetxPage2({super.key});

  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Test Getx page2'),
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
