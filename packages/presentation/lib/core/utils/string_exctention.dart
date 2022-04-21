extension StringEmpty on String? {
  String get orEmpty => this ?? '';
}
