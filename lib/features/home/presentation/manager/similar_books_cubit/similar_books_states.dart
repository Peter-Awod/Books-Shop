import '../../../data/models/book_model/book_model.dart';

class SimilarBooksStates {}

class SimilarBooksInitialState extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksSuccessState extends SimilarBooksStates {
  final List<BookModel> books;

  SimilarBooksSuccessState({required this.books});
}

class SimilarBooksFailureState extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksFailureState({required this.errorMessage});
}
