import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Bloc/getGraphData_Bloc.dart';
import 'package:stockproject/Screens/Pages/showStockCharts.dart';
import '../../Bloc/getAllData_Bloc.dart';
import '../../Utils/ScreenUtils/stockContainerWidget.dart';

class GainerStocks extends StatelessWidget {
  const GainerStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer< GetAllDataUsingBloc, GetAllDataState>(
      buildWhen: (prev, curr)=> curr is !GetAllDataStateInitial,
      listenWhen: (prev, curr) => curr is GetAllDataStateInitial,
      builder: (context, state){
        if(state is GetAllDataStateSuccess){
          return ListView.builder(
            itemCount: state.topGainers.length,
            itemBuilder: (context, ind){
              return GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                  //context.read<GetIndividualDataBloc>().add(GetIndividualDataRequested(ticker: state.topGainers[ind]["ticker"]));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowStockCharts()));
                },
                  child: StockDetails(ticker: state.topGainers[ind]["ticker"], priceOfTheCurrentStock: state.topGainers[ind]["price"], changePrice: state.topGainers[ind]["change_amount"], changePercentage: state.topGainers[ind]["change_percentage"], volume: state.topGainers[ind]["volume"],)
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
    );
  }
}

