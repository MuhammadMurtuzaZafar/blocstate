import 'package:get/state_manager.dart';

class FruitModel
{
  int id;
  String name;
  String image;
  double price;
  final selected=false.obs;

  FruitModel({required this.id,required this.name, required this.image, required this.price});
}