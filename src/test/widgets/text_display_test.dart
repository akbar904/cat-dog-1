
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn.flutter_app/widgets/text_display.dart';

void main() {
	group('TextDisplay Widget Tests', () {
		testWidgets('displays initial text', (WidgetTester tester) async {
			// Define the initial text
			const initialText = 'Cat';
			
			// Build the TextDisplay widget
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(
					body: TextDisplay(text: initialText),
				),
			));
			
			// Find the text widget and verify its content
			expect(find.text(initialText), findsOneWidget);
		});
		
		testWidgets('displays updated text', (WidgetTester tester) async {
			// Define the updated text
			const updatedText = 'Dog';
			
			// Build the TextDisplay widget
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(
					body: TextDisplay(text: updatedText),
				),
			));
			
			// Find the text widget and verify its content
			expect(find.text(updatedText), findsOneWidget);
		});
	});
}
