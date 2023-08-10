import 'package:blocstate/state_management/riverpod/model/fruit_mode_rp.dart';
import 'package:blocstate/state_management/riverpod/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCardRp extends StatelessWidget {
  FruitModel fruitModel;
  WidgetRef ref;
  ItemCardRp(this.fruitModel, this.ref,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 1,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20), // Adjust the radius for rounded corners
              image: DecorationImage(
                image: AssetImage(fruitModel
                    .image), // Provide the path to your asset image
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            )),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  //   bloc.add(AddToCardEvent(bloc.fruitList[index]));
                  ref.read(selectedItemProvider.notifier).addItem(fruitModel);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ref.watch(selectedItemProvider).contains(fruitModel)
                          ? Colors.red
                          : Colors.blue.withOpacity(.7),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(50)

                    // shape: BoxShape.circle
                    ),
                child: Text(
                  "${fruitModel.price}",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
