import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../Secrets/secretsKeys.dart';

part 'getSearchData_Event.dart';
part 'getSearchData_State.dart';


class GetSearchDataBloc extends Bloc<GetSearchDataEvent, GetSearchDataState>{
  GetSearchDataBloc() : super(GetSearchDataInitialState()){
    on<GetSearchEventInitial>((event, emit){
      emit(GetSearchDataCompletedState());
    });
    on<GetSearchDataEventRequested>((event, emit) async{
      emit(GetSearchDataInitialState());
      try{
        final Uri uri = Uri.parse("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=${event.symbol}&apikey=${SecretKeys().searchKey}");
        final res = await http.get(uri);
        if(res.statusCode == 200){
          final jsonResponse = jsonDecode(res.body);
          final List getSearchData = jsonResponse["bestMatches"];
          emit(GetSearchDataSuccessState(getSearchData: getSearchData));
        }
      }catch(err){
        print("ERROr");
        emit(GetSearchDataFailedState());
      }
    });
  }
}