import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ButtonDefault({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(6),
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text(title)),
      ),
    );
  }
}
