import '../entities/random_user.dart';
import '../remote_data_source/random_people_remote_data_source.dart';

class RandomPeopleRepository {
  final RandomPeopleRemoteDataSource randomPeopleApiImpl;
  RandomPeopleRepository(this.randomPeopleApiImpl);

  Future<List<RandomPeopleEntites>> getListUserRandom() async {
    final getListUserRandom = await randomPeopleApiImpl.getListRandomUserApi();
    final getRandomPeopleList = <RandomPeopleEntites>[];
    for (var element in getListUserRandom) {
      final name = element.name;
      getRandomPeopleList.add(
        RandomPeopleEntites(
          "${name.title}.${name.first} ${name.last}",
          element.picture.medium,
        ),
      );
    }

    return getRandomPeopleList;
  }
}
