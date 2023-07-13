import 'package:flutter/material.dart';

import '../../entities/random_user.dart';
import '../../locator.dart';
import '../../repository/random_people_repository.dart';
import '../widget/tile_list_animation/tile_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<RandomPeopleEntites>> listUserRandom;

  @override
  void didChangeDependencies() {
    listUserRandom = getIt<RandomPeopleRepository>().getListUserRandom();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<RandomPeopleEntites>>(
        future: listUserRandom,
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

          if (snapshot.hasData) {
            final result = snapshot.data ?? [];
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
          }

          return const Center(child: Text("Not Data Found"));
        },
      ),
    );
  }
}
