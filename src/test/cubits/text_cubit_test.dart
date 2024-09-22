
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn.flutter_app/cubits/text_cubit.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat"', () {
			expect(textCubit.state, TextState(text: 'Cat'));
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog")] when changeText is called and state is "Cat"',
			build: () => textCubit,
			act: (cubit) => cubit.changeText(),
			expect: () => [TextState(text: 'Dog')],
		);

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Cat")] when changeText is called and state is "Dog"',
			build: () => textCubit..emit(TextState(text: 'Dog')),
			act: (cubit) => cubit.changeText(),
			expect: () => [TextState(text: 'Cat')],
		);
	});
}
