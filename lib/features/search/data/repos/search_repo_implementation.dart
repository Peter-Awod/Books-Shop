import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/services/api_service.dart';
import '../../../../core/utils/services/end_points.dart';
import '../../../home/data/models/book_model/book_model.dart';
import 'search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearch(
      String searchString) async {
    try {
      var data = await apiService.get(
        endPoint: kSearchEndPoint,
        searchString: searchString,
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
}
