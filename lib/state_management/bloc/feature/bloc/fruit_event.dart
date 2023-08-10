part of 'fruit_bloc.dart';

@immutable
abstract class FruitEvent {}
class InitEvent extends FruitEvent{}
class AddToCardEvent extends FruitEvent{
  FruitModel fruitModel;

  AddToCardEvent(this.fruitModel);
}
class RemoveToCardEvent extends FruitEvent{
}
class TotalCountEvent extends FruitEvent{
}
