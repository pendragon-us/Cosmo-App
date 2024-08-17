import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {

  final String image;

  const SocialMediaIcon({
    super.key,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 50,
          child: Image.asset(image),
      ),
    );
  }
}
