part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class NotSearch extends SearchState {
  const NotSearch();
}

class Loading extends SearchState {
  const Loading();
}

class Success extends SearchState {
  const Success();
}

class Fail extends SearchState {
  const Fail();
}
