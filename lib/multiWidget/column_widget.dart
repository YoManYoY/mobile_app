import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import "package:my_mobile_app/singleWidget/container_widget.dart";

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //Scrool view
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //ປັບແນວຕັ້ງ
        crossAxisAlignment: CrossAxisAlignment.start, //ປັບແນວນອນ
        children: [
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("Test"),
          ContainerWidget(),
          ContainerWidget(),
        ],
      ),
    );
  }
}
