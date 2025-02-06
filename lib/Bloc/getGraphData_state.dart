part of 'getGraphData_Bloc.dart';

sealed class GetIndividualDataState{}
final class GetIndividualDataStateInitial extends GetIndividualDataState{} // Initial
final class GetIndividualDataStateSuccess extends GetIndividualDataState{
  Map<String, dynamic>response;
  GetIndividualDataStateSuccess({required this.response});
} // Success
final class GetIndividualDataStateFailed  extends GetIndividualDataState{} // Failure
final class GetIndividualDataStateLoading extends GetIndividualDataState{} // Loading
