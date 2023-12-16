part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class Search extends SearchEvent {
  const Search();
}
