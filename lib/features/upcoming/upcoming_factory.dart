import 'package:flutter/material.dart';
import 'package:formus/api/routes/get_upcoming_routes.dart';
import 'package:formus/features/upcoming/upcoming/upcoming_view_controller.dart';
import 'package:formus/features/upcoming/upcoming/upcoming_view_model.dart';
import 'package:formus/features/upcoming/use_cases/upcoming_use_case.dart';

class UpcomingFactory {
  static String route = '/upcoming';

  static StatefulWidget home() {
    final routes = UpcomingRoutes();
    final useCase = UpcomingUseCase(routes: routes);
    final viewModel = UpcomingViewModel(useCase: useCase);

    return UpcomingViewController(
      viewModel: viewModel,
      key: GlobalObjectKey(viewModel),
    );
  }
}
