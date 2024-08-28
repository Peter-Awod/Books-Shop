



import '../../../data/models/book_model/book_model.dart';

class FeaturedBooksStates {}

class FeaturedBooksInitialState extends FeaturedBooksStates {}

class FeaturedBooksLoadingState extends FeaturedBooksStates {}

class FeaturedBooksSuccessState extends FeaturedBooksStates {
  final List<BookModel> books;

  FeaturedBooksSuccessState({required this.books});
}

class FeaturedBooksFailureState extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailureState({required this.errorMessage});
}
