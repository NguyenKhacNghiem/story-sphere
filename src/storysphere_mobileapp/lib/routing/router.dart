import 'package:auto_route/auto_route.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

//to create new route: Add Route -> dart run build_runner build

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
          page: ChapterListPage.page, 
          path: '/chapter-list', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: ChapterPage.page, 
          path: '/chapter', 
          transitionsBuilder: TransitionsBuilders.noTransition),
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
          page: EditAccountPage.page, 
          path: '/edit-user',
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
          page: SignUpPage.page, 
          path: '/sign-up', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: LogInPage.page, 
          path: '/login', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: AddFavCategory.page, 
          path: '/add-fav', 
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
        CustomRoute(
          page: AddReviewPage.page, 
          path: '/add-review', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: AddCommentPage.page, 
          path: '/add-comment', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: SearchingResultsPage.page, 
          path: '/searching-result', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: FilterByCategoryPage.page, 
          path: '/category-filter', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: EditChapterPage.page, 
          path: '/edit-chapter', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: EditStoryPage.page, 
          path: '/edit-story', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: ReadingHistoryPage.page, 
          path: '/reading-history', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: FPEnteringOTPPage.page, 
          path: '/otp-entering', 
          transitionsBuilder: TransitionsBuilders.noTransition),
         CustomRoute(
          page: ForgotPasswordPage.page, 
          path: '/otp-entering', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: FPUpdatePassword.page, 
          path: '/update-password', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
          page: FPUpdateSuccessPage.page, 
          path: '/update-success', 
          transitionsBuilder: TransitionsBuilders.noTransition),
        
      ];
}
