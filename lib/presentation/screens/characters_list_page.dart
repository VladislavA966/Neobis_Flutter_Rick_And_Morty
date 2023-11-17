import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_week_five_projekt/data/models/characters_list_model.dart';
import 'package:neobis_week_five_projekt/presentation/bloc/get_characters_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/characters_grid.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/characters_row.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/custom_text_field.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}
//На этом экране реализована и пагинация и поиск персонажей, но обе фичи не работают вместе(страшно представить, когда еще прилетят фильтры :D)
//Если работает пагинация, то при поиске запрос по имени идет, но экран не перерисовывается
//Если я убираю нормальную пагинацию, то поиск работает нормально, но при долистывании до конца списка, экран перерисовывается, а не добавляет элементы внизу.

class _CharactersListPageState extends State<CharactersListPage> {
  TextEditingController searchByNameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int counter = 1;
  List<Results> characters = [];

  @override
  void initState() {
    BlocProvider.of<GetCharactersBloc>(context).add(
      GetCharactersEvent(),
    );
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  BlocProvider.of<GetCharactersBloc>(context).add(
                    GetCharactersEvent(name: value),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<GetCharactersBloc, GetCharactersState>(
                    builder: (context, state) {
                      if (state is GetCharactersSuccses) {
                        return Text(
                          'Всего персонажей: ${state.model.info!.count}',
                          style: AppFonts.s10w500.copyWith(
                            color: AppColors.textFieldIcon,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    child: isGrid
                        ? SvgPicture.asset(AppImages.gridIcon)
                        : SvgPicture.asset(AppImages.listIcon),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<GetCharactersBloc, GetCharactersState>(
                listener: (context, state) {
                  // if (state is GetCharactersScroll) {
                  //   characters.addAll(
                  //     state.model.results ?? [],
                  //   );
                  // }
                  // setState(() {});
                },
                builder: (context, state) {
                  if (state is GetCharactersError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.errorOne,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          'Персонажа с таким именем\nне найден',
                          textAlign: TextAlign.center,
                          style: AppFonts.s16w400
                              .copyWith(color: AppColors.textFieldIcon),
                        ),
                      ],
                    );
                  } else if (state is GetCharactersSuccses) {
                    return isGrid
                        ? charactersGrid(context, characters, state)
                        : charactersList(characters, state);
                  }
                  return SizedBox(); //isGrid
                  //     ? charactersGrid(context, characters)
                  //     : charactersList(characters);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isEndOfList) {
      counter++;

      BlocProvider.of<GetCharactersBloc>(context).add(
        GetCharactersEvent(
          counter: counter,
          name: searchByNameController.text,
        ),
      );
    }
  }

  bool get _isEndOfList {
    return (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent);
  }

  Expanded charactersGrid(BuildContext context, List<Results> characters,
      GetCharactersSuccses state) {
    return Expanded(
      child: GridView.builder(
        key: const PageStorageKey(20),
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: state.model.results?.length ?? 0,
        itemBuilder: (context, index) {
          return CharactersGrid(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterInfoScreen(
                      url: state.model.results?[index].url ?? ''),
                ),
              );
            },
            image: state.model.results?[index].image ?? '',
            name: state.model.results?[index].name ?? '',
            status: state.model.results?[index].status ?? '',
            species: state.model.results?[index].species ?? '',
            gender: state.model.results?[index].gender ?? '',
          );
        },
      ),
    );
  }

  Expanded charactersList(
      List<Results> characters, GetCharactersSuccses state) {
    return Expanded(
      child: ListView.builder(
        key: const PageStorageKey(0),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: state.model.results?.length ?? 0,
        itemBuilder: (context, index) {
          return CharactersRow(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterInfoScreen(
                      url: state.model.results?[index].url ?? ''),
                ),
              );
            },
            image: state.model.results?[index].image ?? '',
            name: state.model.results?[index].name ?? '',
            status: state.model.results?[index].status ?? '',
            species: state.model.results?[index].species ?? '',
            gender: state.model.results?[index].gender ?? '',
          );
        },
      ),
    );
  }
}
