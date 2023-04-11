import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

class OrderCardWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String product_name;
  // ignore: non_constant_identifier_names
  final String farm_name;
  final int quantity;
  final String period;
  final String route;
  // ignore: non_constant_identifier_names
  final Color bg_color;

  const OrderCardWidget(
      // ignore: non_constant_identifier_names
      {required this.product_name,
      // ignore: non_constant_identifier_names
      required this.farm_name,
      required this.quantity,
      required this.period,
      required this.route,
      // ignore: non_constant_identifier_names
      required this.bg_color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: GlobalColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: GlobalColors.primaryColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage(
                  'assets/icons/tree.png',
                ),
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produit :',
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Ferme :',
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Quantité :',
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    'Période :',
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product_name,
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    farm_name,
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 15,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 40,
            decoration: BoxDecoration(
              color: bg_color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
              child: Text(
                "Annuler l'annonce d'achat",
                style: TextStyle(
                    fontSize: 15,
                    color: GlobalColors.whiteColor,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}