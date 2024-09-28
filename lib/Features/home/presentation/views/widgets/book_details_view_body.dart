import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBarBookDetails() ,
          ],
        ),
      ),
    );
  }
}