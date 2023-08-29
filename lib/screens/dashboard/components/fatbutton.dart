import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {
  const FatButton({
    super.key,
    required this.text,
    required this.ico,
    required this.func,
  });
  final String text;
  final String ico;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.070,
        width: MediaQuery.of(context).size.width * 0.8 / 3,
        decoration: BoxDecoration(
          color: const Color(0xFF504099),
          borderRadius: const BorderRadius.all(Radius.circular(34)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius of the shadow
              blurRadius: 7, // Blur radius of the shadow
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Image.asset(
              ico,
              height: 25,
              width: 25,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
