import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

_UseQuery<T> useQuery<T>(UseQueryOptions<T> options) {
  final queryState = useState(_State<T>(isLoading: false));

  // Processed states

  final isLoading = queryState.value.isLoading;
  final response = queryState.value.response;
  final data = response?.data;

  // Internal methods
  launchQuery() async {
    try {
      queryState.value = queryState.value.withLoading();
      final res = await options.queryFn();
      queryState.value = queryState.value.withResponse(res);
    } catch (e) {
      queryState.value = queryState.value.withError(e);
    }
  }

  useEffect(() {
    // Launch query on hook declaration
    launchQuery();
    return () {
      queryState.dispose();
    };
  }, []);

  return _UseQuery<T>(response: response, data: data, isLoading: isLoading);
}

class _UseQuery<T> {
  final Response<T>? response;
  final T? data;

  // Request states
  final bool isLoading;

  _UseQuery(
      {required this.response, required this.data, required this.isLoading});
}

class _State<T> {
  final Response<T>? response;
  final bool isLoading;
  final dynamic error;

  _State({this.error, required this.isLoading, this.response});

  _State<T> withLoading({bool loading = true}) {
    return _State<T>(error: error, isLoading: loading, response: response);
  }

  _State<T> withResponse(Response<T> res) {
    return _State<T>(error: error, isLoading: false, response: res);
  }

  _State<T> withError(dynamic error) {
    return _State<T>(error: error, isLoading: false, response: null);
  }
}

class UseQueryOptions<T> {
  final Future<Response<T>> Function() queryFn;

  UseQueryOptions({required this.queryFn});
}
