import 'package:flutter/material.dart';
import 'package:formus/support/components/card_group.dart';

abstract class PopularViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isEmpty;
  bool get isLoading;

  void getPopular();
  void didTap(int index);
  String title(int index);
  void setIndex(int index);
  String imagePath(int index);
}

class PopularView extends StatelessWidget {
  final PopularViewModelProtocol viewModel;

  const PopularView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TFormus - Mais assistidos(EUA)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.isEmpty) {
            return const Center(
                child: Text('Nâo foi possivel carregar os dados!'));
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
                        path: viewModel.imagePath(index),
                      );
                    },
                    childCount: viewModel.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
