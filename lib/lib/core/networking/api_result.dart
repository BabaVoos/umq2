abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.error(String message) = Error<T>;
}

class Success<T> implements ApiResult<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements ApiResult<T> {
  final String message;

  Error(this.message);
}