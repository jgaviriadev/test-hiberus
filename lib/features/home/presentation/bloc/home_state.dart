part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();  

  @override
  List<Object> get props => [];
}

class SuccessGetMTGCardsState extends HomeState {
  final List<CardEntity> cards;
  const SuccessGetMTGCardsState({
    required this.cards,
  });

  @override
  List<Object> get props => [cards];
}

class FailedGetMTGCardsState extends HomeState {
  final String message;
  const FailedGetMTGCardsState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LoadingState extends HomeState {
  final bool isLoading;
  const LoadingState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [isLoading];
}
