import 'package:formus/api/setup/api_provider.dart';
import 'package:formus/api/setup/endpoint.dart';
import 'package:formus/support/utils/constants.dart';

abstract class UpcomingRoutesProtocol {
  void getUpcoming({required String page, Success? success, Failure? failure});
}

class UpcomingRoutes extends UpcomingRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getUpcoming({required String page, Success? success, Failure? failure}) {
    final queryParameters = {
      'page': page,
      'region': 'US',
      'api_key': Constants.apiKey,
    };

    final endpoint = Endpoint(
      path: '/movie/upcoming',
      method: Method.get,
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
