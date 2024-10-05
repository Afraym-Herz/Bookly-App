import 'package:bookly_app/Features/home/presentation/views/widgets/custom_item.dart';
import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/error_text.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_book_cubit.dart/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureListViewItem extends StatelessWidget {
  const FeatureListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess){
          return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length ,
            itemBuilder: (context, index) {
              return   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomItem(
                 imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail ,
                ),
              );
            },
          ),
        );
        } else if (state is FeaturedBookFailure){
          return const ErrorText(errMessage: "There was an error") ;
        }
        else {
          return const CustomCircularIndicator() ;
        }
      },
    );
  }
}
