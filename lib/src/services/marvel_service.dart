import 'package:dio/dio.dart';
import 'package:marvel/src/services/marvel_list_model.dart';

class MarvelService {
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<MarvelList>> getTodo() async {
    var response = await Dio().get(url);
    var data = response.data as List;
    var todos = data.map((e) => MarvelList(e['id'], e['userId'], e['title'], e['completed'])).toList();

    return todos;
  }
}