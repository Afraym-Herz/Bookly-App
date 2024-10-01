import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_row_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/row_actions_book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_list_view_books.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBarBookDetails(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.17),
              child: const CustomItem(),
            ),
            const SizedBox(
              height: 43,
            ),
            Text(
              "The Jungle Book",
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6,) ,
            Opacity(
              opacity: 0.7,
              child: Text("Rudyard Kibiling" , style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w500 ,
              ) , ),
            ) , 
          const CustomRowRating(mainAxisAlignment: MainAxisAlignment.center) , 
          const SizedBox(height: 37,) ,
          const RowActionsBook() , 
          const SizedBox(height: 16,) ,
          const Align( alignment: Alignment.centerLeft ,  child: Text("You can also like")) ,
          const SimilarListViewBooks() ,
          ],
        ),
      ),
    );
  }
}
