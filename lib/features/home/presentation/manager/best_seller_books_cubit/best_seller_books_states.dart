import '../../../data/models/book_model/book_model.dart';

abstract class BestSellerBooksStates {}

class BestSellerBooksInitialState extends BestSellerBooksStates {}

class BestSellerBooksLoadingState extends BestSellerBooksStates {}

class BestSellerBooksSuccessState extends BestSellerBooksStates {
  final List<BookModel> books;

  BestSellerBooksSuccessState({required this.books});
}

class BestSellerBooksFailureState extends BestSellerBooksStates {
  final String errorMessage;

  BestSellerBooksFailureState({required this.errorMessage});
}
