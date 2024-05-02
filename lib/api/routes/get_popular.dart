import 'package:formus/api/setup/api_provider.dart';
import 'package:formus/api/setup/endpoint.dart';
import 'package:formus/support/utils/constants.dart';

abstract class PopularRoutesProtocol {
  void getPopular({Success? success, Failure? failure});
}

class PopularRoutes extends PopularRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPopular({Success? success, Failure? failure}) {
    final queryParameters = {
      'api_key': Constants.apiKey,
      'region': 'US',
    };

    final endpoint = Endpoint(
      path: '/movie/popular',
      method: Method.get,
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
