class PaginationModel<T> {
  final bool more;
  final int page;
  final List<T> collection;

  const PaginationModel({
    required this.more,
    required this.page,
    required this.collection,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginationModel<T>(
      more: json['more'] as bool,
      page: json['page'] as int,
      collection: (json['collection'] as List<dynamic>)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(
    T Function(T) toJsonT,
  ) {
    return {
      'more': more,
      'page': page,
      'collection': collection.map((e) => toJsonT(e)).toList(),
    };
  }
}
