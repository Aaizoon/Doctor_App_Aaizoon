import 'api_base_helper.dart';
import 'movie_response.dart';

class MovieRepository {
  final String _apiKey = "78b9f63937763a206bff26c070b94158";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    //final response = await _helper.put("movie/popular?api_key=$_apiKey");
    // return MovieResponse.fromJson(response).results;
  }
}
