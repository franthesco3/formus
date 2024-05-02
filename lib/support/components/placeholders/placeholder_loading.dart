import 'package:flutter/material.dart';

class PlaceholderLoading extends StatelessWidget {
  const PlaceholderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CircularProgressIndicator(), Text('Aguarde...')],
        ),
      ),
    );
  }
}
