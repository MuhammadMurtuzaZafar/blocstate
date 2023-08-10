import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocstate/state_management/bloc/feature/model/fruit_mode.dart';
import 'package:meta/meta.dart';

import '../../../../core/constant/strings.dart';


part 'fruit_event.dart';
part 'fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  List<FruitModel> fruitList=[];
  List selectedFruitList=[];
  double totalPrice=0.0;

  FruitBloc() : super(FruitInitial()) {

    on<InitEvent>((event, emit) {
      fruitList.add(FruitModel(id: 1,name: "Orange", image: ImagePath.image1, price: 200));
      fruitList.add(FruitModel(id: 2,name: "MANGO", image: ImagePath.image2, price: 700));
      fruitList.add(FruitModel(id: 3,name: "APPLE", image: ImagePath.image3, price: 300));
      emit(InitState());
    });
    add(InitEvent());

    on<AddToCardEvent>((event, emit)  {
      addSelectedFood(event.fruitModel,emit);
    });
  }
  addSelectedFood(FruitModel fruitModel,emit){
    fruitModel.selected=!fruitModel.selected;

    bool itemExists = selectedFruitList.any((model) => model.id == fruitModel.id);
    if (itemExists) {
      selectedFruitList.remove(fruitModel);
    } else {
      selectedFruitList.add(fruitModel);
    }
    emit(FoodItemAddedState(selectedFruitList,sumFruitsPrice()));
    sumFruitsPrice();
  }

  sumFruitsPrice(){
    totalPrice=0.0;
    for (var element in selectedFruitList) {
      totalPrice+=element.price;
    }
    return totalPrice;
  }
}
