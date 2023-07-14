import 'package:fpdart/fpdart.dart';

import '../entities/random_user.dart';
import '../repository/random_people_repository.dart';

abstract class Failure {
  String error();
}

class RandomPeopleFailure extends Failure {
  @override
  String error() {
    return err;
  }

  final String err;
  RandomPeopleFailure({required this.err});
}

class NoParams {}

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class RandomPeopleUseCase implements UseCase<List<RandomPeopleEntites>, NoParams> {
  final RandomPeopleRepository randomPeople;
  RandomPeopleUseCase(this.randomPeople);

  @override
  Future<Either<Failure, List<RandomPeopleEntites>>> call(NoParams params) async {
    try {
      final getListUser = await randomPeople.getListUserRandom();
      return Right(getListUser);
    } catch (e) {
      return Left(RandomPeopleFailure(err: e.toString()));
    }
  }
}