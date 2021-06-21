import 'dart:developer';
import 'package:flutterappmovieslist/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataRequest {
  final url;
  DataRequest(this.url);
  Future<MoviesRootModel> requestData() async {
    //void success (MoviesRootModel movies)
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      log("response body $data");
      MoviesRootModel decodedData = MoviesRootModel.fromJson(jsonDecode(data));
//      success(decoding);
      return decodedData;
    } else {
      print(response.statusCode);
      return MoviesRootModel();
    }
  }
}
