part of 'quran_page_cubit.dart';

@immutable
sealed class QuranPageState {}

final class QuranPageInitial extends QuranPageState {}
final class QuranPageLoaded extends QuranPageState {
  final int currentPage;
  QuranPageLoaded({required this.currentPage});
}
