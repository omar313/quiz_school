import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/home/presentation/component/rectengle_shadow_btn.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/words/words_cubit.dart';
import 'package:quiz_school/features/lessons/presentation/pages/quiz_page.dart';
import 'package:quiz_school/features/lessons/presentation/pages/words_list_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonListDetail extends StatelessWidget {
  final Lesson lesson;

  const LessonListDetail({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(lesson.videoUrl),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(lesson.lessonName),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RectangleShadowBtn(
                      text: kWord,
                      height: 40,
                      action: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                create: (context) => WordsCubit()
                                  ..wordRequest(lesson.id.toString()),
                                child: WordsListPage(
                                  title: lesson.lessonName,
                                ))));
                      },
                    ),
                    RectangleShadowBtn(
                      text: kQuiz,
                      height: 40,
                      action: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => QuizBloc()
                                          ..add(
                                              QuizEventDataRequest(lesson.id)),
                                      ),
                                      BlocProvider(
                                          lazy: false,
                                          create: (context) => WordsCubit()
                                            ..wordRequest(lesson.id.toString()))
                                    ],
                                    child: QuizPage(
                                      lesson: lesson,
                                    ))));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${this.lesson.lessonDiscription} ${this.lesson.lessonDiscription} ${this.lesson.lessonDiscription} ${this.lesson.lessonDiscription} ${this.lesson.lessonDiscription} ${this.lesson.lessonDiscription}',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
