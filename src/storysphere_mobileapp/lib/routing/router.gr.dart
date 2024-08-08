// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;
import 'package:storysphere_mobileapp/content_pages/privacy.dart' as _i20;
import 'package:storysphere_mobileapp/models/category.dart' as _i32;
import 'package:storysphere_mobileapp/models/chapter.dart' as _i30;
import 'package:storysphere_mobileapp/models/story.dart' as _i29;
import 'package:storysphere_mobileapp/models/user.dart' as _i31;
import 'package:storysphere_mobileapp/views/account/account_page.dart' as _i26;
import 'package:storysphere_mobileapp/views/account/edit_account_page.dart'
    as _i8;
import 'package:storysphere_mobileapp/views/chapters/addcmt_page.dart' as _i2;
import 'package:storysphere_mobileapp/views/chapters/chapter_page.dart' as _i7;
import 'package:storysphere_mobileapp/views/forgot_password/forgot_password_page.dart'
    as _i15;
import 'package:storysphere_mobileapp/views/forgot_password/fp_otp_page.dart'
    as _i11;
import 'package:storysphere_mobileapp/views/forgot_password/fp_success_page.dart'
    as _i13;
import 'package:storysphere_mobileapp/views/forgot_password/fp_updatepass_page.dart'
    as _i12;
import 'package:storysphere_mobileapp/views/homepage/homepage.dart' as _i16;
import 'package:storysphere_mobileapp/views/library/library_page.dart' as _i17;
import 'package:storysphere_mobileapp/views/log_in/log_in_page.dart' as _i18;
import 'package:storysphere_mobileapp/views/mywork/add_chapter_page.dart'
    as _i1;
import 'package:storysphere_mobileapp/views/mywork/add_story_page.dart' as _i5;
import 'package:storysphere_mobileapp/views/mywork/edit_chapter_page.dart'
    as _i9;
import 'package:storysphere_mobileapp/views/mywork/edit_story_page.dart'
    as _i10;
import 'package:storysphere_mobileapp/views/mywork/myworks_page.dart' as _i19;
import 'package:storysphere_mobileapp/views/read_history/readinghistory_page.dart'
    as _i21;
import 'package:storysphere_mobileapp/views/searching/filter_bycat_page.dart'
    as _i14;
import 'package:storysphere_mobileapp/views/searching/search_results_page.dart'
    as _i23;
import 'package:storysphere_mobileapp/views/searching/searching_page.dart'
    as _i22;
import 'package:storysphere_mobileapp/views/sign_up/addfav_page.dart' as _i3;
import 'package:storysphere_mobileapp/views/sign_up/sign_up_page.dart' as _i24;
import 'package:storysphere_mobileapp/views/storydetail/addreview_page.dart'
    as _i4;
import 'package:storysphere_mobileapp/views/storydetail/chapterlist_page.dart'
    as _i6;
import 'package:storysphere_mobileapp/views/storydetail/storydetail_page.dart'
    as _i25;

abstract class $AppRouter extends _i27.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    AddChapterPage.name: (routeData) {
      final args = routeData.argsAs<AddChapterPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddChapterPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    AddCommentPage.name: (routeData) {
      final args = routeData.argsAs<AddCommentPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddCommentPage(
          key: args.key,
          chapterId: args.chapterId,
        ),
      );
    },
    AddFavCategory.name: (routeData) {
      final args = routeData.argsAs<AddFavCategoryArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddFavCategory(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    AddReviewPage.name: (routeData) {
      final args = routeData.argsAs<AddReviewPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddReviewPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    AddStoryPage.name: (routeData) {
      final args = routeData.argsAs<AddStoryPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AddStoryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ChapterListPage.name: (routeData) {
      final args = routeData.argsAs<ChapterListPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChapterListPage(
          key: args.key,
          chapters: args.chapters,
          story: args.story,
        ),
      );
    },
    ChapterPage.name: (routeData) {
      final args = routeData.argsAs<ChapterPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ChapterPage(
          key: args.key,
          chapter: args.chapter,
          storyName: args.storyName,
        ),
      );
    },
    EditAccountPage.name: (routeData) {
      final args = routeData.argsAs<EditAccountPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.EditAccountPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    EditChapterPage.name: (routeData) {
      final args = routeData.argsAs<EditChapterPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EditChapterPage(
          key: args.key,
          chapter: args.chapter,
        ),
      );
    },
    EditStoryPage.name: (routeData) {
      final args = routeData.argsAs<EditStoryPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.EditStoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    FPEnteringOTPPage.name: (routeData) {
      final args = routeData.argsAs<FPEnteringOTPPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.FPEnteringOTPPage(
          key: args.key,
          email: args.email,
          otpCode: args.otpCode,
          userId: args.userId,
          fromPageSU: args.fromPageSU,
          password: args.password,
          username: args.username,
        ),
      );
    },
    FPUpdatePassword.name: (routeData) {
      final args = routeData.argsAs<FPUpdatePasswordArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.FPUpdatePassword(
          key: args.key,
          email: args.email,
        ),
      );
    },
    FPUpdateSuccessPage.name: (routeData) {
      final args = routeData.argsAs<FPUpdateSuccessPageArgs>(
          orElse: () => const FPUpdateSuccessPageArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.FPUpdateSuccessPage(key: args.key),
      );
    },
    FilterByCategoryPage.name: (routeData) {
      final args = routeData.argsAs<FilterByCategoryPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.FilterByCategoryPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    ForgotPasswordPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ForgotPasswordPage(),
      );
    },
    HSHomePage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.HSHomePage(),
      );
    },
    LibraryPage.name: (routeData) {
      final args = routeData.argsAs<LibraryPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.LibraryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    LogInPage.name: (routeData) {
      final args =
          routeData.argsAs<LogInPageArgs>(orElse: () => const LogInPageArgs());
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.LogInPage(
          key: args.key,
          newAccount: args.newAccount,
        ),
      );
    },
    MyWorksPage.name: (routeData) {
      final args = routeData.argsAs<MyWorksPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.MyWorksPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    PrivacyPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.PrivacyPage(),
      );
    },
    ReadingHistoryPage.name: (routeData) {
      final args = routeData.argsAs<ReadingHistoryPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.ReadingHistoryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    SearchingPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      final args = routeData.argsAs<SearchingResultsPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SearchingResultsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SignUpPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SignUpPage(),
      );
    },
    StoryDetailPage.name: (routeData) {
      final args = routeData.argsAs<StoryDetailPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.StoryDetailPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    UserAccountPage.name: (routeData) {
      final args = routeData.argsAs<UserAccountPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.UserAccountPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddChapterPage]
class AddChapterPage extends _i27.PageRouteInfo<AddChapterPageArgs> {
  AddChapterPage({
    _i28.Key? key,
    required _i29.Story story,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddChapterPage.name,
          args: AddChapterPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'AddChapterPage';

  static const _i27.PageInfo<AddChapterPageArgs> page =
      _i27.PageInfo<AddChapterPageArgs>(name);
}

class AddChapterPageArgs {
  const AddChapterPageArgs({
    this.key,
    required this.story,
  });

  final _i28.Key? key;

  final _i29.Story story;

  @override
  String toString() {
    return 'AddChapterPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i2.AddCommentPage]
class AddCommentPage extends _i27.PageRouteInfo<AddCommentPageArgs> {
  AddCommentPage({
    _i28.Key? key,
    required int chapterId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddCommentPage.name,
          args: AddCommentPageArgs(
            key: key,
            chapterId: chapterId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCommentPage';

  static const _i27.PageInfo<AddCommentPageArgs> page =
      _i27.PageInfo<AddCommentPageArgs>(name);
}

class AddCommentPageArgs {
  const AddCommentPageArgs({
    this.key,
    required this.chapterId,
  });

  final _i28.Key? key;

  final int chapterId;

  @override
  String toString() {
    return 'AddCommentPageArgs{key: $key, chapterId: $chapterId}';
  }
}

/// generated route for
/// [_i3.AddFavCategory]
class AddFavCategory extends _i27.PageRouteInfo<AddFavCategoryArgs> {
  AddFavCategory({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddFavCategory.name,
          args: AddFavCategoryArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddFavCategory';

  static const _i27.PageInfo<AddFavCategoryArgs> page =
      _i27.PageInfo<AddFavCategoryArgs>(name);
}

class AddFavCategoryArgs {
  const AddFavCategoryArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'AddFavCategoryArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.AddReviewPage]
class AddReviewPage extends _i27.PageRouteInfo<AddReviewPageArgs> {
  AddReviewPage({
    _i28.Key? key,
    required _i29.Story story,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddReviewPage.name,
          args: AddReviewPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'AddReviewPage';

  static const _i27.PageInfo<AddReviewPageArgs> page =
      _i27.PageInfo<AddReviewPageArgs>(name);
}

class AddReviewPageArgs {
  const AddReviewPageArgs({
    this.key,
    required this.story,
  });

  final _i28.Key? key;

  final _i29.Story story;

  @override
  String toString() {
    return 'AddReviewPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i5.AddStoryPage]
class AddStoryPage extends _i27.PageRouteInfo<AddStoryPageArgs> {
  AddStoryPage({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddStoryPage.name,
          args: AddStoryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoryPage';

  static const _i27.PageInfo<AddStoryPageArgs> page =
      _i27.PageInfo<AddStoryPageArgs>(name);
}

class AddStoryPageArgs {
  const AddStoryPageArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'AddStoryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i6.ChapterListPage]
class ChapterListPage extends _i27.PageRouteInfo<ChapterListPageArgs> {
  ChapterListPage({
    _i28.Key? key,
    required List<_i30.Chapter> chapters,
    required _i29.Story story,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ChapterListPage.name,
          args: ChapterListPageArgs(
            key: key,
            chapters: chapters,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'ChapterListPage';

  static const _i27.PageInfo<ChapterListPageArgs> page =
      _i27.PageInfo<ChapterListPageArgs>(name);
}

class ChapterListPageArgs {
  const ChapterListPageArgs({
    this.key,
    required this.chapters,
    required this.story,
  });

  final _i28.Key? key;

  final List<_i30.Chapter> chapters;

  final _i29.Story story;

  @override
  String toString() {
    return 'ChapterListPageArgs{key: $key, chapters: $chapters, story: $story}';
  }
}

/// generated route for
/// [_i7.ChapterPage]
class ChapterPage extends _i27.PageRouteInfo<ChapterPageArgs> {
  ChapterPage({
    _i28.Key? key,
    required _i30.Chapter chapter,
    required String storyName,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ChapterPage.name,
          args: ChapterPageArgs(
            key: key,
            chapter: chapter,
            storyName: storyName,
          ),
          initialChildren: children,
        );

  static const String name = 'ChapterPage';

  static const _i27.PageInfo<ChapterPageArgs> page =
      _i27.PageInfo<ChapterPageArgs>(name);
}

class ChapterPageArgs {
  const ChapterPageArgs({
    this.key,
    required this.chapter,
    required this.storyName,
  });

  final _i28.Key? key;

  final _i30.Chapter chapter;

  final String storyName;

  @override
  String toString() {
    return 'ChapterPageArgs{key: $key, chapter: $chapter, storyName: $storyName}';
  }
}

/// generated route for
/// [_i8.EditAccountPage]
class EditAccountPage extends _i27.PageRouteInfo<EditAccountPageArgs> {
  EditAccountPage({
    _i28.Key? key,
    required _i31.User user,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EditAccountPage.name,
          args: EditAccountPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAccountPage';

  static const _i27.PageInfo<EditAccountPageArgs> page =
      _i27.PageInfo<EditAccountPageArgs>(name);
}

class EditAccountPageArgs {
  const EditAccountPageArgs({
    this.key,
    required this.user,
  });

  final _i28.Key? key;

  final _i31.User user;

  @override
  String toString() {
    return 'EditAccountPageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i9.EditChapterPage]
class EditChapterPage extends _i27.PageRouteInfo<EditChapterPageArgs> {
  EditChapterPage({
    _i28.Key? key,
    required _i30.Chapter chapter,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EditChapterPage.name,
          args: EditChapterPageArgs(
            key: key,
            chapter: chapter,
          ),
          initialChildren: children,
        );

  static const String name = 'EditChapterPage';

  static const _i27.PageInfo<EditChapterPageArgs> page =
      _i27.PageInfo<EditChapterPageArgs>(name);
}

class EditChapterPageArgs {
  const EditChapterPageArgs({
    this.key,
    required this.chapter,
  });

  final _i28.Key? key;

  final _i30.Chapter chapter;

  @override
  String toString() {
    return 'EditChapterPageArgs{key: $key, chapter: $chapter}';
  }
}

/// generated route for
/// [_i10.EditStoryPage]
class EditStoryPage extends _i27.PageRouteInfo<EditStoryPageArgs> {
  EditStoryPage({
    _i28.Key? key,
    required _i29.Story story,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EditStoryPage.name,
          args: EditStoryPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'EditStoryPage';

  static const _i27.PageInfo<EditStoryPageArgs> page =
      _i27.PageInfo<EditStoryPageArgs>(name);
}

class EditStoryPageArgs {
  const EditStoryPageArgs({
    this.key,
    required this.story,
  });

  final _i28.Key? key;

  final _i29.Story story;

  @override
  String toString() {
    return 'EditStoryPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i11.FPEnteringOTPPage]
class FPEnteringOTPPage extends _i27.PageRouteInfo<FPEnteringOTPPageArgs> {
  FPEnteringOTPPage({
    _i28.Key? key,
    required String email,
    required int otpCode,
    required int userId,
    required bool fromPageSU,
    String? password,
    String? username,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FPEnteringOTPPage.name,
          args: FPEnteringOTPPageArgs(
            key: key,
            email: email,
            otpCode: otpCode,
            userId: userId,
            fromPageSU: fromPageSU,
            password: password,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'FPEnteringOTPPage';

  static const _i27.PageInfo<FPEnteringOTPPageArgs> page =
      _i27.PageInfo<FPEnteringOTPPageArgs>(name);
}

class FPEnteringOTPPageArgs {
  const FPEnteringOTPPageArgs({
    this.key,
    required this.email,
    required this.otpCode,
    required this.userId,
    required this.fromPageSU,
    this.password,
    this.username,
  });

  final _i28.Key? key;

  final String email;

  final int otpCode;

  final int userId;

  final bool fromPageSU;

  final String? password;

  final String? username;

  @override
  String toString() {
    return 'FPEnteringOTPPageArgs{key: $key, email: $email, otpCode: $otpCode, userId: $userId, fromPageSU: $fromPageSU, password: $password, username: $username}';
  }
}

/// generated route for
/// [_i12.FPUpdatePassword]
class FPUpdatePassword extends _i27.PageRouteInfo<FPUpdatePasswordArgs> {
  FPUpdatePassword({
    _i28.Key? key,
    required String email,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FPUpdatePassword.name,
          args: FPUpdatePasswordArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'FPUpdatePassword';

  static const _i27.PageInfo<FPUpdatePasswordArgs> page =
      _i27.PageInfo<FPUpdatePasswordArgs>(name);
}

class FPUpdatePasswordArgs {
  const FPUpdatePasswordArgs({
    this.key,
    required this.email,
  });

  final _i28.Key? key;

  final String email;

  @override
  String toString() {
    return 'FPUpdatePasswordArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i13.FPUpdateSuccessPage]
class FPUpdateSuccessPage extends _i27.PageRouteInfo<FPUpdateSuccessPageArgs> {
  FPUpdateSuccessPage({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FPUpdateSuccessPage.name,
          args: FPUpdateSuccessPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FPUpdateSuccessPage';

  static const _i27.PageInfo<FPUpdateSuccessPageArgs> page =
      _i27.PageInfo<FPUpdateSuccessPageArgs>(name);
}

class FPUpdateSuccessPageArgs {
  const FPUpdateSuccessPageArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'FPUpdateSuccessPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.FilterByCategoryPage]
class FilterByCategoryPage
    extends _i27.PageRouteInfo<FilterByCategoryPageArgs> {
  FilterByCategoryPage({
    _i28.Key? key,
    required _i32.Category category,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FilterByCategoryPage.name,
          args: FilterByCategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterByCategoryPage';

  static const _i27.PageInfo<FilterByCategoryPageArgs> page =
      _i27.PageInfo<FilterByCategoryPageArgs>(name);
}

class FilterByCategoryPageArgs {
  const FilterByCategoryPageArgs({
    this.key,
    required this.category,
  });

  final _i28.Key? key;

  final _i32.Category category;

  @override
  String toString() {
    return 'FilterByCategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i15.ForgotPasswordPage]
class ForgotPasswordPage extends _i27.PageRouteInfo<void> {
  const ForgotPasswordPage({List<_i27.PageRouteInfo>? children})
      : super(
          ForgotPasswordPage.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i16.HSHomePage]
class HSHomePage extends _i27.PageRouteInfo<void> {
  const HSHomePage({List<_i27.PageRouteInfo>? children})
      : super(
          HSHomePage.name,
          initialChildren: children,
        );

  static const String name = 'HSHomePage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LibraryPage]
class LibraryPage extends _i27.PageRouteInfo<LibraryPageArgs> {
  LibraryPage({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          LibraryPage.name,
          args: LibraryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'LibraryPage';

  static const _i27.PageInfo<LibraryPageArgs> page =
      _i27.PageInfo<LibraryPageArgs>(name);
}

class LibraryPageArgs {
  const LibraryPageArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'LibraryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i18.LogInPage]
class LogInPage extends _i27.PageRouteInfo<LogInPageArgs> {
  LogInPage({
    _i28.Key? key,
    bool? newAccount,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          LogInPage.name,
          args: LogInPageArgs(
            key: key,
            newAccount: newAccount,
          ),
          initialChildren: children,
        );

  static const String name = 'LogInPage';

  static const _i27.PageInfo<LogInPageArgs> page =
      _i27.PageInfo<LogInPageArgs>(name);
}

class LogInPageArgs {
  const LogInPageArgs({
    this.key,
    this.newAccount,
  });

  final _i28.Key? key;

  final bool? newAccount;

  @override
  String toString() {
    return 'LogInPageArgs{key: $key, newAccount: $newAccount}';
  }
}

/// generated route for
/// [_i19.MyWorksPage]
class MyWorksPage extends _i27.PageRouteInfo<MyWorksPageArgs> {
  MyWorksPage({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MyWorksPage.name,
          args: MyWorksPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorksPage';

  static const _i27.PageInfo<MyWorksPageArgs> page =
      _i27.PageInfo<MyWorksPageArgs>(name);
}

class MyWorksPageArgs {
  const MyWorksPageArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'MyWorksPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i20.PrivacyPage]
class PrivacyPage extends _i27.PageRouteInfo<void> {
  const PrivacyPage({List<_i27.PageRouteInfo>? children})
      : super(
          PrivacyPage.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ReadingHistoryPage]
class ReadingHistoryPage extends _i27.PageRouteInfo<ReadingHistoryPageArgs> {
  ReadingHistoryPage({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ReadingHistoryPage.name,
          args: ReadingHistoryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadingHistoryPage';

  static const _i27.PageInfo<ReadingHistoryPageArgs> page =
      _i27.PageInfo<ReadingHistoryPageArgs>(name);
}

class ReadingHistoryPageArgs {
  const ReadingHistoryPageArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'ReadingHistoryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i22.SearchingPage]
class SearchingPage extends _i27.PageRouteInfo<void> {
  const SearchingPage({List<_i27.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SearchingResultsPage]
class SearchingResultsPage
    extends _i27.PageRouteInfo<SearchingResultsPageArgs> {
  SearchingResultsPage({
    _i28.Key? key,
    required String data,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SearchingResultsPage.name,
          args: SearchingResultsPageArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i27.PageInfo<SearchingResultsPageArgs> page =
      _i27.PageInfo<SearchingResultsPageArgs>(name);
}

class SearchingResultsPageArgs {
  const SearchingResultsPageArgs({
    this.key,
    required this.data,
  });

  final _i28.Key? key;

  final String data;

  @override
  String toString() {
    return 'SearchingResultsPageArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i24.SignUpPage]
class SignUpPage extends _i27.PageRouteInfo<void> {
  const SignUpPage({List<_i27.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i25.StoryDetailPage]
class StoryDetailPage extends _i27.PageRouteInfo<StoryDetailPageArgs> {
  StoryDetailPage({
    _i28.Key? key,
    required _i29.Story story,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          StoryDetailPage.name,
          args: StoryDetailPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryDetailPage';

  static const _i27.PageInfo<StoryDetailPageArgs> page =
      _i27.PageInfo<StoryDetailPageArgs>(name);
}

class StoryDetailPageArgs {
  const StoryDetailPageArgs({
    this.key,
    required this.story,
  });

  final _i28.Key? key;

  final _i29.Story story;

  @override
  String toString() {
    return 'StoryDetailPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i26.UserAccountPage]
class UserAccountPage extends _i27.PageRouteInfo<UserAccountPageArgs> {
  UserAccountPage({
    _i28.Key? key,
    required int userId,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          UserAccountPage.name,
          args: UserAccountPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'UserAccountPage';

  static const _i27.PageInfo<UserAccountPageArgs> page =
      _i27.PageInfo<UserAccountPageArgs>(name);
}

class UserAccountPageArgs {
  const UserAccountPageArgs({
    this.key,
    required this.userId,
  });

  final _i28.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserAccountPageArgs{key: $key, userId: $userId}';
  }
}
