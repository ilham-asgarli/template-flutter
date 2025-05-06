class DetailedPaginationModel<T> {
  final bool more;
  final int page;
  final int pageSize;
  final int total;
  final List<T> collection;

  const DetailedPaginationModel({
    required this.more,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.collection,
  });

  factory DetailedPaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return DetailedPaginationModel<T>(
      more: json['more'] as bool,
      page: json['page'] as int,
      pageSize: json['page_size'] as int,
      total: json['total'] as int,
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
      'page_size': pageSize,
      'total': total,
      'collection': collection.map((e) => toJsonT(e)).toList(),
    };
  }
}
