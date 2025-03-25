class Fail<T> {
  final String message;
  final T? data;

  const Fail({this.message = "", this.data});
}
