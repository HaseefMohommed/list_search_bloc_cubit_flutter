part of 'player_cubit.dart';

final List<Map<String, dynamic>> allplayers = [
  {
    "name": "Lionel Messi",
    "club": "Paris Saint-Germain",
  },
  {
    "name": "Cristiano Ronaldo",
    "club": "Manchester United",
  },
  {
    "name": "Neymar Jr",
    "club": "Paris Saint-Germain",
  },
  {
    "name": "Kylian Mbappe",
    "club": "Paris Saint-Germain",
  },
  {
    "name": "Mohamed Salah",
    "club": "Liverpool",
  },
  {
    "name": "Kevin De Bruyne",
    "club": "Manchester City",
  },
  {
    "name": "Robert Lewandowski",
    "club": "Bayern Munich",
  },
  {
    "name": "Karim Benzema",
    "club": "Real Madrid",
  },
  {
    "name": "Harry Kane",
    "club": "Tottenham Hotspur",
  },
  {
    "name": "Romelu Lukaku",
    "club": "Chelsea",
  },
  {
    "name": "Sadio Mane",
    "club": "Liverpool",
  },
  {
    "name": "Raheem Sterling",
    "club": "Manchester City",
  },
  {
    "name": "Joshua Kimmich",
    "club": "Bayern Munich",
  },
  {
    "name": "Heung-Min Son",
    "club": "Tottenham Hotspur",
  },
  {
    "name": "Bruno Fernandes",
    "club": "Manchester United",
  },
  {
    "name": "Luis Suarez",
    "club": "Atletico Madrid",
  },
  {
    "name": "Erling Haaland",
    "club": "Borussia Dortmund",
  },
  {
    "name": "Gianluigi Donnarumma",
    "club": "Paris Saint-Germain",
  },
  {
    "name": "Jadon Sancho",
    "club": "Manchester United",
  },
  {
    "name": "Toni Kroos",
    "club": "Real Madrid",
  }
];

abstract class PlayerState {}

class PlayerInitialState extends PlayerState {
  final List<Map<String, dynamic>> players;

  PlayerInitialState(this.players);
}

class PlayerFilteredState extends PlayerState {
  final List<Map<String, dynamic>> filteredPlayers;

  PlayerFilteredState(this.filteredPlayers);
}
