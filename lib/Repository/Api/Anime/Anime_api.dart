import 'dart:convert';


import 'package:anime_api/Repository/Api/api_client.dart';
import 'package:anime_api/Repository/Model/Anime_model.dart';
import 'package:http/http.dart';



class AnimeApi {
  ApiClient apiClient = ApiClient();


  Future<AnimeModel> getAnime() async {
    String trendingpath = 'https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&genres=Fantasy%2CDrama&sortBy=ranking&sortOrde';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return AnimeModel.fromJson(jsonDecode(response.body));
  }
}