// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:storysphere_mobileapp/views/homepage/homepage.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:storysphere_mobileapp/views/account/account_page.dart' as _i3;
import 'package:storysphere_mobileapp/views/library/library_page.dart' as _i4;
import 'package:storysphere_mobileapp/views/searching/searching_page.dart' as _i5;
import 'package:storysphere_mobileapp/views/storydetail/storydetail_page.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:storysphere_mobileapp/views/mywork/myworks_page.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {

    HSHomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HSHomePage(),
      );
    },
    // HSSignInPage.name: (routeData) {
    //   return _i7.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: const _i4.HSSignInPage(),
    //   );
    // },
    // WriterStoriesPage.name: (routeData) {
    //   return _i7.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: const _i5.WriterStoriesPage(),
    //   );
    // },
    UserAccountPage.name: (routeData) {
    final pathParams = routeData.inheritedPathParams;
    final args = routeData.argsAs<UserAccountPageArgs>(
        orElse: () => UserAccountPageArgs(
            userId: pathParams.getInt('userId')));
    return _i7.AutoRoutePage<dynamic>(
      routeData: routeData,
      child: _i3.UserAccountPage(
        key: args.key,
        userId: args.userId,
      ),
    );
  },
  LibraryPage.name: (routeData) {
    final pathParams = routeData.inheritedPathParams;
    final args = routeData.argsAs<LibraryPageArgs>(
        orElse: () => LibraryPageArgs(
            userId: pathParams.getInt('userId')));
    return _i7.AutoRoutePage<dynamic>(
      routeData: routeData,
      child: _i4.LibraryPage(
        key: args.key,
        userId: args.userId,
      ),
    );
  },
  SearchingPage.name: (routeData) {
  return _i7.AutoRoutePage<dynamic>(
    routeData: routeData,
    child: const _i5.SearchingPage(),
  );
},
  StoryDetailPage.name: (routeData) {
    final pathParams = routeData.inheritedPathParams;
    final args = routeData.argsAs<StoryDetailPageArgs>(
        orElse: () => StoryDetailPageArgs(
            storyId: pathParams.getInt('storyId')));
    return _i7.AutoRoutePage<dynamic>(
      routeData: routeData,
      child: _i6.StoryDetailPage(
        key: args.key,
        storyId: args.storyId,
      ),
    );
  },
  MyWorksPage.name: (routeData) {
    final pathParams = routeData.inheritedPathParams;
    final args = routeData.argsAs<MyWorksPageArgs>(
        orElse: () => MyWorksPageArgs(
            userId: pathParams.getInt('userId')));
    return _i7.AutoRoutePage<dynamic>(
      routeData: routeData,
      child: _i8.MyWorksPage(
        key: args.key,
        userId: args.userId,
      ),
    );
  },
  };
}

/// generated route for
/// [_i1.PrivacyPage]
class PrivacyPage extends _i7.PageRouteInfo<void> {
  const PrivacyPage({List<_i7.PageRouteInfo>? children})
      : super(
          PrivacyPage.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}


/// generated route for
/// [_i1.HSHomePage]
class HSHomePage extends _i7.PageRouteInfo<void> {
  const HSHomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HSHomePage.name,
          initialChildren: children,
        );

  static const String name = 'HSHomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UserAccountPage]
class UserAccountPage
    extends _i7.PageRouteInfo<UserAccountPageArgs> {
  UserAccountPage({
    _i2.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          UserAccountPage.name,
          args: UserAccountPageArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'UserAccountPage';

  static const _i7.PageInfo<UserAccountPageArgs> page =
      _i7.PageInfo<UserAccountPageArgs>(name);
}

class UserAccountPageArgs {
  const UserAccountPageArgs({
    this.key,
    required this.userId,
  });

  final _i2.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserAccountPageArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.LibraryPage]
class LibraryPage
    extends _i7.PageRouteInfo<LibraryPageArgs> {
  LibraryPage({
    _i2.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LibraryPage.name,
          args: LibraryPageArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'LibraryPage';

  static const _i7.PageInfo<LibraryPageArgs> page =
      _i7.PageInfo<LibraryPageArgs>(name);
}

class LibraryPageArgs {
  const LibraryPageArgs({
    this.key,
    required this.userId,
  });

  final _i2.Key? key;

  final int userId;

  @override
  String toString() {
    return 'LibraryPageArgs{key: $key, userId: $userId}';
  }
}

// /// generated route for
// /// [_i4.HSSignInPage]
// class HSSignInPage extends _i7.PageRouteInfo<void> {
//   const HSSignInPage({List<_i7.PageRouteInfo>? children})
//       : super(
//           HSSignInPage.name,
//           initialChildren: children,
//         );

//   static const String name = 'HSSignInPage';

//   static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
// }

// /// generated route for
// /// [_i5.WriterStoriesPage]
// class WriterStoriesPage extends _i7.PageRouteInfo<void> {
//   const WriterStoriesPage({List<_i7.PageRouteInfo>? children})
//       : super(
//           WriterStoriesPage.name,
//           initialChildren: children,
//         );

//   static const String name = 'WriterStoriesPage';

//   static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
// }



/// generated route for
/// [_i5.SearchingPage]
class SearchingPage extends _i7.PageRouteInfo<void> {
  const SearchingPage({List<_i7.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}



/// generated route for
/// [_i6.StoryDetailPage]
class StoryDetailPage
    extends _i7.PageRouteInfo<StoryDetailPageArgs> {
  StoryDetailPage({
    _i2.Key? key,
    required int storyId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          StoryDetailPage.name,
          args: StoryDetailPageArgs(
            key: key,
            storyId: storyId,
          ),
          rawPathParams: {'storyId': storyId},
          initialChildren: children,
        );

  static const String name = 'StoryDetailPage';

  static const _i7.PageInfo<StoryDetailPageArgs> page =
      _i7.PageInfo<StoryDetailPageArgs>(name);
}

class StoryDetailPageArgs {
  const StoryDetailPageArgs({this.key,required this.storyId,});
  final _i2.Key? key;
  final int storyId;

  @override
  String toString() {
    return 'StoryDetailPageArgs{key: $key, story: $storyId}';
  }
}


/// generated route for
/// [_i8.MyWorksPage]
class MyWorksPage
    extends _i7.PageRouteInfo<MyWorksPageArgs> {
  MyWorksPage({
    _i2.Key? key,
    required int userId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          MyWorksPage.name,
          args: MyWorksPageArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'MyWorksPage';

  static const _i7.PageInfo<MyWorksPageArgs> page =
      _i7.PageInfo<MyWorksPageArgs>(name);
}

class MyWorksPageArgs {
  const MyWorksPageArgs({this.key, required this.userId,
  });
  final _i2.Key? key;
  final int userId;

  @override
  String toString() {
    return 'MyWorksPageArgs{key: $key, userId: $userId}';
  }
}


