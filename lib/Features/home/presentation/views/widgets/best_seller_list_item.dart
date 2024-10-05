import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/AppRouters.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_row_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({super.key, required this.bookModel});
  final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouters.kBookDetailsView) ;
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomItem(imageUrl: bookModel.volumeInfo.imageLinks.thumbnail),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title ?? '' ,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    bookModel.volumeInfo.authors?.first ?? '' ,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                       CustomRowRating(
                        rating :2560 ,
                        count: bookModel.volumeInfo.pageCount??0 ,) ,
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
