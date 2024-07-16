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
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: LibraryPage.page, 
          path: '/:library',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: UserAccountPage.page, 
          path: '/:user',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: MyWorksPage.page, 
          path: '/:myworks',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SearchingPage.page, 
          path: '/:searching',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SignInPage.page, 
          path: '/signin', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: LogInPage.page, 
          path: '/login', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: ForgotPasswordPage.page, 
          path: '/forgot-password', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: AddStoryPage.page, 
          path: '/add-story', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: AddChapterPage.page, 
          path: '/add-chapter', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        
      ];
}
