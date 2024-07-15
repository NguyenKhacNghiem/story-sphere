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
        CustomRoute(
          page: SignInPage.page, 
          path: '/signin', 
          transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
          page: LogInPage.page, 
          path: '/login', 
          transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
          page: ForgotPasswordPage.page, 
          path: '/forgot-password', 
          transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
          page: AddStoryPage.page, 
          path: '/add-story', 
          transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
          page: AddChapterPage.page, 
          path: '/add-chapter', 
          transitionsBuilder: TransitionsBuilders.slideTop),
        
      ];
}
