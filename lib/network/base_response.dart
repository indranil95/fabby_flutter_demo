class BaseResponse<T> {
  final T? data;
  final int? statusCode;
  final String? error;

  BaseResponse({this.data, this.statusCode, this.error});
}
