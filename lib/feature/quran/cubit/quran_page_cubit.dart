// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quran_page_state.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit() : super(QuranPageInitial());

    void setPage(int page) {
    emit(QuranPageLoaded(currentPage: page));
  }

}
