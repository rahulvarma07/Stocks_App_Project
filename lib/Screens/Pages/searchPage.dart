import 'package:flutter/material.dart';
import 'package:stockproject/Themes/themeData.dart';

import '../../Utils/Home/searchOptionWidget.dart';
import '../Helpers/showSearchResultBuilder.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().backGroundColor,
      body: Column(
        children: [
          SizedBox(height: 18,),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: GestureDetector(
                      child: SearchOptionWidget(searchTextController: searchTextController,)
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 4,
              child: ShowSearchResult(),
          )
          ],
      )
    );
  }
}
