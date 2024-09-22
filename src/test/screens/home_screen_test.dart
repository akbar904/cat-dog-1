
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:your_app/screens/home_screen.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays initial text as "Cat"', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
		});

		testWidgets('displays updated text as "Dog" when cubit state changes', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			whenListen(
				textCubit,
				Stream.fromIterable([TextState(text: 'Dog')]),
			);

			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
		});

		testWidgets('has a button to change text', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('button tap triggers text change', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat'));
			when(() => textCubit.changeText()).thenReturn(null);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => textCubit.changeText()).called(1);
		});
	});
}
