import 'package:flutter/material.dart';
import 'package:my_mobile_app/components/loading.dart';
import 'package:my_mobile_app/components/messageHelper.dart';
import 'package:my_mobile_app/view/auth/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final email = TextEditingController(); //ປະກາດຕົວປ່ຽນ ເພື່ອໄວ້ຮັບຄ່າ
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool eye = true; //ເປີດຕາ

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        //ສ່ວນຕີນ
        height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account"),
            TextButton(
              onPressed: () {
                // ນຳທາງໄປຫາ RegisterView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ], //ສ່ວນຕີນ
        ),
      ),
      body: Stack(
        // ສ່ວນເນື້ອໃນ
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 30,
            left: 50,
            right: 50,
            child: Center(
              child: Text(
                "Login to your account",
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
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
                          //ສ່ວນຂອງ Email
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
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
                                return " Email ຫ້າມວ່າງ!";
                              } else if (!value.contains("@gmail.com")) {
                                //ຄ່າ ==
                                return "@gmail.com ຫ້າມວ່າງ!";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(),
                              focusedErrorBorder: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              hintText: "example@gmail.com",
                            ),
                          ),
                        ),
                        Padding(
                          //ສ່ວນຂອງ passwor
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
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
                              } else if (value.length < 8) {
                                return " ລະຫັດຜ່ານຕ້ອງມີຫຼາຍກ່ອນ 7 ຕົວ";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(),
                              focusedErrorBorder: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.security,
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
                          //ສ່ວນຂອງ forgot password
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Spacer(), // ການຍັບແຖວໃຫ້ມາຢູ່ເບື້ງຂວາມືສຸດ
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "forgot password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          //ສ່ວນຂອງປຸ່ມກົດ Sing in
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  print("====>Success");
                                  LoadingHepler.Loading(context);
                                  Messagehelper.showMessageBar(true, "Success");
                                }
                              },
                              child: Container(
                                height: 50,
                                width: size.width / 1.2,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Log in",
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
    );
  }
}
