import 'package:flutter/material.dart';
import 'package:formus/features/popular/popular/popular_view_controller.dart';
import 'package:formus/features/popular/popular/popular_view_model.dart';

import '../../api/routes/get_popular.dart';
import 'use_cases/popular_use_case.dart';

class PopularFactory {
  static String route = '/popular';

  static StatefulWidget popular() {
    final routes = PopularRoutes();
    final useCase = PopularUseCase(routes: routes);
    final viewModel = PopularViewModel(useCase: useCase);

    return PopularViewController(viewModel: viewModel);
  }
}
