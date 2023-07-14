import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;

import '../../../entities/random_user.dart';
import '../../../locator.dart';
import '../../../use_cases/random_people_use_case.dart';
import '../page/home_page.dart';

class MyHomePageController extends State<MyHomePage> {
  static late MyHomePageController instance;
  late MyHomePage view;
  
  late Future<fpdart.Either<Failure, List<RandomPeopleEntites>>> listUserRandom;

  @override
  void initState() {
    final randomPeopleUseCases = getIt<RandomPeopleUseCase>();
    listUserRandom = randomPeopleUseCases(NoParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);  
}