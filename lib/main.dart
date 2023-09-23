import 'presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubits/weight_cubit.dart';
import 'logic/cubits/age_cubit.dart';
import 'logic/cubits/calculate_cubit.dart';
import 'logic/cubits/gender_select_cubit.dart';
import 'logic/cubits/height_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeightCubit>(create: (context) => WeightCubit()),
        BlocProvider<AgeCubit>(create:(context)=> AgeCubit()),
        BlocProvider<HeightCubit>(create:(context)=>HeightCubit()),
        BlocProvider<CalculateCubit>(create:(context)=>CalculateCubit()),
        BlocProvider<GenderSelectCubit>(create: (context)=>GenderSelectCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xFF0A0D22)),
          scaffoldBackgroundColor: const Color(0xFF0A0D22),
          primaryColor: const Color(0xFF111428),
          filledButtonTheme: const FilledButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        initialRoute: '/',
        routes: router,
      ),
    );
  }
}
