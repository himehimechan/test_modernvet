import 'package:test_modernvet/models/character_model.dart';

import '../../data/network/api.dart';

class MainScreenService {
  Future<character_model?> getAllCharacterData() async {
    try {
      var res = await Api.getAllCharacterData();
      character_model dataJson;
      dataJson = character_model.fromJson(res);
      // dataJson = List<Data>.from(res.map((model)=> DataUser.fromJson(model)));
      return dataJson;
    } catch (e) {
      return null;
    }
  }
}