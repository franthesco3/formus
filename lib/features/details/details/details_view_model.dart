import 'package:formus/features/details/details/details_view_controller.dart';
import 'package:formus/features/details/use_cases.dart/details_use_case.dart';
import 'package:formus/support/utils/constants.dart';

import '../../../models/movie.dart';
import '../../../models/video.dart';

class DetailsViewModel extends DetailsProtocol {
  final Movie movie;
  late Video _video;
  bool _isFavorite = false;
  bool _isLoading = false;

  final GetVideoUseCaseProtocol useCase;

  DetailsViewModel({required this.useCase, required this.movie});

  @override
  String? get key => _video.key;

  @override
  String get title => movie.title;

  @override
  bool get isLoading => _isLoading;

  @override
  String get overview => movie.overview;

  @override
  bool get isFavorited => _isFavorite;

  @override
  String get vote => movie.voteAverage.toString();

  @override
  String get imagePath => Constants.urlImagePath + movie.imagePath;

  @override
  void setFavorite() async {
    if (_isFavorite) {
      _isFavorite = false;
    } else {
      _isFavorite = true;
    }
    notifyListeners();
  }

  @override
  void getVideo() async {
    _setLoading(true);
    useCase.execute(
      movieId: movie.id,
      success: (video) {
        _video = video;

        _setLoading(false);
      },
      failure: (error) {
        print(error);

        _setLoading(false);
      },
    );
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  void _changeFavorite(bool value) {
    _isFavorite = value;

    notifyListeners();
  }
}
