import 'package:flutter/material.dart';
import 'package:formus/features/details/details_factory.dart';
import 'package:formus/features/upcoming/upcoming/upcoming_view.dart';
import 'package:formus/models/movie.dart';

abstract class UpcomingProtocol extends UpcomingViewModelProtocol {
  void Function(Movie movie)? onTapGoToDetails;
}

class UpcomingViewController extends StatefulWidget {
  final UpcomingProtocol viewModel;

  const UpcomingViewController({super.key, required this.viewModel});

  @override
  State<UpcomingViewController> createState() => _UpcomingViewControllerState();
}

class _UpcomingViewControllerState extends State<UpcomingViewController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UpcomingView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoToDetails = (movie) {
      Navigator.pushNamed(context, DetailsFactory.route, arguments: movie);
    };
  }
}
