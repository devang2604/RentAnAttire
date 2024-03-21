import 'package:loginpage/models/cloth_model.dart';
import 'package:flutter/material.dart';

class ClothCard extends StatelessWidget {
  final ClothModel cloth;

  const ClothCard(
    this.cloth, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 218, 218, 224),
            Color.fromARGB(255, 158, 156, 160),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cloth.clothimage,
                fit: BoxFit.contain,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          Text(
            cloth.name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Rs.${cloth.currentPrice}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Rs.${cloth.oldPrice}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black, decoration: TextDecoration.lineThrough,
                  decorationColor:
                      Colors.red, // Optional: Change strikethrough color
                  decorationThickness: 2.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
