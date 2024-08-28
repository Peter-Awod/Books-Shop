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
      (failure) {
        print('Best Seller Cubit error state ${failure.errorMessage.toString()}');

        emit(
          BestSellerBooksFailureState(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        print('Best Seller Cubit Success state');
        emit(
          BestSellerBooksSuccessState(books: books),
        );
      },
    );
  }
}
