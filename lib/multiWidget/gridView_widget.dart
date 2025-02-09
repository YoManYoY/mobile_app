import 'package:flutter/material.dart';
import 'package:my_mobile_app/singleWidget/container_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ContainerWidget();
      },
      //children: [
      // ContainerWidget(),
      // ContainerWidget(),
      // ContainerWidget(),
      // ContainerWidget(),
      // ContainerWidget(),
      // ContainerWidget(),
      //  ContainerWidget(),
      //],
    );
  }
}
