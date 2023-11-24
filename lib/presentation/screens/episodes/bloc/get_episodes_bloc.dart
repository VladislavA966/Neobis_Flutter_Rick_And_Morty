import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_week_five_projekt/data/api/api_episodes_detail.dart';

part 'get_episodes_event.dart';
part 'get_episodes_state.dart';

class GetEpisodesBloc extends Bloc<GetEpisodesEvent, GetEpisodesState> {
  GetEpisodesBloc() : super(GetEpisodesInitial()) {
    on<GetEpisodesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
