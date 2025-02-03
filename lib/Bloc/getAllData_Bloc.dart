import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'getAllData_event.dart';
part 'getAllData_State.dart';



class GetAllDataUsingBloc extends Bloc<GetAllDataEvent, GetAllDataState>{
  GetAllDataUsingBloc() : super(GetAllDataStateInitial()){

    // On Requesting This Event (GetAllDataEventRequested)
    on<GetAllDataEventRequested>((event, emit) async{
      emit(GetAllDataLoadingState());
      try{
        final Uri uri = Uri.parse("https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=PLACE_YOUR_API_KEY");
        final res = await http.get(uri);
        if(res.statusCode == 200){
          final Map<String, dynamic> response = jsonDecode(res.body);
          print(response);
          emit(GetAllDataStateSuccess(
              topGainers: response["top_gainers"]??[],
              topLosses: response["top_losers"]??[],
              activeStocks: response["most_actively_traded"]??[],
              lastUpdated: response["last_updated"]??""));
        }
      }catch(e){
        print(e.toString());
        emit(GetAllDataFailed(err: e.toString()));
      }
    });


  }
}
