import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_week_five_projekt/data/api/api_characters.dart';
import 'package:neobis_week_five_projekt/data/api/api_characters_info.dart';
import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';

part 'get_characters_event.dart';
part 'get_characters_state.dart';

class GetCharactersBloc extends Bloc<GetCharacters, GetCharactersState> {
  GetCaractersRepository repository;

  GetCharactersBloc({
    required this.repository,
  }) : super(GetCharactersInitial()) {
    _setupHandlers();
  }

  void _setupHandlers() {
    on<GetMoreCharactersEvent>(_onGetMoreCharactersEvent);
    on<GetCharacterInfoEvent>(_onGetCharacterInfoEvent);
    on<GetCharactersEvent>(_onGetCharactersEvent);
  }

  void _onGetMoreCharactersEvent(
      GetMoreCharactersEvent event, Emitter<GetCharactersState> emit) async {
    try {
      final model = await repository.getMoreCharacters(event.counter);
      emit(
        GetCharactersSuccses(model: model),
      );
    } catch (e) {
      emit(
        GetCharactersError(
          errorText: e.toString(),
        ),
      );
    }
  }

  void _onGetCharactersEvent(
      GetCharactersEvent event, Emitter<GetCharactersState> emit) async {
    try {
      emit(
        GetCharactersLoading(),
      );
      final model = await repository.getCharacters(event.name ?? '');
      emit(
        GetCharactersSuccses(model: model),
      );
    } catch (e) {
      emit(
        GetCharactersError(
          errorText: e.toString(),
        ),
      );
    }
  }

  void _onGetCharacterInfoEvent(
      GetCharacterInfoEvent event, Emitter<GetCharactersState> emit) async {
    try {
      emit(GetCharactersLoading());
      final model = await repository.getCharactersInfo(event.url);
      emit(
        GetCharacterInfoSuccsess(model: model),
      );
    } catch (e) {
      emit(
        GetCharactersError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
