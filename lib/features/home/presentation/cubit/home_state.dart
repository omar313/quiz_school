part of 'home_cubit.dart';

abstract class HomeState  {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeShowingInfoDialog extends HomeState{}
class HomeOpenLessonList extends HomeState{}
