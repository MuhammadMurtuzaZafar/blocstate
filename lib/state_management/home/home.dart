import 'package:blocstate/core/widget/home_button.dart';
import 'package:blocstate/state_management/bloc/feature/bloc/fruit_bloc.dart';
import 'package:blocstate/state_management/getx/feature/item_list/controller/item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/feature/ui/item_list_bloc.dart';
import '../getx/feature/item_list/ui/item_list_screen.dart';
import '../riverpod/ui/item_list_rp.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "State Management Task",
        ),
      ),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButton(
              text: "GETX",
              icons: Icons.developer_mode,
              onPressed: () {
                Get.to(const ItemListScreen(), binding: BindingsBuilder(() {
                  Get.put(ItemListController());
                }));
              },
            ),
            HomeButton(
              text: "Bloc",
              icons: Icons.developer_mode,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return BlocProvider(
                    create: (BuildContext context) {
                      return FruitBloc();
                    },
                    child:  ItemListScreenBloc(),
                  );
                }));
              },
            ),
            HomeButton(
              text: "RiverPOD",
              icons: Icons.developer_mode,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (C){
                  return ItemListScreenRp();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

}