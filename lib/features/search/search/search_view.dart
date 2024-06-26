import 'package:flutter/material.dart';
import 'package:formus/support/components/card_group.dart';

abstract class SearchViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isEmpty;
  bool get isLoading;

  void getSearchQuery();
  void didTap(int index);
  void onChange(String value);
  String imagePath(int index);
  void searchMovies(String query);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TFormus - Buscar(EUA)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: TextField(
                    onEditingComplete: viewModel.getSearchQuery,
                    obscureText: false,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: viewModel.getSearchQuery,
                        child: const Icon(Icons.search, size: 32),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Pesquisar filme',
                    ),
                    onChanged: viewModel.onChange,
                  ),
                ),
              ),
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
              )
            ],
          );
        },
      ),
    );
  }
}
