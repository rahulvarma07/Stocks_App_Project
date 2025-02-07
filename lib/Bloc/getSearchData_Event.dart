part of 'getSearchData_Bloc.dart';


sealed class GetSearchDataEvent{}
final class GetSearchDataEventRequested extends GetSearchDataEvent{
  String symbol;
  GetSearchDataEventRequested({required this.symbol});
}
final class GetSearchEventInitial extends GetSearchDataEvent{}