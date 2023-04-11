import 'package:flutter/material.dart';
import 'package:swipe_app/utils/constants.dart';

class OrderCardWidget extends StatelessWidget {
  final String product_name;
  final String farm_name;
  final int quantity;
  final String period;
  final String route;

  const OrderCardWidget(
      {required this.product_name,
      required this.farm_name,
      required this.quantity,
      required this.period,
      required this.route,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(top: 10),
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
              color: GlobalColors.primaryColor,
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
