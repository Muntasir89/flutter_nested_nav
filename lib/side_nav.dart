import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class SideNav extends StatefulWidget {
  final GlobalKey<BeamerState> beamerKey;
  const SideNav({super.key, required this.beamerKey});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selected = -1;
  @override
  void initState() {
    super.initState();
  }

  List<String> navItems = [
    "Dashboard",
    "Settings",
    "Profile",
    "Notifications",
    "About",
    "Product",
  ];
  List<String> navs = [
    "/dashboard",
    "/settings",
    "/profile",
    "/notifications",
    "/about",
    "/products"
  ];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    if (path.contains('/dashboard')) {
      selected = 0;
    } else if (path.contains('/settings')) {
      selected = 1;
    } else if (path.contains('/profile')) {
      selected = 2;
    } else if (path.contains('/notifications')) {
      selected = 3;
    } else if (path.contains('/about')) {
      selected = 4;
    } else if (path.contains('/products')) {
      selected = 5;
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: navItems.map((navItem) {
          return AnimatedContainer(
            key: ValueKey(navItem),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: selected == navItems.indexOf(navItem)
                  ? Colors.grey[850]
                  : Colors.white,
            ),
            duration: const Duration(milliseconds: 375),
            width: 120.0,
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.beamerKey.currentState?.routerDelegate
                        .beamToNamed(navs[navItems.indexOf(navItem)]);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    navItem,
                    style: TextStyle(
                      color: selected == navItems.indexOf(navItem)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
