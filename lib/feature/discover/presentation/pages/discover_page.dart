import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_desktop_page.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_mobile_page.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_tablet_page.dart';
import '../widgets/filter_button_widget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Responsive.isMobile(context)
          ? FilterButton(
              showFab: _showFab,
              duration: duration,
            )
          : null,
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(
              () {
                if (direction == ScrollDirection.reverse &&
                    notification.metrics.axis != Axis.horizontal) {
                  _showFab = false;
                } else if (direction == ScrollDirection.forward &&
                    notification.metrics.axis != Axis.horizontal) {
                  _showFab = true;
                } else {
                  _showFab = true;
                }
              },
            );
            return true;
          },
          child: const Responsive(
            desktop: DiscoverPageDesktop(),
            mobile: DisoverPageMobile(),
            tablet: DiscoverPageTablet(),
          ),
        ),
      ),
    );
  }
}
