import 'dart:io';
import 'package:coffee_kst/app/app.dart';
import 'package:coffee_kst/app/screens/cart/presentation/bloc/bloc_cart/cart_bloc.dart';
import 'package:coffee_kst/app/screens/detail/presentation/bloc/detail_service/product_detail_bloc.dart';
import 'package:coffee_kst/app/screens/home/presentation/bloc/navigation_bottom/navigation_screen_cubit.dart';
import 'package:coffee_kst/app/screens/login/presentations/bloc/auth_phone/auth_phone_bloc.dart';
import 'package:coffee_kst/core/codegen_loader.g.dart';
import 'package:coffee_kst/init_database.dart';
import 'package:coffee_kst/injection_container.dart';
import 'package:coffee_kst/main_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  //register database Hive
  await mainDatabase();
  await Firebase.initializeApp();
  await di.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('vi', 'VN'),
      assetLoader: const CodegenLoader(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<NavigationScreenCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<AuthPhoneBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ProductDetaiServicelBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<CartServiceBloc>()..add(LoadCartEvent()),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}
