import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc_app/view/second_page.dart';

import '../controller/bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (contextb, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ));
                  },
                  child: const Text('NEXT'))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.number.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  contextb.read<CounterBloc>().add(DecrementEvent());
                },
                heroTag: 'de',
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'in',
                onPressed: () {
                  contextb.read<CounterBloc>().add(IncrementEvent());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
