import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_cubit/cubit/player_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter Players',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<PlayerCubit>(
        create: (context) => PlayerCubit(),
        child: const MyHomePage(title: 'Filter Players Listview'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                context.read<PlayerCubit>().filterPlayers(value);
              },
              decoration: InputDecoration(
                labelText: 'Search by Club',
                suffix: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<PlayerCubit, PlayerState>(
                builder: (context, state) {
                  if (state is PlayerInitialState) {
                    return ListView.builder(
                      itemCount: state.players.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.players[index]['name']),
                          subtitle: Text(state.players[index]['club']),
                        );
                      },
                    );
                  } else if (state is PlayerFilteredState) {
                    return ListView.builder(
                      itemCount: state.filteredPlayers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.filteredPlayers[index]['name']),
                          subtitle: Text(state.filteredPlayers[index]['club']),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
