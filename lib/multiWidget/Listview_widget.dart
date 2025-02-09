import 'package:flutter/material.dart';
import 'package:my_mobile_app/singleWidget/container_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ContainerWidget();
      },
      scrollDirection: Axis.horizontal,
      //  children: [
      //   ContainerWidget(),
      //    ContainerWidget(),
      //   ContainerWidget(),
      //   ContainerWidget(),
      //  ContainerWidget(),
      //   ContainerWidget(),
      // ],
    );
  }
}
