import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../state_management/bloc/feature/bloc/fruit_bloc.dart';
import '../../state_management/getx/feature/item_list/controller/item_list_controller.dart';

class ItemCardBloc extends StatelessWidget {
  int index;
  ItemCardBloc(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<FruitBloc>(context, listen: true);
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
                image: AssetImage(bloc.fruitList[index]
                    .image), // Provide the path to your asset image
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            )),
            BlocBuilder<FruitBloc, FruitState>(
                bloc: bloc,
                builder: (context,  state) {
                  return Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        bloc.add(AddToCardEvent(bloc.fruitList[index]));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: state is FoodItemAddedState&&state.selectedFruitList.contains(bloc.fruitList[index])
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
                  );
                }),
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
                  "${bloc.fruitList[index].price}",
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
