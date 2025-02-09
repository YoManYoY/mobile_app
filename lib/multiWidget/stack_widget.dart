import 'package:flutter/material.dart';
import 'package:my_mobile_app/singleWidget/container_widget.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: ContainerWidget(),
        ),
        Positioned(
          bottom: 200,
          child: ContainerWidget(),
        ),
      ],
    );
  }
}
