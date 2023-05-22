import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_modernvet/models/character_model.dart';

import 'package:test_modernvet/modules/mainScreen/mainScreen.dart';
import 'package:test_modernvet/utils/api_request_status.dart';

import '../../utils/function.dart';

class MainScreenController extends GetxController {

  final MainScreenService _service;

  var pageLoadStatus = APIRequestStatus.unInitialized.obs;
  var dataCharacter = character_model().obs;

  MainScreenController(this._service);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      pageLoadStatus.value = APIRequestStatus.loading;
      character_model? character = await _service.getAllCharacterData();
      debugPrint(character?.info?.count.toString());
      pageLoadStatus.value = APIRequestStatus.loaded;
      if(character!=null) {
        dataCharacter.value = character;
      } else {
        pageLoadStatus.value = Functions.checkErrorPopup("Data tidak ditemukan");
      }
    } catch (e) {
      pageLoadStatus.value = Functions.checkErrorPopup(e);
    }
  }

}