
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn.flutter_app/cubits/text_cubit.dart';
import 'package:com.walturn.flutter_app/models/text_state.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						BlocBuilder<TextCubit, TextState>(
							builder: (context, state) {
								return Text(state.text, style: TextStyle(fontSize: 24));
							},
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								context.read<TextCubit>().changeText();
							},
							child: Text('Change Text'),
						),
					],
				),
			),
		);
	}
}
