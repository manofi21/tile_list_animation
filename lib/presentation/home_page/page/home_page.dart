import 'package:animation_tile_list_practice/presentation/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;

import '../../../entities/random_user.dart';
import '../../../use_cases/random_people_use_case.dart';
import '../../widget/tile_list_animation/tile_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  Widget build(BuildContext context, MyHomePageController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<fpdart.Either<Failure, List<RandomPeopleEntites>>>(
        future: controller.listUserRandom,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          }

          final snapshotData = snapshot.data;
          if (snapshot.hasData && snapshotData != null) {
            return snapshotData.fold<Widget>(
              (l) {
                return Text("Some Error : ${l.error()}");
              },
              (result) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16, top: 1),
                  cacheExtent: 1,
                  itemCount: result.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AnimatedCardCustom(
                      itemIndex: index,
                      userName: result[index].fullName,
                      scoreInCurrentDuration: ((50 - index) * 19).toString(),
                      userProfileUrl: result[index].urlImage,
                    );
                  },
                );
              },
            );
          }
          return const Center(child: Text("Not Data Found"));
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => MyHomePageController();
}
