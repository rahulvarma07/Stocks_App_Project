part of 'getSearchData_Bloc.dart';

sealed class GetSearchDataState{}
final class GetSearchDataInitialState extends GetSearchDataState{}
final class GetSearchDataSuccessState extends GetSearchDataState{
  final List getSearchData;
  GetSearchDataSuccessState({required this.getSearchData});
}
final class GetSearchDataCompletedState extends GetSearchDataState{
  final List dummyData = ["IBM", "NVDA", "LTRY", "SVREW", "APPS"];
}
final class GetSearchDataFailedState  extends GetSearchDataState{}
