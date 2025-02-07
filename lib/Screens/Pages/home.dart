import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stockproject/Bloc/getAllData_Bloc.dart';
import 'package:stockproject/Screens/Pages/ProfitStocks.dart';
import 'package:stockproject/Screens/Pages/lossesStocks.dart';
import 'package:stockproject/Screens/Pages/searchPage.dart';
import 'package:stockproject/Screens/Pages/watchList.dart';
import 'package:stockproject/Themes/themeData.dart';
import '../../Utils/Home/searchOptionWidget.dart';
import '../Helpers/showSearchResultBuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    context.read<GetAllDataUsingBloc>().add(GetAllDataEventRequested());
    super.initState();
  }

  // @override
  // // void dispose() {
  // //   searchTextController.dispose();
  // //   super.dispose();
  // // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: TabBar(
              splashFactory: NoSplash.splashFactory,
              indicatorAnimation: TabIndicatorAnimation.linear,
              padding: EdgeInsets.only(top: 5, bottom: 8, left: 3, right: 3),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppTheme().primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
             indicatorColor: Colors.transparent,
              labelColor: AppTheme().primaryColor,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
                tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.arrowTrendUp,
                  color: AppTheme().darkPositiveColor,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.arrowTrendDown,
                  color: AppTheme().negativeColor,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.glasses,
                  color: AppTheme().textColor,
                ),
              ),
            ]),

            appBar: AppBar(
              title: Text(
                "Stocks",
                style: TextStyle(color: AppTheme().textColor),
              ),
              backgroundColor: AppTheme().backGroundColor,
              surfaceTintColor: Colors.transparent,
            ),
            backgroundColor: AppTheme().backGroundColor,
            // Bloc Consumer := Main Bloc & Main State...
            body: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppTheme().primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(21))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.search, color: AppTheme().textColor,)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 7,
                    child: TabBarView(
                      children: [
                        GainerStocks(),
                        LoserStocksPage(),
                        WatchList(),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
