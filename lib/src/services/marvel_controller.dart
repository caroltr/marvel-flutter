import 'package:flutter/cupertino.dart';
import 'package:marvel/src/services/marvel_list_model.dart';
import 'package:marvel/src/services/marvel_service.dart';

class MarvelController extends ChangeNotifier{
  final MarvelService service;

  MarvelController({
    required this.service,
  });

  Future<List<MarvelList>> getTodos() {
    return service.getTodo();
  }
}