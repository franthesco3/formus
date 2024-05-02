import 'package:flutter/material.dart';
import 'package:formus/support/components/button_default.dart';

class PlaceholderError extends StatelessWidget {
  final VoidCallback onTap;

  const PlaceholderError({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.error),
            const Text('Ocorreu um erro'),
            ButtonDefault(title: 'Tentar novamente', onTap: onTap),
          ],
        ),
      ),
    );
  }
}
