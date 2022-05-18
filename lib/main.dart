import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:yts_app/application/allitems/bloc/allitems_bloc.dart';
import 'package:yts_app/application/movies/moviesdatas_bloc.dart';
import 'package:yts_app/application/search/search_bloc.dart';
import 'package:yts_app/domain/core/di/injectable.dart';
import 'presentation/widgets/custombottombar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MoviesdatasBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<SearchBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<AllitemsBloc>(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'yts Movies',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: const CustomBottomBar()));
  }
}
