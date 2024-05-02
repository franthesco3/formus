import 'package:formus/features/upcoming/upcoming/upcoming_view_controller.dart';
import 'package:formus/features/upcoming/use_cases/upcoming_use_case.dart';
import 'package:formus/support/utils/constants.dart';

import '../../../models/movie.dart';

class UpcomingViewModel extends UpcomingProtocol {
  int page = 1;
  bool _hasError = false;
  bool _isLoading = false;
  List<Movie> _movies = [];
  final UpcomingUseCase useCase;

  UpcomingViewModel({required this.useCase});

  @override
  bool get hasError => _hasError;

  @override
  int get length => _movies.length;

  @override
  bool get isLoading => _isLoading;

  @override
  String image(int index) {
    return Constants.urlImagePath + _movies[index].imagePath;
  }

  @override
  String title(int index) {
    return _movies[index].title;
  }

  @override
  void getUpcoming() {
    _setError(false);
    _setLoading(true);
    useCase.execute(
      page: page.toString(),
      success: (movies) {
        _movies = movies;
        _setLoading(false);
      },
      failure: (error) {
        print(error);
        _setError(true);
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  void _setError(bool value) {
    _hasError = value;

    notifyListeners();
  }

  @override
  void didTap(int index) {
    onTapGoToDetails?.call(_movies[index]);
  }
}
