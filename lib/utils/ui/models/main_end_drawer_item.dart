import 'choosing_end_drawer_item.dart';

class MainEndDrawerItem {
  String title;
  List<ChoosingEndDrawerItem>? choosingEndDrawerItems;
  int? selectedChoosingEndDrawerItemIndex;

  MainEndDrawerItem(
    this.title, {
    this.choosingEndDrawerItems = const [],
    this.selectedChoosingEndDrawerItemIndex,
  }) {
    choosingEndDrawerItems ??= [];
  }
}
