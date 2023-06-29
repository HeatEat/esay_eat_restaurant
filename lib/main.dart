import 'package:easy_eat_restaurant/bloc/restaurant/restaurant_bloc.dart';
import 'package:easy_eat_restaurant/core/app_router.dart';
import 'package:easy_eat_restaurant/core/constatns.dart';
import 'package:easy_eat_restaurant/cubit/image_cubit.dart';
import 'package:easy_eat_restaurant/data/repository/easy_eat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc_observer.dart';
import 'core/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: zapisanie zmiennych do pamięci telefonu
  await dotenv.load(fileName: ".env");

  String supabaseBaseUrl = dotenv.env["SUPABASE_BASE_URL"] ?? "";
  String supabaseBaseKey = dotenv.env["SUPABASE_BASE_KEY"] ?? "";

  // This will help you observe your Bloc
  Bloc.observer = MyBlocObserver();

  await Supabase.initialize(
    url: supabaseBaseUrl,
    anonKey: supabaseBaseKey,
    debug: true,
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
      create: (_) => AuthenticationBloc(),
    ),
    BlocProvider<ImageCubit>(
      create: (_) => ImageCubit(),
    ),
    BlocProvider<RestaurantBloc>(
      create: (_) => RestaurantBloc(
          EasyEatRepositoryImpl(), BlocProvider.of<ImageCubit>(_))
        ..add(GetRestaurantDetailsEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: K.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('pl'), // Polish
      ],
    );
  }
}
