import 'package:bloc/bloc.dart';

import '../../../data/repos/search_repo.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  final SearchRepo searchRepo;

  Future<void> getSearch({required String searchString}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchSearch(searchString);
    result.fold(
      (failure) {
        print('Search Cubit error state ${failure.errorMessage.toString()}');
        emit(
          SearchFailureState(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        print('Search Cubit Success state');
        emit(
          SearchSuccessState(books: books),
        );
      },
    );
  }
}
