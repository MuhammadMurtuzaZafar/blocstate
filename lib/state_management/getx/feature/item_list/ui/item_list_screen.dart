import 'package:blocstate/core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widget/item_card.dart';
import '../controller/item_list_controller.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ItemListController itemListController = Get.find<ItemListController>();
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
              Obx(()=>itemListController.selectedFruitList.isEmpty
                  ? const SizedBox()
                  : Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${itemListController.selectedFruitList.length}",
                  style: const TextStyle(color: Colors.white),
                ),
              )),
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
              Obx(() => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: itemListController.fruitList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemCard(index);
                  }))
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    ItemListController itemListController = Get.find<ItemListController>();
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        // Custom shape for top border
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Card",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Obx(() => Text(
                        "Total ${itemListController.totalPrice} \$",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
                height: 400,
                child: Obx(() => itemListController.selectedFruitList.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (c, i) => const Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                        itemCount: itemListController.selectedFruitList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(itemListController
                                .selectedFruitList[index].image),
                            title: Text(itemListController
                                .selectedFruitList[index].name),
                            subtitle: Text(
                                "${itemListController.selectedFruitList[index].price}\$"),
                            trailing: IconButton(
                              onPressed: () {
                                itemListController.addSelectedFood(
                                    itemListController
                                        .selectedItem(itemListController.selectedFruitList[index]));
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text("No Item Selected"),
                      ))),
          ],
        );
      },
    );
  }
}
