import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.imageUrl});
  final String imageUrl ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
