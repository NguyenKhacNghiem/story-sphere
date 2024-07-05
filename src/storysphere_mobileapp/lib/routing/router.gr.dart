// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:storysphere_mobileapp/views/homepage/homepage.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:storysphere_mobileapp/views/storydetail/storydetail_page.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i7;

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
  const StoryDetailPageArgs({
    this.key,
    required this.storyId,
  });

  final _i2.Key? key;

  final int storyId;

  @override
  String toString() {
    return 'StoryDetailPageArgs{key: $key, story: $storyId}';
  }
}

