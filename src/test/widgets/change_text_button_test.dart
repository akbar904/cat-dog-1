
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.walturn.flutter_app/widgets/change_text_button.dart';

class MockTextCubit extends MockCubit<void> implements TextCubit {}

void main() {
	group('ChangeTextButton Widget Tests', () {
		testWidgets('renders a button with initial text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<TextCubit>(
							create: (_) => MockTextCubit(),
							child: ChangeTextButton(),
						),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Change Text'), findsOneWidget);
		});

		testWidgets('calls changeText on TextCubit when pressed', (WidgetTester tester) async {
			final mockTextCubit = MockTextCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<TextCubit>(
							create: (_) => mockTextCubit,
							child: ChangeTextButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockTextCubit.changeText()).called(1);
		});
	});
}
