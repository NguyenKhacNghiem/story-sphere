import 'package:auto_route/auto_route.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because of the replaceInRouteName property
        AutoRoute(
          page: HSHomePage.page,
          initial: true,
          path: '/',
        ),
        CustomRoute(
          page: StoryDetailPage.page, 
          path: '/:story',
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: LibraryPage.page, 
          path: '/:library',
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: UserAccountPage.page, 
          path: '/:user',
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: MyWorksPage.page, 
          path: '/:myworks',
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          page: SearchingPage.page, 
          path: '/:searching',
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        
        // CustomRoute(page: HSSignInPage.page, path: '/login', transitionsBuilder: TransitionsBuilders.noTransition),
        // CustomRoute(page: WriterStoriesPage.page, path: '/stories', transitionsBuilder: TransitionsBuilders.noTransition),

      ];
}
