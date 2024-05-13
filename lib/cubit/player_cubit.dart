import 'package:bloc/bloc.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerInitialState(allplayers));

  void filterPlayers(String club) {
    if (club.isEmpty) {
      emit(PlayerInitialState(allplayers));
      return;
    } else {
      List<Map<String, dynamic>> filteredPlayers = allplayers
          .where((player) =>
              player['club'].toLowerCase().contains(club.toLowerCase()))
          .toList();
      emit(PlayerFilteredState(filteredPlayers));
    }
  }
}
