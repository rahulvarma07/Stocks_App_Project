import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Bloc/getSearchData_Bloc.dart';
import 'package:stockproject/Utils/Home/searchResultWidget.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< GetSearchDataBloc, GetSearchDataState>(
      buildWhen: (prev, curr)=> curr is !GetSearchDataInitialState,
      listenWhen: (prev, curr) => curr is GetSearchDataInitialState,
      builder: (context, state){
        if(state is GetSearchDataSuccessState){
          return ListView.builder(
            itemCount: state.getSearchData.length,
            itemBuilder: (context, ind){
              return GestureDetector(
                  onTap: (){
                  },
                  child: SearchResultWidget(ticker: state.getSearchData[ind])
              );
            },
          );
        }
        else if(state is GetSearchDataCompletedState){
          return ListView.builder(
            itemCount: state.dummyData.length,
            itemBuilder: (context, ind){
              return GestureDetector(
                  onTap: (){
                  },
                  child: SearchResultWidget(ticker: state.dummyData[ind])
              );
            },
          );
        }
        else{
          // Return POP UP Message over here...
          return SizedBox.shrink();
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
