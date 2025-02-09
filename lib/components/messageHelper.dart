import 'package:flutter/material.dart';

class Messagehelper {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessager =
      GlobalKey<ScaffoldMessengerState>();
  static showMessageBar(bool isSucess, String message) {
    scaffoldMessager.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: isSucess == true ? Colors.green : Colors.red,
        // if (isSuccess == true){Colors.green}else{Colors.red}
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
