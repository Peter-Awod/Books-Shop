import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        print('Featured Cubit error state ${failure.errorMessage.toString()}');
        emit(
          FeaturedBooksFailureState(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        print('Featured Cubit Success state');
        emit(
          FeaturedBooksSuccessState(books: books),
        );
      },
    );
  }
}
