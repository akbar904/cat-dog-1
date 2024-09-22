
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn.flutter_app/models/text_state.dart';

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState(text: 'Cat'));

	void changeText() {
		if (state.text == 'Cat') {
			emit(TextState(text: 'Dog'));
		} else {
			emit(TextState(text: 'Cat'));
		}
	}
}
