import 'package:flutter/material.dart';
import 'package:stockproject/Themes/themeData.dart';

class ShowStockCharts extends StatefulWidget {
  const ShowStockCharts({super.key});

  @override
  State<ShowStockCharts> createState() => _ShowStockChartsState();
}

class _ShowStockChartsState extends State<ShowStockCharts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios, color: AppTheme().textColor,
            ))
      ),
    );
  }
}
