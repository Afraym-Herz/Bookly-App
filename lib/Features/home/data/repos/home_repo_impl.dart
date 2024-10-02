import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  
  final ApiService apiService ;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science') ;

      List<BookModel> books =[] ;
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book)); 
      }
    return right(books) ;
    } catch (e) {
      return left(ServerFailure()) ;
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming') ;

      List<BookModel> books =[] ;
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book)); 
      }
    return right(books) ;
    } catch (e) {
      return left(ServerFailure()) ;
    }
  }
}