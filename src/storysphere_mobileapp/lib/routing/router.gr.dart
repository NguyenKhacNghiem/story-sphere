// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:storysphere_mobileapp/views/homepage.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i7;
//import 'package:flutter/material.dart' as _i8;

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
    // HSStoryDescriptionPage.name: (routeData) {
    //   final pathParams = routeData.inheritedPathParams;
    //   final args = routeData.argsAs<HSStoryDescriptionPageArgs>(
    //       orElse: () => HSStoryDescriptionPageArgs(
    //           storyUrl: pathParams.getString('storyUrl')));
    //   return _i7.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: _i6.HSStoryDescriptionPage(
    //       key: args.key,
    //       storyUrl: args.storyUrl,
    //     ),
    //   );
    // },
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

// /// generated route for
// /// [_i6.HSStoryDescriptionPage]
// class HSStoryDescriptionPage
//     extends _i7.PageRouteInfo<HSStoryDescriptionPageArgs> {
//   HSStoryDescriptionPage({
//     _i8.Key? key,
//     required String storyUrl,
//     List<_i7.PageRouteInfo>? children,
//   }) : super(
//           HSStoryDescriptionPage.name,
//           args: HSStoryDescriptionPageArgs(
//             key: key,
//             storyUrl: storyUrl,
//           ),
//           rawPathParams: {'storyUrl': storyUrl},
//           initialChildren: children,
//         );

//   static const String name = 'HSStoryDescriptionPage';

//   static const _i7.PageInfo<HSStoryDescriptionPageArgs> page =
//       _i7.PageInfo<HSStoryDescriptionPageArgs>(name);
// }

// class HSStoryDescriptionPageArgs {
//   const HSStoryDescriptionPageArgs({
//     this.key,
//     required this.storyUrl,
//   });

//   final _i8.Key? key;

//   final String storyUrl;

//   @override
//   String toString() {
//     return 'HSStoryDescriptionPageArgs{key: $key, storyUrl: $storyUrl}';
//   }
// }
