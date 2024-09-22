
class TextState {
	final String text;

	TextState({required this.text});

	Map<String, dynamic> toJson() {
		return {'text': text};
	}

	factory TextState.fromJson(Map<String, dynamic> json) {
		return TextState(text: json['text']);
	}
}
