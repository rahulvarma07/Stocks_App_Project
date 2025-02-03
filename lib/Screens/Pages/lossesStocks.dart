import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/getAllData_Bloc.dart';
import '../../Utils/ScreenUtils/stockContainerWidget.dart';

class LoserStocksPage extends StatelessWidget {
  const LoserStocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< GetAllDataUsingBloc, GetAllDataState>(
      buildWhen: (prev, curr)=> curr is !GetAllDataStateInitial,
      listenWhen: (prev, curr) => curr is GetAllDataStateInitial,
      builder: (context, state){
        if(state is GetAllDataStateSuccess){
          return ListView.builder(
            itemCount: state.topLosses.length,
            itemBuilder: (context, ind){
              return StockDetails(ticker: state.topLosses[ind]["ticker"], priceOfTheCurrentStock: state.topLosses[ind]["price"], changePrice: state.topLosses[ind]["change_amount"], changePercentage: state.topLosses[ind]["change_percentage"], volume: state.topLosses[ind]["volume"],);
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
        // TODO:
        // handle State Failure Error over here
      },
    );
  }
}
