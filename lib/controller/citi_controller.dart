import 'package:app_chat_fighting/repositories/citi_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import '../models/citi_model.dart';

class CitiController extends GetxController {
  RxBool showListView = true.obs;
  final _listCiti = <CitiModel>[].obs;
  List<CitiModel> get listCiti => _listCiti.toList();
  final CitiRepo _repo = CitiRepo();
  TextEditingController textController = TextEditingController();
  Future<void> fetchCiti(String location) async {
    try {
      final data = await _repo.fetchCiti(location);
      _listCiti.value = data.results;
    } catch (e) {
      // ignore: avoid_print
      print("$e");
    }
  }
}
