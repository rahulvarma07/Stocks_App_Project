part of 'getGraphData_Bloc.dart';

sealed class GetIndividualDataEvent{}
final class GetIndividualDataRequested extends GetIndividualDataEvent{
  final String ticker;
  GetIndividualDataRequested({required this.ticker});
}