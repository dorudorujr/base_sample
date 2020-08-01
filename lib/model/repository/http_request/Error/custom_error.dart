class CustomError implements Exception {
  CustomError(this.message);

  final String message;

  @override
  String toString() => message;
}