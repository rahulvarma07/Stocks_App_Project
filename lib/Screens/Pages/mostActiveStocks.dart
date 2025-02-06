import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Themes/themeData.dart';
import '../../Bloc/getAllData_Bloc.dart';
import '../../Utils/ScreenUtils/stockContainerWidget.dart';

class MostActiveStocks extends StatefulWidget {
  const MostActiveStocks({super.key});

  @override
  State<MostActiveStocks> createState() => _MostActiveStocksState();
}

class _MostActiveStocksState extends State<MostActiveStocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Most Active Stock's", style: TextStyle(color: AppTheme().textColor),)
      ),
      body: BlocConsumer< GetAllDataUsingBloc, GetAllDataState>(
        buildWhen: (prev, curr)=> curr is !GetAllDataStateInitial,
        listenWhen: (prev, curr) => curr is GetAllDataStateInitial,
        builder: (context, state){
          if(state is GetAllDataStateSuccess){
            return ListView.builder(
              itemCount: state.activeStocks.length,
              itemBuilder: (context, ind){
                return GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      //context.read<GetIndividualDataBloc>().add(GetIndividualDataRequested(ticker: state.topGainers[ind]["ticker"]));
                    },
                    child: StockDetails(ticker: state.activeStocks[ind]["ticker"], priceOfTheCurrentStock: state.activeStocks[ind]["price"], changePrice: state.activeStocks[ind]["change_amount"], changePercentage: state.activeStocks[ind]["change_percentage"], volume: state.activeStocks[ind]["volume"],)
                );
              },
            );
          }
          else if(state is GetAllDataLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            // Return POP UP Message over here...
            return SizedBox();
          }
        },
        listener: (context, state){
          // getAllData.add(event)
          // TODO:
          // handle State Failure Error over here
        },
      ),
    );
  }
}
