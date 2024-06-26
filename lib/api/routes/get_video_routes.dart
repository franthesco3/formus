import 'package:formus/support/utils/constants.dart';

import '../setup/endpoint.dart';
import '../setup/api_provider.dart';

abstract class GetVideoRoutesProtocol {
  void getVideo({required int movieId, Success? success, Failure? failure});
}

class GetVideoRoutes extends GetVideoRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getVideo({required int movieId, Success? success, Failure? failure}) {
    final queryParameters = {'api_key': Constants.apiKey};

    final endpoint = Endpoint(
      method: Method.get,
      path: '/movie/$movieId/videos',
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
