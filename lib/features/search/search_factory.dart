import 'package:flutter/material.dart';
import 'package:formus/api/routes/search_routes.dart';
import 'package:formus/features/search/search/search_view_controller.dart';
import 'package:formus/features/search/search/search_view_model.dart';
import 'package:formus/features/search/use_cases.dart/search_use_case.dart';

class SearchFactory {
  static String route = '/search';

  static StatefulWidget search() {
    final routes = SearchRoutes();
    final useCase = SearchUseCase(routes: routes);
    final viewModel = SearchViewModel(useCase: useCase);

    return SearchViewController(viewModel: viewModel);
  }
}
