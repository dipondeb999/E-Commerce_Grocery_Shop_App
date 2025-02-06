import 'package:flutter/material.dart';

class OtherLoginPlatformWidget extends StatelessWidget {
  final String image;

  const OtherLoginPlatformWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Image.asset(
        image,
        height: 25,
        width: 25,
      ),
    );
  }
}
