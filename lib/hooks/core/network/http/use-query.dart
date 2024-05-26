import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

_UseQuery useQuery<T>(UseQueryOptions<T> options) {
  final responseState = useState<Response<T>?>(null);
  final errorState = useState<dynamic>(null);

  final isLoadingState = useState<bool>(false);

  // Processed states

  final isLoading = isLoadingState.value;
  final response = responseState.value;
  final data = response?.data;

  // Internal methods
  launchQuery() async {
    print("Init query");
    try {
      isLoadingState.value = true;
      final res = await options.queryFn();
      responseState.value = res;
    } catch (e) {
      print(e);
      errorState.value = e;
      responseState.value = null;
      isLoadingState.value = false; // Updates state before refreshing
    }
  }

  useEffect(() {
    // Launch query on hook declaration
    launchQuery();
    return null;
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

class UseQueryOptions<T> {
  final Future<Response<T>> Function() queryFn;

  UseQueryOptions({required this.queryFn});
}
