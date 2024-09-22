
import 'package:flutter/material.dart';
import 'package:bird_app/models/bird.dart';

class BirdItemWidget extends StatefulWidget {
	final Bird bird;

	const BirdItemWidget({Key? key, required this.bird}) : super(key: key);

	@override
	_BirdItemWidgetState createState() => _BirdItemWidgetState();
}

class _BirdItemWidgetState extends State<BirdItemWidget> {
	bool _isBird = true;

	@override
	Widget build(BuildContext context) {
		return ListTile(
			title: Text(widget.bird.name),
			subtitle: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(widget.bird.species),
					Text('Age: ${widget.bird.age}'),
				],
			),
			trailing: GestureDetector(
				onTap: () {
					setState(() {
						_isBird = !_isBird;
					});
				},
				child: Row(
					mainAxisSize: MainAxisSize.min,
					children: [
						Icon(_isBird ? Icons.access_time : Icons.person),
						SizedBox(width: 5),
						Text(_isBird ? 'Bird' : 'Dog'),
					],
				),
			),
		);
	}
}
