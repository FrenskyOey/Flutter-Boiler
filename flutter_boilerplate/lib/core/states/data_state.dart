sealed class DataState<T> {
  const DataState();
}

class Initial<T> extends DataState<T> {
  const Initial();
}

class Loading<T> extends DataState<T> {
  const Loading();
}

class Success<T> extends DataState<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends DataState<T> {
  final String message;

  const Error(this.message);
}
