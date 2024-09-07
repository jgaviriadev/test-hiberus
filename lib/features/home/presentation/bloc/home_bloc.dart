
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetMTGCardsUseCase getMTGCardsUseCase;

  List<CardEntity> cards  = [];
  String currentLang = "";

  HomeBloc({required this.getMTGCardsUseCase}) : super(const HomeState()) {
    on<GetMTGCardsEvent>((event, emit) async {
      emit(await _getMTGCards(emit: emit, event:event ));
    });
  }

  Future<HomeState> _getMTGCards({required Emitter<HomeState> emit, required GetMTGCardsEvent event}) async {
    emit(const LoadingState(isLoading: true));
    currentLang = event.lang;
    if(cards.isEmpty){
      //get cards from API
      final data = await getMTGCardsUseCase(NoParams());

      return data.fold((failure) {
        emit(const LoadingState(isLoading: false));
        return FailedGetMTGCardsState(
          message: failure.props.isNotEmpty ? failure.props.first.toString() : '',
        );
      }, (resp) async {
        //delete cards with same name
        final Set<String> seenNames = {};
        List<CardEntity> filteredCards = resp.result.where((card) => seenNames.add(card.name ?? "")).toList();
        //return data in a more readable form for the UI according to the language
        List<CardEntity> detailedCards = await Future.wait(
          filteredCards.map((card) async => await getCardDetails(currentLang, card)).toList(),
        );
        cards = filteredCards; //save orinal cards list in bloc
        emit(const LoadingState(isLoading: false));
        return SuccessGetMTGCardsState(cards: detailedCards);
      });

    } else {
      //get cards from local
      List<CardEntity> detailedCards = await Future.wait(
        cards.map((card) async => await getCardDetails(currentLang, card)).toList(),
      );
      emit(const LoadingState(isLoading: false));
      return SuccessGetMTGCardsState(cards: detailedCards);
    }
  }

  Future<CardEntity> getCardDetails (String lang, CardEntity card) async{
    //add logic to return data in a more readable form for the UI according to the language
    switch (lang) {
      case "es":
        var newCard = card;
        String? name;
        String? type;
        String? text;
        String? imageUrl;
        String? flavor;

        if((card.foreignNames?.length ?? 0) > 0){
          name = card.foreignNames!.firstWhere(
            (element) => element.language  == 'Spanish',
            orElse: () => const ForeignNameEntity(), //Returns if language not found
          ).name;

          type = card.foreignNames!.firstWhere(
            (element) => element.language  == 'Spanish',
            orElse: () => const ForeignNameEntity(), //Returns if language not found
          ).type;

          text = card.foreignNames!.firstWhere(
            (element) => element.language  == 'Spanish',
            orElse: () => const ForeignNameEntity(), //Returns if language not found
          ).text;

          imageUrl = card.foreignNames!.firstWhere(
            (element) => element.language  == 'Spanish',
            orElse: () => const ForeignNameEntity(), //Returns if language not found
          ).imageUrl;

          flavor = card.foreignNames!.firstWhere(
            (element) => element.language  == 'Spanish',
            orElse: () => const ForeignNameEntity(), //Returns if language not found
          ).flavor;
        }


        newCard = newCard.copyWith(
          name: name,
          type: type,
          text: text,
          imageUrl: imageUrl,
          flavor: flavor
        );
        return newCard;
      default:
        return card;
    }
  }
}
