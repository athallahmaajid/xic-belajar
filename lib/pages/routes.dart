import 'package:xic_roster/pages/choice_page/choice_page.dart';
import 'package:xic_roster/pages/detail_page/detail_page.dart';
import 'package:xic_roster/pages/home_page/home_page.dart';
import 'package:xic_roster/pages/splash_page/splash_page.dart';
import 'package:witt/witt.dart';
import 'package:xic_roster/pages/splash_page/splash_page_controller.dart';

class Routes {
  static const splashRoute = "/";
  static const choiceRoute = "/choice";
  static const homeRoute = "/home";
  static const detailRoute = "/detail";

  static List<WPage> routes() {
    return [
      WPage(
        path: splashRoute,
        builder: (context, args) => const SplashPage(),
        providerBuilder: (context, args) => [
          WProvider(
              service: (context) => SplashPageController(context: context))
        ],
      ),
      WPage(
        path: choiceRoute,
        builder: (context, args) => const ChoicePage(),
      ),
      WPage(
        path: homeRoute,
        builder: (context, args) => const HomePage(),
      ),
      WPage(
        path: detailRoute,
        builder: (context, args) => DetailPage(
          title: args["title"],
          subject: args["subject"],
          desc: args["desc"],
        ),
      ),
    ];
  }
}
