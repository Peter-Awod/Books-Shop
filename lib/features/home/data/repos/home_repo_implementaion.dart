import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/services/api_service.dart';
import '../../../../core/utils/services/end_points.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    // TODO: implement fetchBestSellerBooks

    try {
      var data = await apiService.get(
        endPoint: kGetBooksEndPoint,
      );
      List<BookModel> books = [];
      data.forEach((key, item) {
        books.add(BookModel.fromJson(item));
      });
      // for (var item in data['items']){
      //   books.add(BookModel.fromJson(item));
      // }
      return right(books);
    } on Exception catch (error) {
      // TODO
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      }
      return left(
        ServerFailure(error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
