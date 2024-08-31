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
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async
  {


    try
    {
      var data = await apiService.get(
        endPoint: kGetBooksEndPoint,
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
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
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async
  {
    // TODO: implement fetchBestSellerBooks

    try {
      var data = await apiService.get(
        endPoint: kGetFeaturedBooksEndPoint,
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (error) {

      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      }
      return left(
        ServerFailure(error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(String category) async {


    try
    {
      var data = await apiService.get(
        endPoint: kGetSimilarBooksEndPoint,
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
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
}
