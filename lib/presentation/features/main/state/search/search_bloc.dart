import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const Loading()) {
    on<Search>(
      onSearch,
      transformer: droppable(),
    );
  }

  void onSearch(Search event, Emitter<SearchState> emit) {}
}
