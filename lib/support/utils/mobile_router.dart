import 'package:flutter/material.dart';
import 'package:formus/features/details/details_factory.dart';
import 'package:formus/features/home/home_factory.dart';
import 'package:formus/features/popular/popular_factory.dart';
import 'package:formus/features/search/search_factory.dart';
import 'package:formus/features/upcoming/upcoming_factory.dart';
import 'package:formus/models/movie.dart';

class MobileRoutes {
  static String initialRoutes = HomeFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeFactory.route: (_) {
      return HomeFactory.home();
    },
    UpcomingFactory.route: (_) {
      return UpcomingFactory.home();
    },
    PopularFactory.route: (_) {
      return PopularFactory.popular();
    },
    SearchFactory.route: (_) {
      return SearchFactory.search();
    },
    DetailsFactory.route: (context) {
      final movie = ModalRoute.of(context)?.settings.arguments as Movie;

      return DetailsFactory.details(movie);
    },
  };
}
