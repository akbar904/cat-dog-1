
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib/main.dart';

void main() {
	group('MyApp Widget Test', () {
		// Test if MyApp builds the widget tree correctly
		testWidgets('should display HomeScreen widget', (WidgetTester tester) async {
			// Build MyApp widget
			await tester.pumpWidget(MyApp());

			// Verify if HomeScreen widget is present
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('HomeScreen Widget Test', () {
		// Test if HomeScreen displays initial text and button
		testWidgets('should display initial text "Cat" and a button', (WidgetTester tester) async {
			// Build HomeScreen widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => TextCubit(),
						child: HomeScreen(),
					),
				),
			);

			// Verify if initial text "Cat" is present
			expect(find.text('Cat'), findsOneWidget);

			// Verify if the button is present
			expect(find.byType(ChangeTextButton), findsOneWidget);
		});

		// Test if button click changes text from "Cat" to "Dog"
		testWidgets('should change text from "Cat" to "Dog" when button is clicked', (WidgetTester tester) async {
			// Build HomeScreen widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => TextCubit(),
						child: HomeScreen(),
					),
				),
			);

			// Verify initial text "Cat"
			expect(find.text('Cat'), findsOneWidget);

			// Tap the ChangeTextButton
			await tester.tap(find.byType(ChangeTextButton));
			await tester.pump();

			// Verify changed text "Dog"
			expect(find.text('Dog'), findsOneWidget);
		});
	});
}
