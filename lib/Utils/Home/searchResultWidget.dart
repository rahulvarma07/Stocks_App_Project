import 'package:flutter/material.dart';

class SearchResultWidget extends StatelessWidget {
  final String ticker;
  const SearchResultWidget({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ticker),
    );
  }
}
