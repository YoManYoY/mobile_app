import 'package:flutter/material.dart';
import 'package:my_mobile_app/singleWidget/container_widget.dart';

class CloumnWidget extends StatelessWidget {
  const CloumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // ປັບຕາມລວງຕັ້ງ
        crossAxisAlignment: CrossAxisAlignment.start, // ປັບຕາມລວງນອນ
        children: [
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          Text("data"),
          ContainerWidget(),
          ContainerWidget(),
        ],
      ),
    );
  }
}
