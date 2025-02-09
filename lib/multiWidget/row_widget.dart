import 'package:flutter/material.dart';
import 'package:my_mobile_app/singleWidget/container_widget.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ContainerWidget(),
        Text("data"),
        ContainerWidget(),
        ContainerWidget(),
      ],
    );
  }
}
