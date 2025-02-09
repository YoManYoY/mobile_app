import 'package:flutter/material.dart';
import 'package:my_mobile_app/components/messageHelper.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:my_mobile_app/multiWidget/Listview_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/multiWidget/column_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/multiWidget/gridView_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/multiWidget/row_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/multiWidget/stack_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/singleWidget/container_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/singleWidget/inkwell_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/singleWidget/textButton_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/singleWidget/textFormField_widget.dart';
// ignore: unused_import
import 'package:my_mobile_app/view/auth/login_view.dart';
// ignore: unused_import
import 'package:my_mobile_app/view/auth/registerForm_view.dart';
// ignore: unused_import
import 'package:my_mobile_app/view/auth/register_view.dart';

void main() {
  runApp(MyApp()); // flutter ຈະຕ້ອງເວລາຕັ້ງ class
}

class MyApp extends StatelessWidget {
// state less ແມ່ນ widget ໃຊ້ໄວ້ໃນການສ້າງ class ໂດຍ ບໍ່ມີການປ່ຽນແປງຄ່າບ່ອຍ
//ຫຼື ບໍ່ມີການ render (setState) ຂໍ້ມູນ
//extends ແມ່ນການສືບທອດ class
  const MyApp(
      {super.key}); // Constant ເປັນສ່ວນທີ່ໃຊ້ພາຍໃນ ຫຼື ຄ່າຄົງທີ່ໃນ Class ນີ້

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Messagehelper.scaffoldMessager, //ຂໍ້ຄວາມແຈ້ງເຕືອນ
      home: RegisterView(),
      //home: Scaffold(
      // ສ່ວນຫົວ
      // appBar: AppBar(),
      //  body: TextFormFieldWidget(),
      //  bottomNavigationBar: Container(height: 100, color: Colors.green),
      // floatingActionButton: Container(height: 100, color: Colors.yellow),
      // ),
    );
  }
}
