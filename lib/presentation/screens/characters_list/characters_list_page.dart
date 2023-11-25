import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_week_five_projekt/data/api/api_characters.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/characters_grid.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/characters_row.dart';
import 'package:neobis_week_five_projekt/presentation/common_widgets/custom_text_field.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/character_info_screen.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list/bloc/get_characters_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list/characters_list_widgets/characters_list_error.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/filters_screen.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final searchByNameController = TextEditingController();
  final _scrollController = ScrollController();
  int counter = 1;
  List<Results> characters = [];
  int currentPosition = 0;

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
              _buildSearchField(),
              const SizedBox(height: 24),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildCharactersList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return BlocListener<GetCharactersBloc, GetCharactersState>(
      listener: (context, state) {
        if (state is GetCharactersSuccses) {
          characters.clear();
          characters.addAll(
            state.model.results ?? [],
          );
        }
      },
      child: CustomTextField(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FiltersScreen()));
        },
        onChanged: (value) {
          BlocProvider.of<GetCharactersBloc>(context).add(
            GetCharactersEvent(name: value),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildCharactersList() {
    return BlocConsumer<GetCharactersBloc, GetCharactersState>(
      listener: (context, state) {
        if (state is GetCharactersSuccses) {
          characters.addAll(
            state.model.results ?? [],
          );
        }
      },
      builder: (context, state) {
        if (state is GetCharactersError) {
          return const ErrorStateWidget();
        } else if (state is GetCharactersSuccses) {
          return isGrid
              ? charactersGrid(context, characters, state)
              : charactersList(characters, state);
        }
        return const SizedBox();
      },
    );
  }

  void _onScroll() {
    if (_isEndOfList) {
      counter++;

      BlocProvider.of<GetCharactersBloc>(context).add(
        GetMoreCharactersEvent(
          counter: counter.toString(),
        ),
      );
    }
    currentPosition = _scrollController.position.pixels.toInt();
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
        itemCount: characters.length ?? 0,
        itemBuilder: (context, index) {
          return CharactersGrid(
            onTap: () {
              BlocProvider.of<GetCharactersBloc>(context).add(
                GetCharacterInfoEvent(url: characters[index].url ?? ''),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterInfoScreen(
                    url: characters[index].url ?? '',
                  ),
                ),
              );
            },
            image: characters[index].image ?? '',
            name: characters[index].name ?? '',
            status: characters[index].status ?? '',
            species: characters[index].species ?? '',
            gender: characters[index].gender ?? '',
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
        itemCount: characters.length ?? 0,
        itemBuilder: (context, index) {
          return CharactersRow(
            onTap: () {
              BlocProvider.of<GetCharactersBloc>(context).add(
                GetCharacterInfoEvent(
                  url: state.model.results?[index].url ?? '',
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterInfoScreen(
                    url: characters[index].url ?? '',
                  ),
                ),
              );
            },
            image: characters[index].image ?? '',
            name: characters[index].name ?? '',
            status: characters[index].status ?? '',
            species: characters[index].species ?? '',
            gender: characters[index].gender ?? '',
          );
        },
      ),
    );
  }
}
