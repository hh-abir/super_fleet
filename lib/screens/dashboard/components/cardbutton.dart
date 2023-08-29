import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  const CardButton({
    super.key,
    required this.imgUrl,
    required this.text,
    required this.func,
  });

  final String imgUrl;
  final String text;

  final Function func;

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        widget.func();
      },
      child: Container(
        height: size.height * 0.18,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: const Color(0xFFE3E0EF),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius of the shadow
              blurRadius: 7, // Blur radius of the shadow
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    widget.imgUrl,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 40,
                width: size.width * 0.4,
                decoration: const BoxDecoration(
                  color: Color(0xFF504099),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
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
