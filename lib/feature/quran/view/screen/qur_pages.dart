import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/quran/cubit/quran_page_cubit.dart';
import 'package:quran/feature/quran/model/ayat_sour.dart';

class QuranPageView extends StatefulWidget {
  final List<AyatSour> quranData;
  final int initialIndex;

  const QuranPageView(
      {super.key, required this.quranData, required this.initialIndex});

  @override
  State<QuranPageView> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends State<QuranPageView> {
  double fontSize = 26.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuranPageCubit()..setPage(widget.initialIndex),
      child: BlocBuilder<QuranPageCubit, QuranPageState>(
        builder: (context, state) {
          if (state is QuranPageLoaded) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: Color.fromARGB(255, 222, 184, 216),
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 222, 184, 216),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Column(
                    children: [
                      Text(' ${widget.quranData[state.currentPage].name}',
                          style: const TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 46, 17, 43))
                          // Theme.of(context).textTheme.titleLarge,
                          ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.list_outlined,
                              size: 23, color: Color.fromARGB(255, 46, 17, 43)),
                          const SizedBox(width: 3),
                          Text(
                            '${widget.quranData[state.currentPage].ayat}  عدد الايات .آية',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.7),
                                      fontSize: 18,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: PageView.builder(
                  controller: PageController(initialPage: state.currentPage),
                  itemCount: widget.quranData.length,
                  onPageChanged: (page) =>
                      context.read<QuranPageCubit>().setPage(page),
                  itemBuilder: (context, index) {
                    final surah = widget.quranData[index];
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 120, 20, 80),
                      child: Column(
                        children: [
                          Card(
                            elevation: 2,
                            shadowColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context).colorScheme.secondary,
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: -20,
                                    top: -20,
                                    child: Icon(
                                      Icons.star_rounded,
                                      size: 60,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  Positioned(
                                    right: -15,
                                    bottom: -15,
                                    child: Icon(
                                      Icons.star_rounded,
                                      size: 50,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary
                                          .withOpacity(0.15),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                        fontSize: fontSize + 4,
                                        height: 1.6,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary
                                                .withOpacity(0.3),
                                            offset: const Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Card(
                            elevation: 2,
                            shadowColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                surah.displayqoran,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: fontSize,
                                      height: 2.2,
                                    ),
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                floatingActionButton: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: 'decrease',
                        onPressed: () {
                          setState(() {
                            if (fontSize > 20) {
                              fontSize -= 2;
                            }
                          });
                        },
                        backgroundColor: const Color.fromARGB(255, 46, 17, 43)
                            .withOpacity(0.08),
                        focusColor: Color.fromARGB(255, 81, 9, 80),
                        child: const Icon(Icons.text_decrease_outlined,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      FloatingActionButton(
                        heroTag: 'increase',
                        onPressed: () {
                          setState(() {
                            if (fontSize < 30) {
                              fontSize += 2;
                            }
                          });
                        },
                        backgroundColor: const Color.fromARGB(255, 46, 17, 43)
                            .withOpacity(0.08),
                        focusColor: const Color.fromARGB(255, 81, 9, 80),
                        child: const Icon(Icons.text_increase,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
