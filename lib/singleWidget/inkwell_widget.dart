import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget {
  const InkwellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("okkk");
      },
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
