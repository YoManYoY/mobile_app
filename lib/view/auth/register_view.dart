import 'package:flutter/material.dart';
import 'package:my_mobile_app/components/loading.dart';
import 'package:my_mobile_app/components/messageHelper.dart';
import 'package:my_mobile_app/view/auth/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final username = TextEditingController();
  final email = TextEditingController(); //ປະກາດຕົວປ່ຽນ ເພື່ອຮັບຄ່າ
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final phone = TextEditingController();
  final birthday = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool eye = true; //ເປີດຕາ

  // ຟັງຊັນສຳລັບເລືອກວັນທີ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthday.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //ສ້າງຕົວປ່ຽນ Size ເພື່ອປັບຂະໜາດ
    return Scaffold(
      //ຕ້ອງມີທຸກໆຄັ້ງໃນການຂຽນໂຄ້ດ
      bottomNavigationBar: Container(
        //ຄຳສັ່ງກົດປຸ່ມໃນສ່ວນຕີນ
        height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            TextButton(
              onPressed: () {
                // ນຳທາງໄປຫາ RegisterView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )
          ], //ສ່ວນຕີນ
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          // ສ່ວນເນື້ອໃນ
          children: [
            Container(
              height: size.height,
              width: double.infinity, //ປັບໃຫ້ຄວາມກ້ວາງ ເວລາເຮົາຫຍໍ້ຂະຫຍາຍຈໍ
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 30,
              left: 50,
              right: 50,
              child: Center(
                child: Text(
                  "Create a new account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              child: SingleChildScrollView(
                // ບໍ່ໃຫ້ແຕກ 404 ເວລາ ຫຍ້ຂະຫຍາຍຈໍ
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Form(
                    key: formkey, // ເອີ້ນໃຊ້ຕົວປ່ຽນ
                    child: SingleChildScrollView(
                      // ບໍ່ໃຫ້ແຕກ 404 ເວລາ ຫຍ້ຂະຫຍາຍຈໍ
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //ການປັບໃຫ້ການພິມຢູ່ຊ້າຍມືຈຸດເລີ່ມຕົ້ນ
                        children: [
                          Padding(
                            //ສ່ວນຂອງ Username
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Username",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              controller:
                                  username, //ການຄວບຄຸມ ກັນຮັບຄ່າໃນ username
                              validator: (value) {
                                //ຟັງຊັນ retrun ເພື່ອເອົາໄວ້ກວດສອບ
                                if (value!.isEmpty) {
                                  return " Username ຫ້າມວ່າງ!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.person_pin,
                                  color: Colors.grey,
                                ),
                                hintText: "username",
                              ),
                            ),
                          ),
                          Padding(
                            //ສ່ວນຂອງ Email
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              controller: email, //ການຄວບຄຸມ ກັນຮັບຄ່າໃນ email
                              validator: (value) {
                                //ຟັງຊັນ retrun ເພື່ອເອົາໄວ້ກວດສອບ
                                if (value!.isEmpty) {
                                  //ກວດສອບວ່າຊ່ອງຂໍ້ມູນບໍ່ວ່າງ.
                                  return "Email ຫ້າມວ່າງ!";
                                } else if (!value.contains("@gmail.com")) {
                                  return "ຕ້ອງມີ @gmail.com";
                                } else if (!RegExp(
                                        r'^[a-zA-Z0-9._-]+@gmail\.com$')
                                    .hasMatch(value)) {
                                  return "ອີເມວຕ້ອງໃຊ້ຕົວໜັງສື (a-z, A-Z), ຕົວເລກ (0-9), ແລະສັນຍາລັກ . _ - ເທົ່ານັ້ນ. ຫ້າມຍະວ່າງ";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.alternate_email,
                                  color: Colors.grey,
                                ),
                                hintText: "example@gmail.com",
                              ),
                            ),
                          ),
                          Padding(
                            //ສ່ວນຂອງ password
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              obscureText: eye,
                              controller: password, //ການຄວບຄຸມ ຮັບຄ່າpassword
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password ຫ້າມວ່າງ!";
                                } else if (value.length <= 7) {
                                  return " ລະຫັດຜ່ານຕ້ອງມີ 8 ຕົວຂື້ນໄປ";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ), //ຂອບ Label ໃຫ້ມົນ
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    //ການເປີດຕາ ໃນການປ້ອນລະຫັດ
                                    setState(() {
                                      //ການກວດເຊັກລະຫັດໃນແບບ realtime
                                      eye = !eye; // eye = true = flase
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                hintText: "********",
                              ),
                            ),
                          ),
                          Padding(
                            //ສ່ວນຂອງ Confirm Password
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              obscureText:
                                  eye, // ໃຊ້ຕົວແປ eye ເພື່ອສະຫຼັບການເບິ່ງລະຫັດ
                              controller:
                                  confirmPassword, // ການຄວບຄຸມ ຮັບຄ່າ Confirm Password
                              validator: (value) {
                                //ກວດສອບວ່າຊ່ອງປ້ອນຂໍ້ມູນບໍ່ວ່າງ ແລະ ລະຫັດຜ່ານຕ້ອງຕົງກັບ Password ທີ່ປ້ອນໄວ້ກ່ອນ.
                                if (value!.isEmpty) {
                                  return "Confirm Password ຫ້າມວ່າງ!";
                                } else if (value != password.text) {
                                  return "ລະຫັດຜ່ານບໍ່ຕົງກັນ";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                //ຈັດຮູບແບບຂອງຊ່ອງປ້ອນຂໍ້ມູນ, ລວມທັງສັນຍາລັກ ແລະ ປຸ່ມເປີດຕາ.
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ), // ຂອບ Label ໃຫ້ມົນ
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    // ການເປີດຕາ ໃນການປ້ອນລະຫັດ
                                    setState(() {
                                      // ການກວດເຊັກລະຫັດໃນແບບ realtime
                                      eye = !eye; // eye = true = false
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                hintText: "********",
                              ),
                            ),
                          ),
                          Padding(
                            //ສ່ວນຂອງ Mobile phone
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Mobile Phone",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              controller: phone, // ການຄວບຄຸມການຮັບຄ່າໃນ phone
                              validator: (value) {
                                // ຟັງຊັນ return ເພື່ອເອົາໄວ້ກວດສອບ
                                if (value!.isEmpty) {
                                  return "Mobile Phone ຫ້າມວ່າງ!";
                                } else if (!RegExp(r'^[0-9]+$')
                                    .hasMatch(value)) {
                                  return "ຕ້ອງໃສ່ຂໍ້ມູນເປັນຕົວເລກເທົ່ານັ້ນ ແລະ ຫ້າມຍະວ່າງ";
                                } else if (value.startsWith('020')) {
                                  if (value.length != 11) {
                                    return "ຖ້າເລີ່ມຕົ້ນດ້ວຍ 020, ຕ້ອງມີ 11 ຕົວເລກ (ລວມ 020)";
                                  } else if (value.substring(3).length != 8) {
                                    return "ຖ້າເລີ່ມຕົ້ນດ້ວຍ 020, ຕ້ອງໃສ່ຕົວເລກຕໍ່ເນື່ອງ 8 ຕົວ (ບໍ່ນັບ 020)";
                                  }
                                } else if (value.startsWith('030')) {
                                  if (value.length != 10) {
                                    return "ຖ້າເລີ່ມຕົ້ນດ້ວຍ 030, ຕ້ອງມີ 10 ຕົວເລກ (ລວມ 030)";
                                  } else if (value.substring(3).length != 7) {
                                    return "ຖ້າເລີ່ມຕົ້ນດ້ວຍ 030, ຕ້ອງໃສ່ຕົວເລກຕໍ່ເນື່ອງ 7 ຕົວ (ບໍ່ນັບ 030)";
                                  }
                                } else {
                                  return "ເລກໂທລະສັບຕ້ອງເລີ່ມຕົ້ນດ້ວຍ 020 ຫຼື 030";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(),
                                focusedErrorBorder: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: Colors.grey,
                                ),
                                hintText: "(ເບີໂທ 02012345678 ຫຼື 0301234567)",
                              ),
                            ),
                          ),
                          // ຊ່ອງປ້ອນຂໍ້ມູນວັນເດືອນປີເກີດ
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: TextFormField(
                              controller: birthday,
                              readOnly:
                                  true, // ບໍ່ອະນຸຍາດໃຫ້ປ້ອນຂໍ້ມູນດ້ວຍຕົນເອງ
                              onTap: () =>
                                  _selectDate(context), // ເປີດ Date Picker
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                ),
                                hintText: "DD/MM/YYYY",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Date of Birth ຫ້າມວ່າງ!";
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            //ສ່ວນຂອງ Sign Up
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                          ),
                          Center(
                            //ສ່ວນຂອງປຸ່ມກົດ Sign Up
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    print("====>Register success");
                                    LoadingHepler.Loading(context);
                                    Messagehelper.showMessageBar(
                                        true, "Register Success");
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width / 1.2,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
