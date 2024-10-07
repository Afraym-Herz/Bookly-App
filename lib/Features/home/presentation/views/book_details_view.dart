import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel ;
  @override
  Widget build(BuildContext context) {
    return  BookDetailsViewBody(bookModel: bookModel,);
  }
}
