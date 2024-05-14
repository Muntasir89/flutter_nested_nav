import 'package:beamer/beamer.dart';
import 'package:beamer_basic/landing_screen.dart';
import 'package:beamer_basic/screens/about.dart';
import 'package:beamer_basic/screens/dashboard.dart';
import 'package:beamer_basic/screens/notifications.dart';
import 'package:beamer_basic/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey("home-${DateTime.now()}"),
        child: LandingScreen(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}

class DashboardLocation extends BeamLocation<BeamState> {
  DashboardLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Dashboard'),
        child: Dashboard(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/dashboard'];
}

class SettingsLocation extends BeamLocation<BeamState> {
  SettingsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Settings'),
        child: Settings(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/settings'];
}

class NotificationsLocation extends BeamLocation<BeamState> {
  NotificationsLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Notification'),
        child: Notifications(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/notification'];
}

class AboutLocation extends BeamLocation<BeamState> {
  AboutLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('About'),
        child: About(),
        type: BeamPageType.fadeTransition,
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/about'];
}
