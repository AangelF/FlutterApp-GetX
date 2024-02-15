import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/counter_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterWidget(),
              SizedBox(height: 20),
              ButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<CounterController>(
        init: CounterController(),
        builder: (_) => Text(_.count.toString()),
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  final CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => controller.increment(),
          child: Text('+'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => controller.decrement(),
          child: Text('-'),
        ),
      ],
    );
  }
}
