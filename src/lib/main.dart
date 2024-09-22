
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/text_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider<TextCubit>(
					create: (context) => TextCubit(),
				),
			],
			child: MaterialApp(
				title: 'Flutter Demo',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: HomeScreen(),
			),
		);
	}
}
