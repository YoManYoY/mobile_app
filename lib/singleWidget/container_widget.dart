import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    var bold = FontWeight.bold;
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(10),
          //   topRight: Radius.circular(10),
          //   bottomLeft: Radius.circular(30),
          //   bottomRight: Radius.circular(30),
          // ),
          border: Border.all()),
      child: Center(
        child: Text(
          "Hello YoYo 76777789",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: bold),
        ),
      ),
    );
  }
}
