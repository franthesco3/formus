import 'package:flutter/material.dart';
import 'package:formus/api/routes/get_video_routes.dart';
import 'package:formus/features/details/details/details_view_controller.dart';
import 'package:formus/features/details/details/details_view_model.dart';
import 'package:formus/features/details/use_cases.dart/details_use_case.dart';

import '../../../models/movie.dart';

class DetailsFactory {
  static String route = '/details';

  static StatefulWidget details(Movie movie) {
    final routes = GetVideoRoutes();
    final useCase = GetVideoUseCase(routes: routes);
    final viewModel = DetailsViewModel(movie: movie, useCase: useCase);

    return DetailsViewController(viewModel: viewModel);
  }
}
