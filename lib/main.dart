import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:state_management/src/bloc_app/controller/bloc/counter_bloc.dart';
import 'package:state_management/src/getx_app/view/home_screen.dart';

import 'src/bloc_app/view/home_bloc_screen.dart';

//=========================== Main bloc ========================
// void main() {
//   Bloc.observer = const AppBlocObserver();
//   runApp(const MyApp());
// }

// class AppBlocObserver extends BlocObserver {
//   /// {@macro app_bloc_observer}
//   const AppBlocObserver();

//   @override
//   void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) print(change);
//   }

//   @override
//   void onTransition(
//     Bloc<dynamic, dynamic> bloc,
//     Transition<dynamic, dynamic> transition,
//   ) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterBloc(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(title: 'Flutter Demo BLOC'),
//       ),
//     );
//   }
// }

// =============  Main Getx ==============
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
