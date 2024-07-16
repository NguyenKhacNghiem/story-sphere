// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:storysphere_mobileapp/content_pages/privacy.dart' as _i10;
import 'package:storysphere_mobileapp/views/account/account_page.dart' as _i15;
import 'package:storysphere_mobileapp/views/forgot_password_page.dart' as _i5;
import 'package:storysphere_mobileapp/views/functions/comments/addcmt_page.dart'
    as _i2;
import 'package:storysphere_mobileapp/views/functions/reviews/addreview_page.dart'
    as _i3;
import 'package:storysphere_mobileapp/views/homepage/homepage.dart' as _i6;
import 'package:storysphere_mobileapp/views/library/library_page.dart' as _i7;
import 'package:storysphere_mobileapp/views/log_in_page.dart' as _i8;
import 'package:storysphere_mobileapp/views/mywork/add_chapter_page.dart'
    as _i1;
import 'package:storysphere_mobileapp/views/mywork/add_story_page.dart' as _i4;
import 'package:storysphere_mobileapp/views/mywork/myworks_page.dart' as _i9;
import 'package:storysphere_mobileapp/views/searching/search_results_page.dart'
    as _i12;
import 'package:storysphere_mobileapp/views/searching/searching_page.dart'
    as _i11;
import 'package:storysphere_mobileapp/views/sign_in_page.dart' as _i13;
import 'package:storysphere_mobileapp/views/storydetail/storydetail_page.dart'
    as _i14;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AddChapterPage.name: (routeData) {
      final args = routeData.argsAs<AddChapterPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddChapterPage(
          key: args.key,
          userId: args.userId,
          storyId: args.storyId,
        ),
      );
    },
    AddCommentPage.name: (routeData) {
      final args = routeData.argsAs<AddCommentPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddCommentPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    AddReviewPage.name: (routeData) {
      final args = routeData.argsAs<AddReviewPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddReviewPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    AddStoryPage.name: (routeData) {
      final args = routeData.argsAs<AddStoryPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddStoryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ForgotPasswordPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordPage(),
      );
    },
    HSHomePage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HSHomePage(),
      );
    },
    LibraryPage.name: (routeData) {
      final args = routeData.argsAs<LibraryPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LibraryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    LogInPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LogInPage(),
      );
    },
    MyWorksPage.name: (routeData) {
      final args = routeData.argsAs<MyWorksPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MyWorksPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    PrivacyPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PrivacyPage(),
      );
    },
    SearchingPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      final args = routeData.argsAs<SearchingResultsPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.SearchingResultsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SignInPage.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignInPage(),
      );
    },
    StoryDetailPage.name: (routeData) {
      final args = routeData.argsAs<StoryDetailPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.StoryDetailPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    UserAccountPage.name: (routeData) {
      final args = routeData.argsAs<UserAccountPageArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.UserAccountPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddChapterPage]
class AddChapterPage extends _i16.PageRouteInfo<AddChapterPageArgs> {
  AddChapterPage({
    _i17.Key? key,
    required int userId,
    required int storyId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AddChapterPage.name,
          args: AddChapterPageArgs(
            key: key,
            userId: userId,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddChapterPage';

  static const _i16.PageInfo<AddChapterPageArgs> page =
      _i16.PageInfo<AddChapterPageArgs>(name);
}

class AddChapterPageArgs {
  const AddChapterPageArgs({
    this.key,
    required this.userId,
    required this.storyId,
  });

  final _i17.Key? key;

  final int userId;

  final int storyId;

  @override
  String toString() {
    return 'AddChapterPageArgs{key: $key, userId: $userId, storyId: $storyId}';
  }
}

/// generated route for
/// [_i2.AddCommentPage]
class AddCommentPage extends _i16.PageRouteInfo<AddCommentPageArgs> {
  AddCommentPage({
    _i17.Key? key,
    required int storyId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AddCommentPage.name,
          args: AddCommentPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCommentPage';

  static const _i16.PageInfo<AddCommentPageArgs> page =
      _i16.PageInfo<AddCommentPageArgs>(name);
}

class AddCommentPageArgs {
  const AddCommentPageArgs({
    this.key,
    required this.storyId,
  });

  final _i17.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'AddCommentPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i3.AddReviewPage]
class AddReviewPage extends _i16.PageRouteInfo<AddReviewPageArgs> {
  AddReviewPage({
    _i17.Key? key,
    required int storyId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AddReviewPage.name,
          args: AddReviewPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddReviewPage';

  static const _i16.PageInfo<AddReviewPageArgs> page =
      _i16.PageInfo<AddReviewPageArgs>(name);
}

class AddReviewPageArgs {
  const AddReviewPageArgs({
    this.key,
    required this.storyId,
  });

  final _i17.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'AddReviewPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i4.AddStoryPage]
class AddStoryPage extends _i16.PageRouteInfo<AddStoryPageArgs> {
  AddStoryPage({
    _i17.Key? key,
    required int userId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AddStoryPage.name,
          args: AddStoryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoryPage';

  static const _i16.PageInfo<AddStoryPageArgs> page =
      _i16.PageInfo<AddStoryPageArgs>(name);
}

class AddStoryPageArgs {
  const AddStoryPageArgs({
    this.key,
    required this.userId,
  });

  final _i17.Key? key;

  final int userId;

  @override
  String toString() {
    return 'AddStoryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordPage extends _i16.PageRouteInfo<void> {
  const ForgotPasswordPage({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPasswordPage.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HSHomePage]
class HSHomePage extends _i16.PageRouteInfo<void> {
  const HSHomePage({List<_i16.PageRouteInfo>? children})
      : super(
          HSHomePage.name,
          initialChildren: children,
        );

  static const String name = 'HSHomePage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LibraryPage]
class LibraryPage extends _i16.PageRouteInfo<LibraryPageArgs> {
  LibraryPage({
    _i17.Key? key,
    required int userId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          LibraryPage.name,
          args: LibraryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'LibraryPage';

  static const _i16.PageInfo<LibraryPageArgs> page =
      _i16.PageInfo<LibraryPageArgs>(name);
}

class LibraryPageArgs {
  const LibraryPageArgs({
    this.key,
    required this.userId,
  });

  final _i17.Key? key;

  final int userId;

  @override
  String toString() {
    return 'LibraryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i8.LogInPage]
class LogInPage extends _i16.PageRouteInfo<void> {
  const LogInPage({List<_i16.PageRouteInfo>? children})
      : super(
          LogInPage.name,
          initialChildren: children,
        );

  static const String name = 'LogInPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyWorksPage]
class MyWorksPage extends _i16.PageRouteInfo<MyWorksPageArgs> {
  MyWorksPage({
    _i17.Key? key,
    required int userId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          MyWorksPage.name,
          args: MyWorksPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorksPage';

  static const _i16.PageInfo<MyWorksPageArgs> page =
      _i16.PageInfo<MyWorksPageArgs>(name);
}

class MyWorksPageArgs {
  const MyWorksPageArgs({
    this.key,
    required this.userId,
  });

  final _i17.Key? key;

  final int userId;

  @override
  String toString() {
    return 'MyWorksPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i10.PrivacyPage]
class PrivacyPage extends _i16.PageRouteInfo<void> {
  const PrivacyPage({List<_i16.PageRouteInfo>? children})
      : super(
          PrivacyPage.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchingPage]
class SearchingPage extends _i16.PageRouteInfo<void> {
  const SearchingPage({List<_i16.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SearchingResultsPage]
class SearchingResultsPage
    extends _i16.PageRouteInfo<SearchingResultsPageArgs> {
  SearchingResultsPage({
    _i17.Key? key,
    required String data,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SearchingResultsPage.name,
          args: SearchingResultsPageArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i16.PageInfo<SearchingResultsPageArgs> page =
      _i16.PageInfo<SearchingResultsPageArgs>(name);
}

class SearchingResultsPageArgs {
  const SearchingResultsPageArgs({
    this.key,
    required this.data,
  });

  final _i17.Key? key;

  final String data;

  @override
  String toString() {
    return 'SearchingResultsPageArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i13.SignInPage]
class SignInPage extends _i16.PageRouteInfo<void> {
  const SignInPage({List<_i16.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.StoryDetailPage]
class StoryDetailPage extends _i16.PageRouteInfo<StoryDetailPageArgs> {
  StoryDetailPage({
    _i17.Key? key,
    required int storyId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          StoryDetailPage.name,
          args: StoryDetailPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryDetailPage';

  static const _i16.PageInfo<StoryDetailPageArgs> page =
      _i16.PageInfo<StoryDetailPageArgs>(name);
}

class StoryDetailPageArgs {
  const StoryDetailPageArgs({
    this.key,
    required this.storyId,
  });

  final _i17.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'StoryDetailPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i15.UserAccountPage]
class UserAccountPage extends _i16.PageRouteInfo<UserAccountPageArgs> {
  UserAccountPage({
    _i17.Key? key,
    required int userId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          UserAccountPage.name,
          args: UserAccountPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'UserAccountPage';

  static const _i16.PageInfo<UserAccountPageArgs> page =
      _i16.PageInfo<UserAccountPageArgs>(name);
}

class UserAccountPageArgs {
  const UserAccountPageArgs({
    this.key,
    required this.userId,
  });

  final _i17.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserAccountPageArgs{key: $key, userId: $userId}';
  }
}
