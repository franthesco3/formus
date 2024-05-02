import '../../../api/routes/get_popular.dart';
import '../../../models/movie.dart';

typedef Failure = void Function(String error);
typedef Success = void Function(List<Movie> movies);

abstract class PopularUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class PopularUseCase extends PopularUseCaseProtocol {
  final PopularRoutesProtocol routes;

  PopularUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getPopular(
      success: (result) {
        try {
          final movies = List<Movie>.from(
              result['results'].map((movie) => Movie.fromMap(movie)));
          success?.call(movies);
        } on Error catch (error) {
          failure?.call(error.stackTrace.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
