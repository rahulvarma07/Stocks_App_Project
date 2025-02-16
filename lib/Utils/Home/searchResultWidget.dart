import 'package:flutter/material.dart';
import 'package:stockproject/Themes/themeData.dart';

class SearchResultWidget extends StatelessWidget {
  final String ticker;
  const SearchResultWidget({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ticker, style: TextStyle(color: AppTheme().textColor),),
    );
  }
}
