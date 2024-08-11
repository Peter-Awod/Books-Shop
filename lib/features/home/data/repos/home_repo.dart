
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,BookModel>> fetchFeaturedBooks();
  Future<Either<Failure,BookModel>> fetchBestSellerBooks();
}
