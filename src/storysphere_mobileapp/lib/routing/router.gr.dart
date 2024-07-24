// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:storysphere_mobileapp/content_pages/privacy.dart' as _i15;
import 'package:storysphere_mobileapp/models/category.dart' as _i25;
import 'package:storysphere_mobileapp/models/chapter.dart' as _i24;
import 'package:storysphere_mobileapp/models/story.dart' as _i23;
import 'package:storysphere_mobileapp/views/account/account_page.dart' as _i20;
import 'package:storysphere_mobileapp/views/chapters/chapter_page.dart' as _i6;
import 'package:storysphere_mobileapp/views/forgot_password/forgot_password_page.dart'
    as _i10;
import 'package:storysphere_mobileapp/views/functions/comments/addcmt_page.dart'
    as _i2;
import 'package:storysphere_mobileapp/views/homepage/homepage.dart' as _i11;
import 'package:storysphere_mobileapp/views/library/library_page.dart' as _i12;
import 'package:storysphere_mobileapp/views/log_in/log_in_page.dart' as _i13;
import 'package:storysphere_mobileapp/views/mywork/add_chapter_page.dart'
    as _i1;
import 'package:storysphere_mobileapp/views/mywork/add_story_page.dart' as _i4;
import 'package:storysphere_mobileapp/views/mywork/edit_chapter_page.dart'
    as _i7;
import 'package:storysphere_mobileapp/views/mywork/edit_story_page.dart' as _i8;
import 'package:storysphere_mobileapp/views/mywork/myworks_page.dart' as _i14;
import 'package:storysphere_mobileapp/views/searching/filter_bycat_page.dart'
    as _i9;
import 'package:storysphere_mobileapp/views/searching/search_results_page.dart'
    as _i17;
import 'package:storysphere_mobileapp/views/searching/searching_page.dart'
    as _i16;
import 'package:storysphere_mobileapp/views/sign_up/sign_up_page.dart' as _i18;
import 'package:storysphere_mobileapp/views/storydetail/addreview_page.dart'
    as _i3;
import 'package:storysphere_mobileapp/views/storydetail/chapterlist_page.dart'
    as _i5;
import 'package:storysphere_mobileapp/views/storydetail/storydetail_page.dart'
    as _i19;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    AddChapterPage.name: (routeData) {
      final args = routeData.argsAs<AddChapterPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddChapterPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    AddCommentPage.name: (routeData) {
      final args = routeData.argsAs<AddCommentPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddCommentPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    AddReviewPage.name: (routeData) {
      final args = routeData.argsAs<AddReviewPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddReviewPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    AddStoryPage.name: (routeData) {
      final args = routeData.argsAs<AddStoryPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddStoryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ChapterListPage.name: (routeData) {
      final args = routeData.argsAs<ChapterListPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChapterListPage(
          key: args.key,
          chapters: args.chapters,
          story: args.story,
        ),
      );
    },
    ChapterPage.name: (routeData) {
      final args = routeData.argsAs<ChapterPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChapterPage(
          key: args.key,
          chapter: args.chapter,
          storyName: args.storyName,
        ),
      );
    },
    EditChapterPage.name: (routeData) {
      final args = routeData.argsAs<EditChapterPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.EditChapterPage(
          key: args.key,
          chapter: args.chapter,
        ),
      );
    },
    EditStoryPage.name: (routeData) {
      final args = routeData.argsAs<EditStoryPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.EditStoryPage(
          key: args.key,
          story: args.story,
        ),
      );
    },
    FilterByCategoryPage.name: (routeData) {
      final args = routeData.argsAs<FilterByCategoryPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.FilterByCategoryPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    ForgotPasswordPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPasswordPage(),
      );
    },
    HSHomePage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HSHomePage(),
      );
    },
    LibraryPage.name: (routeData) {
      final args = routeData.argsAs<LibraryPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LibraryPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    LogInPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LogInPage(),
      );
    },
    MyWorksPage.name: (routeData) {
      final args = routeData.argsAs<MyWorksPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.MyWorksPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    PrivacyPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PrivacyPage(),
      );
    },
    SearchingPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      final args = routeData.argsAs<SearchingResultsPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.SearchingResultsPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SignUpPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SignUpPage(),
      );
    },
    StoryDetailPage.name: (routeData) {
      final args = routeData.argsAs<StoryDetailPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.StoryDetailPage(
          key: args.key,
          storyId: args.storyId,
        ),
      );
    },
    UserAccountPage.name: (routeData) {
      final args = routeData.argsAs<UserAccountPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.UserAccountPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddChapterPage]
class AddChapterPage extends _i21.PageRouteInfo<AddChapterPageArgs> {
  AddChapterPage({
    _i22.Key? key,
    required int storyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddChapterPage.name,
          args: AddChapterPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddChapterPage';

  static const _i21.PageInfo<AddChapterPageArgs> page =
      _i21.PageInfo<AddChapterPageArgs>(name);
}

class AddChapterPageArgs {
  const AddChapterPageArgs({
    this.key,
    required this.storyId,
  });

  final _i22.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'AddChapterPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i2.AddCommentPage]
class AddCommentPage extends _i21.PageRouteInfo<AddCommentPageArgs> {
  AddCommentPage({
    _i22.Key? key,
    required int storyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddCommentPage.name,
          args: AddCommentPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCommentPage';

  static const _i21.PageInfo<AddCommentPageArgs> page =
      _i21.PageInfo<AddCommentPageArgs>(name);
}

class AddCommentPageArgs {
  const AddCommentPageArgs({
    this.key,
    required this.storyId,
  });

  final _i22.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'AddCommentPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i3.AddReviewPage]
class AddReviewPage extends _i21.PageRouteInfo<AddReviewPageArgs> {
  AddReviewPage({
    _i22.Key? key,
    required _i23.Story story,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddReviewPage.name,
          args: AddReviewPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'AddReviewPage';

  static const _i21.PageInfo<AddReviewPageArgs> page =
      _i21.PageInfo<AddReviewPageArgs>(name);
}

class AddReviewPageArgs {
  const AddReviewPageArgs({
    this.key,
    required this.story,
  });

  final _i22.Key? key;

  final _i23.Story story;

  @override
  String toString() {
    return 'AddReviewPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i4.AddStoryPage]
class AddStoryPage extends _i21.PageRouteInfo<AddStoryPageArgs> {
  AddStoryPage({
    _i22.Key? key,
    required int userId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddStoryPage.name,
          args: AddStoryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoryPage';

  static const _i21.PageInfo<AddStoryPageArgs> page =
      _i21.PageInfo<AddStoryPageArgs>(name);
}

class AddStoryPageArgs {
  const AddStoryPageArgs({
    this.key,
    required this.userId,
  });

  final _i22.Key? key;

  final int userId;

  @override
  String toString() {
    return 'AddStoryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.ChapterListPage]
class ChapterListPage extends _i21.PageRouteInfo<ChapterListPageArgs> {
  ChapterListPage({
    _i22.Key? key,
    required List<_i24.Chapter> chapters,
    required _i23.Story story,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<ChapterListPageArgs> page =
      _i21.PageInfo<ChapterListPageArgs>(name);
}

class ChapterListPageArgs {
  const ChapterListPageArgs({
    this.key,
    required this.chapters,
    required this.story,
  });

  final _i22.Key? key;

  final List<_i24.Chapter> chapters;

  final _i23.Story story;

  @override
  String toString() {
    return 'ChapterListPageArgs{key: $key, chapters: $chapters, story: $story}';
  }
}

/// generated route for
/// [_i6.ChapterPage]
class ChapterPage extends _i21.PageRouteInfo<ChapterPageArgs> {
  ChapterPage({
    _i22.Key? key,
    required _i24.Chapter chapter,
    required String storyName,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<ChapterPageArgs> page =
      _i21.PageInfo<ChapterPageArgs>(name);
}

class ChapterPageArgs {
  const ChapterPageArgs({
    this.key,
    required this.chapter,
    required this.storyName,
  });

  final _i22.Key? key;

  final _i24.Chapter chapter;

  final String storyName;

  @override
  String toString() {
    return 'ChapterPageArgs{key: $key, chapter: $chapter, storyName: $storyName}';
  }
}

/// generated route for
/// [_i7.EditChapterPage]
class EditChapterPage extends _i21.PageRouteInfo<EditChapterPageArgs> {
  EditChapterPage({
    _i22.Key? key,
    required _i24.Chapter chapter,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EditChapterPage.name,
          args: EditChapterPageArgs(
            key: key,
            chapter: chapter,
          ),
          initialChildren: children,
        );

  static const String name = 'EditChapterPage';

  static const _i21.PageInfo<EditChapterPageArgs> page =
      _i21.PageInfo<EditChapterPageArgs>(name);
}

class EditChapterPageArgs {
  const EditChapterPageArgs({
    this.key,
    required this.chapter,
  });

  final _i22.Key? key;

  final _i24.Chapter chapter;

  @override
  String toString() {
    return 'EditChapterPageArgs{key: $key, chapter: $chapter}';
  }
}

/// generated route for
/// [_i8.EditStoryPage]
class EditStoryPage extends _i21.PageRouteInfo<EditStoryPageArgs> {
  EditStoryPage({
    _i22.Key? key,
    required _i23.Story story,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EditStoryPage.name,
          args: EditStoryPageArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'EditStoryPage';

  static const _i21.PageInfo<EditStoryPageArgs> page =
      _i21.PageInfo<EditStoryPageArgs>(name);
}

class EditStoryPageArgs {
  const EditStoryPageArgs({
    this.key,
    required this.story,
  });

  final _i22.Key? key;

  final _i23.Story story;

  @override
  String toString() {
    return 'EditStoryPageArgs{key: $key, story: $story}';
  }
}

/// generated route for
/// [_i9.FilterByCategoryPage]
class FilterByCategoryPage
    extends _i21.PageRouteInfo<FilterByCategoryPageArgs> {
  FilterByCategoryPage({
    _i22.Key? key,
    required _i25.Category category,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          FilterByCategoryPage.name,
          args: FilterByCategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterByCategoryPage';

  static const _i21.PageInfo<FilterByCategoryPageArgs> page =
      _i21.PageInfo<FilterByCategoryPageArgs>(name);
}

class FilterByCategoryPageArgs {
  const FilterByCategoryPageArgs({
    this.key,
    required this.category,
  });

  final _i22.Key? key;

  final _i25.Category category;

  @override
  String toString() {
    return 'FilterByCategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i10.ForgotPasswordPage]
class ForgotPasswordPage extends _i21.PageRouteInfo<void> {
  const ForgotPasswordPage({List<_i21.PageRouteInfo>? children})
      : super(
          ForgotPasswordPage.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HSHomePage]
class HSHomePage extends _i21.PageRouteInfo<void> {
  const HSHomePage({List<_i21.PageRouteInfo>? children})
      : super(
          HSHomePage.name,
          initialChildren: children,
        );

  static const String name = 'HSHomePage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LibraryPage]
class LibraryPage extends _i21.PageRouteInfo<LibraryPageArgs> {
  LibraryPage({
    _i22.Key? key,
    required int userId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          LibraryPage.name,
          args: LibraryPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'LibraryPage';

  static const _i21.PageInfo<LibraryPageArgs> page =
      _i21.PageInfo<LibraryPageArgs>(name);
}

class LibraryPageArgs {
  const LibraryPageArgs({
    this.key,
    required this.userId,
  });

  final _i22.Key? key;

  final int userId;

  @override
  String toString() {
    return 'LibraryPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i13.LogInPage]
class LogInPage extends _i21.PageRouteInfo<void> {
  const LogInPage({List<_i21.PageRouteInfo>? children})
      : super(
          LogInPage.name,
          initialChildren: children,
        );

  static const String name = 'LogInPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MyWorksPage]
class MyWorksPage extends _i21.PageRouteInfo<MyWorksPageArgs> {
  MyWorksPage({
    _i22.Key? key,
    required int userId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          MyWorksPage.name,
          args: MyWorksPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorksPage';

  static const _i21.PageInfo<MyWorksPageArgs> page =
      _i21.PageInfo<MyWorksPageArgs>(name);
}

class MyWorksPageArgs {
  const MyWorksPageArgs({
    this.key,
    required this.userId,
  });

  final _i22.Key? key;

  final int userId;

  @override
  String toString() {
    return 'MyWorksPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i15.PrivacyPage]
class PrivacyPage extends _i21.PageRouteInfo<void> {
  const PrivacyPage({List<_i21.PageRouteInfo>? children})
      : super(
          PrivacyPage.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SearchingPage]
class SearchingPage extends _i21.PageRouteInfo<void> {
  const SearchingPage({List<_i21.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SearchingResultsPage]
class SearchingResultsPage
    extends _i21.PageRouteInfo<SearchingResultsPageArgs> {
  SearchingResultsPage({
    _i22.Key? key,
    required String data,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          SearchingResultsPage.name,
          args: SearchingResultsPageArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i21.PageInfo<SearchingResultsPageArgs> page =
      _i21.PageInfo<SearchingResultsPageArgs>(name);
}

class SearchingResultsPageArgs {
  const SearchingResultsPageArgs({
    this.key,
    required this.data,
  });

  final _i22.Key? key;

  final String data;

  @override
  String toString() {
    return 'SearchingResultsPageArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i18.SignUpPage]
class SignUpPage extends _i21.PageRouteInfo<void> {
  const SignUpPage({List<_i21.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.StoryDetailPage]
class StoryDetailPage extends _i21.PageRouteInfo<StoryDetailPageArgs> {
  StoryDetailPage({
    _i22.Key? key,
    required int storyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          StoryDetailPage.name,
          args: StoryDetailPageArgs(
            key: key,
            storyId: storyId,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryDetailPage';

  static const _i21.PageInfo<StoryDetailPageArgs> page =
      _i21.PageInfo<StoryDetailPageArgs>(name);
}

class StoryDetailPageArgs {
  const StoryDetailPageArgs({
    this.key,
    required this.storyId,
  });

  final _i22.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'StoryDetailPageArgs{key: $key, storyId: $storyId}';
  }
}

/// generated route for
/// [_i20.UserAccountPage]
class UserAccountPage extends _i21.PageRouteInfo<UserAccountPageArgs> {
  UserAccountPage({
    _i22.Key? key,
    required int userId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          UserAccountPage.name,
          args: UserAccountPageArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'UserAccountPage';

  static const _i21.PageInfo<UserAccountPageArgs> page =
      _i21.PageInfo<UserAccountPageArgs>(name);
}

class UserAccountPageArgs {
  const UserAccountPageArgs({
    this.key,
    required this.userId,
  });

  final _i22.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserAccountPageArgs{key: $key, userId: $userId}';
  }
}
