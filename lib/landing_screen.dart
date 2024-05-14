import 'package:beamer/beamer.dart';
import 'package:beamer_basic/main_screen_location.dart';
import 'package:beamer_basic/screens/about.dart';
import 'package:beamer_basic/screens/product.dart';
import 'package:beamer_basic/screens/products.dart';
import 'package:beamer_basic/screens/settings/account_settings.dart';
import 'package:beamer_basic/screens/dashboard.dart';
import 'package:beamer_basic/screens/notifications.dart';
import 'package:beamer_basic/screens/profile.dart';
import 'package:beamer_basic/screens/settings/profile_settings.dart';
import 'package:beamer_basic/screens/settings/settings.dart';
import 'package:beamer_basic/side_nav.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: SideNav(beamerKey: _beamerKey),
        ),
        Expanded(
            child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Beamer(
            key: _beamerKey,
            routerDelegate: BeamerDelegate(
              locationBuilder: RoutesLocationBuilder(
                routes: {
                  '*': (context, state, data) => const SizedBox(),
                  '/settings': (context, state, data) {
                    print(state.pathPatternSegments);
                    if (state.pathPatternSegments.contains('account')) {
                      return BeamPage(
                        key: ValueKey('AccountSettings - ${DateTime.now()}'),
                        type: BeamPageType.slideLeftTransition,
                        child: const AccountSettings(),
                      );
                    } else if (state.pathPatternSegments.contains('profile')) {
                      return BeamPage(
                        key: ValueKey('ProfileSettings - ${DateTime.now()}'),
                        type: BeamPageType.slideLeftTransition,
                        child: const ProfileSettings(),
                      );
                    }
                    return BeamPage(
                      key: ValueKey('Settings - ${DateTime.now()}'),
                      type: BeamPageType.scaleTransition,
                      child: const Settings(),
                    );
                  },
                  '/dashboard': (context, state, data) => const BeamPage(
                        key: ValueKey('Dashboard'),
                        type: BeamPageType.scaleTransition,
                        child: Dashboard(),
                      ),
                  '/profile': (context, state, data) => const BeamPage(
                        key: ValueKey('Profile'),
                        type: BeamPageType.scaleTransition,
                        child: Profile(),
                      ),
                  '/notification': (context, state, data) => const BeamPage(
                        key: ValueKey('Notification'),
                        type: BeamPageType.fadeTransition,
                        child: Notifications(),
                      ),
                  '/about': (context, state, data) => const BeamPage(
                        key: ValueKey('About'),
                        type: BeamPageType.scaleTransition,
                        child: About(),
                      ),
                  '/products': (context, state, data) => const BeamPage(
                        key: ValueKey('Products'),
                        type: BeamPageType.scaleTransition,
                        child: Products(),
                      ),
                  '/products/:product': (context, state, data) {
                    final String? product = state.pathParameters['product'];
                    print(product ?? "Nothing");
                    return /*BeamPage(
                      key: ValueKey('Product - $product'),
                      title: "$product",
                      type: BeamPageType.fadeTransition,*
                      child: */
                        Product(title: product ?? "");
                    // );
                  },
                },
              ).call,
              // locationBuilder: (routeInfo, data) {
              //   if (routeInfo.location.contains('dashboard')) {
              //     return DashboardLocation(routeInfo);
              //   }
              //   if (routeInfo.location.contains('settings')) {
              //     return SettingsLocation(routeInfo);
              //   }
              //   if (routeInfo.location.contains('notification')) {
              //     return NotificationsLocation(routeInfo);
              //   }
              //   if (routeInfo.location.contains('about')) {
              //     return AboutLocation(routeInfo);
              //   }
              //   return HomeLocation(routeInfo);
              // },
            ),
          ),
        ))
      ],
    );
  }
}
