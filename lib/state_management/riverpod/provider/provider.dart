import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/fruit_mode_rp.dart';

final selectedItemProvider = StateNotifierProvider<ItemListNotifier, List<FruitModel>>((ref) {
  return ItemListNotifier();
});

class ItemListNotifier extends StateNotifier<List<FruitModel>> {
  ItemListNotifier() : super([]);

  void addItem(FruitModel item) {
    bool itemExists = state.any((model) => model.id == item.id);
    // debugger();
    if(itemExists) {
      state = List.from(state)..remove(item);
    }
    else{
      state = [...state, item];

    }
  }
  void removeItem(int index) {
    state = List.from(state)..removeAt(index);
  }
   containItem(FruitModel item){
    bool itemExists = state.any((model) => model.id == item.id);
    return itemExists;
  }
  totalPrice()
  {
   double totalPrice=0.0;
    for (var element in state) {
      totalPrice+=element.price;
    }
    return totalPrice;
  }
}
