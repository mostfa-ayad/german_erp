import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/customer/domin/customer_repository.dart';
import 'package:german_erp/customer/domin/usecases/customer_delete_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_get_all_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_insert_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_update_usecase.dart';
import 'package:german_erp/auth/data/datasource/auth_datasource_impl.dart';
import 'package:german_erp/auth/data/repository/auth_repository_impl.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/auth/domin/usecases/signin_with_email_and_password_usecase.dart';
import 'package:german_erp/auth/domin/usecases/signout_usecase.dart';
import 'package:german_erp/auth/domin/usecases/signup_with_email_and_password_usecase.dart.dart';
import 'package:german_erp/auth/presentation/pages/cubit/auth_cubit.dart';
import 'package:german_erp/core/theme/app_theme.dart';
import 'package:german_erp/customer/data/customer_datasource_impl.dart';
import 'package:german_erp/customer/data/customer_repository_impl.dart';
import 'package:german_erp/customer/presentation/customer_cubit/customer_cubit.dart';
import 'package:german_erp/homepage.dart';
import 'package:german_erp/product/data/product_datasource_impl.dart';
import 'package:german_erp/product/data/product_repository_impl.dart';
import 'package:german_erp/product/domin/product_repository.dart';
import 'package:german_erp/product/domin/usecases/product_delete_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_get_all_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_insert_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_update_usecase.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository =
        AuthRepositoryImpl(datasource: AuthDatasourceImpl());
    ProductRepository productRepository =
        ProductRepositoryImpl(datasource: ProductDatasourceImpl());
    CustomerRepository customerRepository =
        CustomerRepositoryImpl(datasource: CustomerDatasourceImpl());
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
          create: (context) => ProductCubit(
              deleteUsecase:
                  ProductDeleteUsecase(repository: productRepository),
              getallUsecase:
                  ProductGetallUsecase(repository: productRepository),
              insertUsecase:
                  ProductInsertUsecase(repository: productRepository),
              updateUsecase:
                  ProductUpdateUsecase(repository: productRepository))
            ..loadList(),
        ),
        BlocProvider(
          create: (context) => CustomerCubit(
              getallUsecase:
                  CustomerGetallUsecase(repository: customerRepository),
              insertUsecase:
                  CustomerInsertUsecase(repository: customerRepository),
              updateUsecase:
                  CustomerUpdateUsecase(repository: customerRepository),
              deleteUsecase:
                  CustomerDeleteUsecase(repository: customerRepository))
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
        theme: AppTheme.light,
        home: const Homepage(),
      ),
    );
  }
}
