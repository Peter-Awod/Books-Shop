import '../../../../home/data/models/book_model/book_model.dart';

class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<BookModel> books;

  SearchSuccessState({required this.books});
}

class SearchFailureState extends SearchStates {
  final String errorMessage;

  SearchFailureState({required this.errorMessage});
}
