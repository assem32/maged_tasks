import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magedsoft/business_logic/bloc_observer.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magedsoft/constants/page_const.dart';
import 'package:magedsoft/data/data_providers/local/cache_helper.dart';
import 'package:magedsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magedsoft/presentation/layout/home_layout.dart';
import 'package:magedsoft/presentation/router/app_router.dart';
import 'package:magedsoft/presentation/view/login.dart';
import 'package:magedsoft/presentation/view/help.dart';
import 'package:magedsoft/presentation/view/otp.dart';
import 'package:magedsoft/presentation/view/product_details.dart';
import 'package:magedsoft/presentation/widget/toast.dart';

import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';


late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {
      DioHelper.init();
      await CacheHelper.init();
      final locale =
          CacheHelper.getDataFromSharedPreference(key: 'language') ?? "en";
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Werash',
                    localizationsDelegates: [
                      GlobalCupertinoLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      delegate,
                    ],
                    locale: delegate.currentLocale,
                    supportedLocales: delegate.supportedLocales,
                    onGenerateRoute: widget.appRouter.onGenerateRoute,
                    initialRoute: login,
                    theme: ThemeData(

                      fontFamily: 'Inter',
                      //scaffoldBackgroundColor: AppColors.white,
                      appBarTheme: const AppBarTheme(
                        elevation: 0.0,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          //statusBarColor: AppColors.transparent,
                          statusBarIconBrightness: Brightness.dark,
                        ),
                      ),
                    ),
                    // home: LoginPage(),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}