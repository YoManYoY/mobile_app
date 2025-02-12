import 'package:flutter/material.dart';
import 'package:my_mobile_app/components/data.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // return Column ເພາະມີ String or Text
      children: [
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
              Text("View All"),
            ],
          ),
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //ໃຫ້ມັນເປັນ 2ຖັນ)
                childAspectRatio: 0.6 //ຄວາມຍາວຂອງ Box
                ),
            shrinkWrap: true, // Scrool view
            primary: false, //Scrool view
            itemCount: product
                .length, // ຈຳນວນ card ທີ່ເອີ້ນ product ທັງໝົດທີ່ມີຢູ່ໃນ components data.cart ມາໃສ
            itemBuilder: (context, index) {
              return Card(
                // widget 1 ທີ່ເປັນ card
                elevation:
                    3, //elevation ຈະກຳນົດວ່າຮົ່ມຈະເລິກຫຼືຕື້ນ, ໂດຍຄ່າທີ່ສູງກວ່າຈະເຮັດໃຫ້ຮົ່ມເລິກຂຶ້ນ ແລະ ເຮັດໃຫ້ Card ດູດສະແດງວ່າຢູ່ເທິງສູງຈາກພື້ນຫຼັງ. ມີຄ່າ 1 ຫາ 12
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product[index]['image']
                          .toString(), //ເອົາຮູບມາໃສໂດຍເອີ້ນ product ຢູ່ໃນ components data.cart
                      //"assets/images/beerlao.jpg",
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 5),
                      child: Text(
                        product[index]['name'].toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        product[index]['detail'].toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product[index]['price']}ກີບ",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
