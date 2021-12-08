import 'package:get_it/get_it.dart';
import 'package:quiz_school/core/network/api_util.dart';
import 'package:quiz_school/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_singleton.dart';
import 'package:quiz_school/features/lessons/domain/repository/lesson_repository.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_lessons.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_questions.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_words.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/lesson_list_bloc/lessonlist_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/quiz_bloc/quiz_bloc.dart';

import 'features/lessons/data/repository/lesson_repository.dart';

final di = GetIt.instance;

Future<void> init() async{

    // controller
    di.registerFactory<HomeCubit>(() => HomeCubit());
    di.registerFactory<QuizBloc>(() => QuizBloc(di()));
    di.registerFactory(() => LessonlistBloc(di()));

    //  use cases
    di.registerLazySingleton<GetLessons>(() => GetLessonsImpl(di()));
    di.registerLazySingleton<GetQuestions>(() => GetQuestionsImpl(di()));
    di.registerLazySingleton<GetWords>(() => GetWordsImpl(di()));
   
    //repository
    di.registerLazySingleton<LessonRepository>(() => LessonRepositoryImpl());


    // core

     di.registerSingleton(ApiUtil());
     di.registerLazySingleton<LessonsSingleton>(() => LessonsSingleton());
     

}