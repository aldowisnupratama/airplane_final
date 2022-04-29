part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destination;

  DestinationSuccess(this.destination);

  @override
  List<Object> get props => [destination];
}

class DestinationFailed extends DestinationState {
  final String errorMessage;

  DestinationFailed(this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
