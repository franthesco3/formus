import 'package:flutter/material.dart';
import 'package:formus/features/upcoming/upcoming_factory.dart';
import 'package:formus/support/components/bottom_nav_bar.dart';

import '../../popular/popular_factory.dart';
import '../../search/search_factory.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get index;
  void setIndex(int index);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  HomeView({super.key, required this.viewModel});

  final contents = <Widget>[
    UpcomingFactory.home(),
    PopularFactory.popular(),
    SearchFactory.search(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            index: viewModel.index,
            onTap: viewModel.setIndex,
          ),
          body: contents.elementAt(viewModel.index),
        );
      },
    );
  }
}
