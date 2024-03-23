enum LoginStatus {
  unauthenticated,
  authenticating,
  authenticated,
  failure,
}

enum Status {
  unknown,
  loading,
  success,
  failure,
}

enum SortCardItemType {
  date('Date'),
  like('Like'),
  share('Share'),
  comment('Comment');

  const SortCardItemType(this.label);
  final String label;
}
