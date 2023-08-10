import 'package:blocstate/core/constant/strings.dart';
import 'package:blocstate/state_management/bloc/feature/bloc/fruit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widget/item_card_bloc.dart';
import '../../../core/widget/item_card_rp.dart';
import '../model/fruit_mode_rp.dart';
import '../provider/provider.dart';

class ItemListScreenRp extends StatefulWidget {
  const ItemListScreenRp({super.key});

  @override
  State<ItemListScreenRp> createState() => _ItemListScreenRpState();
}

class _ItemListScreenRpState extends State<ItemListScreenRp> {
  List<FruitModel> fruitList = [];
  @override
  void initState() {
    super.initState();
    fruitList.add(
        FruitModel(id: 1, name: "Orange", image: ImagePath.image1, price: 200));
    fruitList.add(
        FruitModel(id: 2, name: "MANGO", image: ImagePath.image2, price: 700));
    fruitList.add(
        FruitModel(id: 3, name: "APPLE", image: ImagePath.image3, price: 300));
    fruitList.add(
        FruitModel(id: 4, name: "BANANA", image: ImagePath.image4, price: 400));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Item List"),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined)),
                // BlocBuilder<FruitBloc, FruitState>(
                //     builder: (context, state) => state is FoodItemAddedState && state.selectedFruitList.isEmpty

                Consumer(builder: (context, ref, child) {
                  var selectedFruitList = ref.watch(selectedItemProvider);

                  return selectedFruitList.isNotEmpty? Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${selectedFruitList.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ):SizedBox();
                })
              ],
            )
          ],
        ),
        body: Container(
          width: size.width,
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: size.width, // Adjust this based on your requirements
                    height: size.height *
                        0.2, // Adjust this based on your requirements
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius for rounded corners
                      image: DecorationImage(
                        image: AssetImage(ImagePath
                            .product), // Provide the path to your asset image
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Consumer(builder: (context, ref, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: fruitList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemCardRp(fruitList[index], ref);
                    },
                  );
                })
              ],
            ),
          ),
        ));
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        // Custom shape for top border
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, child) {
          var selectedFruitList = ref.watch(selectedItemProvider);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    const Text(
                      "Card",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "Total ${ref.watch(selectedItemProvider.notifier).totalPrice().toString()} \$",
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 400,
                child: selectedFruitList.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (c, i) => const Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                        itemCount: selectedFruitList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading:
                                Image.asset(selectedFruitList[index].image),
                            title: Text(selectedFruitList[index].name),
                            subtitle:
                                Text("${selectedFruitList[index].price}\$"),
                            trailing: IconButton(
                              onPressed: () async {
                                // bloc.add(AddToCardEvent(
                                //     state.selectedFruitList[index]));
                                ref
                                    .read(selectedItemProvider.notifier)
                                    .removeItem(index);
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          );
                        })
                    : const Center(child: Text("No Item Selected")),
              )
            ],
          );
        });
      },
    );
  }
}
