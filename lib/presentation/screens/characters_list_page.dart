import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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

class _CharactersListPageState extends State<CharactersListPage> {
  TextEditingController searchByNameController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<GetCharactersBloc>(context).add(
      GetCharactersEvent(),
    );
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
              charactersBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<GetCharactersBloc, GetCharactersState> charactersBlocBuilder() {
    return BlocBuilder<GetCharactersBloc, GetCharactersState>(
      builder: (context, state) {
        if (state is GetCharactersLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.green,
              strokeWidth: 10,
            ),
          );
        } else if (state is GetCharactersSuccses) {
          return isGrid
              ? charactersGrid(context, state)
              : charactersList(state);
        } else if (state is GetCharactersError) {
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
                style:
                    AppFonts.s16w400.copyWith(color: AppColors.textFieldIcon),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Expanded charactersGrid(BuildContext context, GetCharactersSuccses state) {
    return Expanded(
      child: GridView.builder(
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

  Expanded charactersList(GetCharactersSuccses state) {
    return Expanded(
      child: ListView.builder(
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
              gender: state.model.results?[index].gender ?? '');
        },
      ),
    );
  }
}
