import 'package:flutter/material.dart';
import 'package:ova/card.dart';
import 'package:get/get.dart';
import 'package:ova/formdata/imagepiker/imagepiker1.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF2F2E4D), title: Text('status'.tr)),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF627192),
            Color(0xFF627192),
            Color(0xFF627192),
          ])),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, colors: [
                    Color(0xFF627192),
                    Color(0xFF627192),
                    Color(0xFF627192),
                  ])),
                  height: 400,
                  width: double.infinity,
                  child: Stepper(
                    physics: ScrollPhysics(),
                    type: StepperType.vertical,
                    currentStep: _currentStep,
                    onStepTapped: (int step) =>
                        setState(() => _currentStep = step),
                    onStepContinue: _currentStep < 3
                        ? () => setState(() => _currentStep += 1)
                        : null,
                    onStepCancel: _currentStep > 0
                        ? () => setState(() => _currentStep -= 1)
                        : null,
                    steps: [
                      Step(
                        title: Text(
                          'status1'.tr,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        content: Text(storage.read('Date2'),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('status3'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        content: const Text('',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('status4'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        content: const Text('',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('status5'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        content: const Text('',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Cardd(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
