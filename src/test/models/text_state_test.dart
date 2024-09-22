
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/models/text_state.dart';

void main() {
	group('TextState Model', () {
		test('should correctly initialize with given text', () {
			final textState = TextState(text: 'Cat');

			expect(textState.text, 'Cat');
		});

		test('should correctly serialize to JSON', () {
			final textState = TextState(text: 'Cat');
			final json = textState.toJson();

			expect(json, {'text': 'Cat'});
		});

		test('should correctly deserialize from JSON', () {
			final json = {'text': 'Dog'};
			final textState = TextState.fromJson(json);

			expect(textState.text, 'Dog');
		});
	});
}
