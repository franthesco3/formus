import 'package:flutter/material.dart';
import 'package:formus/support/components/card_group.dart';
import 'package:formus/support/components/placeholders/placeholder_error.dart';
import 'package:formus/support/components/placeholders/placeholder_loading.dart';

abstract class UpcomingViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get hasError;
  bool get isLoading;

  void getUpcoming();
  void didTap(int index);
  String title(int index);
  String image(int index);
}

class UpcomingView extends StatelessWidget {
  final UpcomingViewModelProtocol viewModel;

  const UpcomingView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TFormus - Novidades(EUA)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) return const PlaceholderLoading();

          if (viewModel.hasError) {
            return PlaceholderError(onTap: viewModel.getUpcoming);
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 4,
                    mainAxisExtent: MediaQuery.of(context).size.width / 3,
                    mainAxisSpacing: 8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      return CardGroup(
                        onTap: () => viewModel.didTap(index),
                        path: viewModel.image(index),
                      );
                    },
                    childCount: viewModel.length,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
