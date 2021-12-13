import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/services/distance.dart';
import 'package:steps_count/services/user_service.dart';
import 'package:steps_count/ui/dashboard/dashboard_view.dart';
import 'package:steps_count/ui/login/login_view.dart';
import 'package:steps_count/ui/newdashboard/newdashboard_view.dart';
import 'package:steps_count/ui/share/share_view.dart';
import 'package:steps_count/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: StartUpView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: DashboardView),
    CupertinoRoute(page: NewDashboardView, initial: true),
    CupertinoRoute(page: ShareView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DatabaseApi),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: UserService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
