import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Secrets/secretsKeys.dart';

part 'getGraphData_state.dart';
part 'getGraphData_event.dart';


class GetIndividualDataBloc extends Bloc<GetIndividualDataEvent, GetIndividualDataState>{
  GetIndividualDataBloc() : super(GetIndividualDataStateInitial()){
    on<GetIndividualDataRequested>((event, emit) async{
      emit(GetIndividualDataStateLoading());
      final Uri uri = Uri.parse("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${event.ticker}&interval=15min&apikey=${SecretKeys().getIndividualDataKey}");
      try{
        final response = await http.get(uri);
        if(response.statusCode == 200){
          Map<String, dynamic>finalResponse = jsonDecode(response.body);
          Map<String, dynamic>res = finalResponse["Time Series (15min)"]??{"Data" : "None"};
          emit(GetIndividualDataStateSuccess(response: res));
        }
      }catch(e){
        emit(GetIndividualDataStateFailed());
      }
    });
  }
}