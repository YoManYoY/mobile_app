// ignore: unused_import
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:my_mobile_app/components/data.dart';
import 'package:my_mobile_app/view/home/widget/app_homeview.dart';
import 'package:my_mobile_app/view/home/widget/product_body.dart';
import 'package:my_mobile_app/view/home/widget/search_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300, //Shade ການປັບລະດັບສີໃຫ້ເຂັ້ມຈາງ
      appBar: AppBarHomeView(),

//-----------------------------***--------------------------------------------

      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBody(),
            //ເອີ້ນ Class ທີ່ສ້າງຂື້ນໃນ search_body.dart ມາໃຊ້ງານ
            ProductBody(), //ເອີ້ນ Class ທີ່ສ້າງຂື້ນໃນ Product_body.dart ມາໃຊ້ງານ
          ],
        ),
      ),
    );
  }
}
