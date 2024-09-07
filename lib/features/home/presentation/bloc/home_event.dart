part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetMTGCardsEvent extends HomeEvent {
  final String lang;
  const GetMTGCardsEvent({required this.lang});
  @override
  List<Object> get props => [];
}
