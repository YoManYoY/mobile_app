import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leadingWidth: 200, //Leading ແມ່ນສ່ວນຢູ່ຊ້າຍສຸດຂອງ Appbar
        //ເພີ່ມຄວາມກ້ວາງໃຫ້ຍາວອອກໃນການຂຽນໜັງສື
        leading: Padding(
          // Padding ແມ່ນຫານຫຍັບອອກຈາກຂອບຈໍ
          padding:
              const EdgeInsets.symmetric(horizontal: 10), //ຫຍັບອອກມາຈາກຂອບຈໍ

          child: Center(
            child: Text(
              "Welcome to Rio store",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          // ພາກສ່ວນ1 ໃນ appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), //ຫຍັບຫ່າງຈາກຈໍ
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: //ການປັບຂອບ 4 ຫຼ່ຽມ ໃຫ້ເປັນວົງມົນ
                    BorderRadius.circular(40),
              ),
              child: Stack(
                // ໃຫ້ມີການແຈ້ງເຕືອນໃນວົງມົນ ຫຼື ມີວົງມົນນ້ອຍຊ້ອນ
                children: [
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "50",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/icons/userman.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ), // ເປັນການຍັບອອກຈາກຂອບຈໍຢ່າງດຽວ ໂດຍທີ່ ໂຕອື່ນບໍ່ຍັບ
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBody(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //MainAxisAlignment.spaceBetween ແມ່ນຍັບ ລະຫວ່າງ Text ໃຫ້ ຫ່າງອອກຈາກກັນໄປຢູ່ຄົນລະແຈ
                children: [
                  Text(
                    "Food Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("View All")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
