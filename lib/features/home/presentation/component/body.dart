import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:quiz_school/features/home/presentation/screen/home_dialog.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/lesson_list_bloc/lessonlist_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/pages/lesson_list_page.dart';

import '../../../../injection_container.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<HomeCubit, HomeState>(
      listener: (_, state) {
        if (state is HomeShowingInfoDialog) {
          Navigator.of(_).push(
            PageRouteBuilder(
                pageBuilder: (context, __, ____) => DialogHome(),
                opaque: false,
                barrierDismissible: true),
          );
        } else if (state is HomeOpenLessonList) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => di.get<LessonlistBloc>()..add(LessonRequestEvent()),
                  child: LessonListPage())));
        }
      },
      child: Column(
        children: [
          InfoButton(),
          TitleBox(),
          SizedBox(
            height: size.height * 0.2,
          ),
          RectangleShadowBtn(height: 50, text: kStart,  action: (){
            context.read<HomeCubit>().pressStartButton();
          },)
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              context.read<HomeCubit>().pressInfoButton();
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kAppBlueColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                )),
          ),
        )
      ],
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kBorderColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text('Title')),
      ),
    );
  }
}
