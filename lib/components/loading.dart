import 'package:flutter/material.dart';

class LoadingHepler {
  //ຟັງຊັນການໂຫຼດ
  static Loading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent, // ການໂຫຼດໃຫ້ມັນໂປ່ງໃສ
            content: SizedBox(
              height: 50,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
