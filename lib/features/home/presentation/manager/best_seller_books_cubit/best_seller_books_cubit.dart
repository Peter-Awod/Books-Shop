import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'best_seller_books_states.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksStates> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitialState());
  final HomeRepo homeRepo;

  Future<void> getBestSellerBooks() async {
    emit(BestSellerBooksLoadingState());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => {
        emit(BestSellerBooksFailureState(errorMessage: failure.errorMessage)),
      },
      (books) => {
        emit(BestSellerBooksSuccessState(books: books)),
      },
    );
  }
}
