import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/bird.dart';

// Bird States
abstract class BirdState extends Equatable {
  const BirdState();

  @override
  List<Object> get props => [];
}

class BirdInitial extends BirdState {}

class BirdLoading extends BirdState {}

class BirdLoaded extends BirdState {
  final List<Bird> birds;

  const BirdLoaded({required this.birds});

  @override
  List<Object> get props => [birds];
}

class BirdError extends BirdState {
  final String message;

  const BirdError({required this.message});

  @override
  List<Object> get props => [message];
}

// Bird Cubit
class BirdCubit extends Cubit<BirdState> {
  BirdCubit() : super(BirdInitial());

  final List<Bird> _birds = [];

  void loadBirds() {
    emit(BirdLoading());
    try {
      // Simulate loading birds
      emit(BirdLoaded(birds: _birds));
    } catch (e) {
      emit(BirdError(message: e.toString()));
    }
  }

  void addBird(Bird bird) {
    _birds.add(bird);
    emit(BirdLoaded(
        birds: _birds)); // Ensure state is updated after adding a bird
  }
}
