import 'package:bookly_app/features/home/presentation/views/widgets/custom_item.dart';
import 'package:flutter/material.dart';

class SimilarListViewBooks extends StatelessWidget {
  const SimilarListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomItem(
              imageUrl: 'https://booksandyou.in/cdn/shop/files/HarryPotterBoxSetCursedChild_beb3a56c-0d20-4c82-9267-69c684b534e6.jpg?v=1696398244&width=1445',
            ),
          );
        },
      ),
    );
    ;
  }
}
