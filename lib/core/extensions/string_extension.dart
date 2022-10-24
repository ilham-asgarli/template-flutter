extension StringLocalization on String {

}

extension ImagePathExtension on String {
  String get toSVG => 'assets/images/svg/$this.svg';
}

extension StringCasingExtension on String {
  String toFirstLetterCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toFirstLetterCapitalized()).join(' ');
}
