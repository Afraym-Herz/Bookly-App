import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const CustomScrollView (
      slivers : [
        SliverFillRemaining(
          child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBarBookDetails(),
            BookDetailsSection() ,
            Expanded(
              child: SizedBox(
                height: 16,
              ),
            ),
           SimilarBooksListSection(),
          ],
        ),
      ),
    ) 
        )
      ]
    ) ;
  }
}
