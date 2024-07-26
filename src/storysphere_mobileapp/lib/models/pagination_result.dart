class PaginationResult<T> {
  final List<T> result;
  final int currentPage;
  final int totalPages;

  PaginationResult({
    required this.result,
    required this.currentPage,
    required this.totalPages,
  });
}