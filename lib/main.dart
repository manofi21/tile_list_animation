import 'package:animation_tile_list_practice/locator.dart';
import 'package:animation_tile_list_practice/repository/random_people_repository.dart';
import 'package:flutter/material.dart';

import 'entities/random_user.dart';
import 'tile_list_animation/model/animated_card_model.dart';
import 'tile_list_animation/tile_list_widget.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
                  animatedCardModel: AnimatedCardModel(
                    itemIndex: index,
                    userName: result[index].fullName,
                    scoreInCurrentDuration: ((50 - index) * 19).toString(),
                    userProfileUrl: result[index].urlImage,
                  ),
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
