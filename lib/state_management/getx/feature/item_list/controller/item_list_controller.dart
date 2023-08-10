import 'package:blocstate/core/constant/strings.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../model/fruit_model.dart';

class ItemListController extends GetxController
{

  RxList<FruitModel> fruitList=RxList<FruitModel>([]);
  RxList<FruitModel> selectedFruitList=RxList<FruitModel>([]);
  var totalPrice=0.0.obs;
  @override
  void onInit() {
    super.onInit();
    fruitList.add(FruitModel(id: 1,name: "Orange", image: ImagePath.image1, price: 200));
    fruitList.add(FruitModel(id: 2,name: "MANGO", image: ImagePath.image2, price: 700));
    fruitList.add(FruitModel(id: 3,name: "APPLE", image: ImagePath.image3, price: 300));
    fruitList.add(FruitModel(id: 4,name: "BANANA", image: ImagePath.image4, price: 400));
  }

  selectedItem(FruitModel fruitModel)
  {
    fruitModel.selected.value=!fruitModel.selected.value;
    addSelectedFood(fruitModel);
  }
  addSelectedFood(FruitModel fruitModel){
    bool itemExists = selectedFruitList.any((model) => model.id == fruitModel.id);

    if (itemExists) {
      selectedFruitList.remove(fruitModel);
    } else {
      selectedFruitList.add(fruitModel);
    }
    sumFruitsPrice();
  }
  removeSelectedFood(FruitModel fruitModel){
    fruitModel.selected.value=fruitModel.selected.value;

    bool itemExists = selectedFruitList.any((model) => model.id == fruitModel.id);

    if (itemExists) {
      selectedFruitList.remove(fruitModel);
    }
    sumFruitsPrice();
  }

  sumFruitsPrice(){
    totalPrice.value=0.0;
    for (var element in selectedFruitList) {
      totalPrice.value+=element.price;
    }

  }
}