import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/auth/data/datasource/auth_datasource_impl.dart';
import 'package:german_erp/auth/data/repository/auth_repository_impl.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/auth/domin/usecases/signin_with_email_and_password_usecase.dart';
import 'package:german_erp/auth/domin/usecases/signout_usecase.dart';
import 'package:german_erp/auth/domin/usecases/signup_with_email_and_password_usecase.dart.dart';
import 'package:german_erp/auth/presentation/pages/cubit/auth_cubit.dart';
import 'package:german_erp/homepage.dart';
import 'package:german_erp/product/data/product_datasource_impl.dart';
import 'package:german_erp/product/data/product_repository_impl.dart';
import 'package:german_erp/product/domin/usecases/product_get_all_usecase.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository =
        AuthRepositoryImpl(datasource: AuthDatasourceImpl());
    var font = GoogleFonts.notoKufiArabicTextTheme.call();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
              SigninWithEmailAndPasswordUsecase(repository: authRepository),
              SignupWithEmailAndPasswordUsecase(repository: authRepository),
              SignoutUsecase(repository: authRepository)),
        ),
        BlocProvider(
          create: (context) => ProductCubit(ProductGetallUsecase(
              repository:
                  ProductRepositoryImpl(datasource: ProductDatasourceImpl())))
            ..loadList(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'First Method',
        // You can use the library anywhere in the app even in theme
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: font.copyWith().apply(),
        ),
        home: const Homepage(),
      ),
    );
  }
}
