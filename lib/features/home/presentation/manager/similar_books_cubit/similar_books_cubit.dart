import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'similar_books_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category);
    print('Simailar category=== ${category}');

    result.fold(
      (failure) {
        print('Similar Cubit error state ${failure.errorMessage.toString()}');
        emit(
          SimilarBooksFailureState(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        print('Similar Cubit Success state');
        emit(
          SimilarBooksSuccessState(books: books),
        );
      },
    );
  }
}
