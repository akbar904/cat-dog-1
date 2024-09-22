
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn.flutter_app/cubits/text_cubit.dart';

class ChangeTextButton extends StatelessWidget {
	const ChangeTextButton({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				context.read<TextCubit>().changeText();
			},
			child: Text('Change Text'),
		);
	}
}
