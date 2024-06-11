import 'package:anime_api/Repository/Api/Anime/Anime_api.dart';
import 'package:anime_api/Repository/Model/Anime_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late AnimeModel animeModel;
  AnimeApi animeApi = AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<FetchanimeEvent>((event, emit)async {
      emit(Animeblocloading());

      try {
        animeModel =await animeApi.getAnime();
        emit(Animeblocloaded());
      } catch (e) {
        print(e);
        emit(Animeblocerror());
      }


      


    });
  }
}
