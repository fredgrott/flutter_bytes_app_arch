// ignore_for_file: avoid_unnecessary_containers

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: const Text("Generate error"),
        onPressed: () => generateError(),
      ),
    );
  }

  Future<void> generateError() async {
    Catcher.sendTestException();
  }
}
