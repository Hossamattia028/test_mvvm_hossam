import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hossam_test_mvvm/features/presentation/views/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context,widget)  => MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (BuildContext? context, Widget? widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return Text("$errorDetails");
            };
            return widget!;
          },
          title: 'Test',
          home: const HomePage(),
        ),
    );
  }
}

