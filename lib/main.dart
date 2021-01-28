import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/model/user/Auth.dart';
import 'package:rosses_mobile_master/model/user/JWT.dart';
import 'package:rosses_mobile_master/route/ECHO.dart';
import 'package:rosses_mobile_master/route/MiddleWare.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/logger/Logger.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Jwt().check();
  // Auth();
  // Get.put<AuthController>(AuthController());
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // textDirection: TextDirection.ltr,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: Jwt.isAuthorized ? AppPages.INITIAL : AppPages.LOGIN,
      getPages: AppPages.routes,
      // showPerformanceOverlay: true,
      // routingCallback: (routing) => MiddleWare.observer(routing),
      navigatorObservers: [
        GetObserver(ECHO.observer),
        // GetObserver(MiddleWare.observer)

      ],
      theme: ThemeData(
        fontFamily: "Cuprum",
        primarySwatch: Colors.red,
      ),
      // home: AccountHomeView(),
    );
  }
}





