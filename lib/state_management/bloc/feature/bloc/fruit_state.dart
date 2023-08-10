part of 'fruit_bloc.dart';

@immutable
abstract class FruitState {}

class FruitInitial extends FruitState {}
class InitState extends FruitState{}
class FoodItemAddedState extends FruitState{
  List selectedFruitList=[];
  double totalPrice;
  FoodItemAddedState(this.selectedFruitList,this.totalPrice);
}

