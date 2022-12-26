import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';
import 'package:travel_app/widgets/app_text_large.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is LoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.mainColor));
          } else if (state is LoadedState) {
            return const MainPage();
          } else if (state is DetailState) {
            return const DetailPage();
          } else if (state is ErrorState) {
            return Center(child: AppTextLarge(text: state.message));
          } else {
            return const Center(child: AppTextLarge(text: 'BLoC Failed'));
          }
        },
      ),
    );
  }
}
