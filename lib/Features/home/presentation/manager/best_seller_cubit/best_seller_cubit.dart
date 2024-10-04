import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerBooksState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());

    var result = await homeRepo.fetchBestSellerBooks();

    result.fold((failure) {
      emit(BestSellerBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(BestSellerBooksSuccess(books: books));
    });
  }

}
