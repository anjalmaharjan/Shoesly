import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/enum/enum.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/feature/discover/presentation/cubit/discover_cubit.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_desktop_page.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_mobile_page.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_tablet_page.dart';
import '../../../../core/core.dart';
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

    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (BuildContext context, DiscoverState state) {
        return BlocConsumer<DiscoverCubit, DiscoverState>(
          listener: (context, state) {
            if (state.status == ApiRequestStates.loading) {
              showAdaptiveDialog(
                context: context,
                builder: (context) => Center(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(30),
                    color: AppColors.backgroundColor,
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              );
              Future.delayed(
                const Duration(seconds: 2),
                () => Navigator.pop(context),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Responsive.isMobile(context)
                  ? state.failureMessage.isNotEmpty
                      ? const SizedBox.shrink()
                      : BlocBuilder<DiscoverCubit, DiscoverState>(
                          builder: (context, state) {
                            return FilterButton(
                              showFab: _showFab,
                              duration: duration,
                              onPressed: () {
                                // BlocProvider.of<FilterCubit>(context).resetFilters();
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.productFilter,
                                  arguments: state.productModelList,
                                );
                              },
                            );
                          },
                        )
                  : null,
              body: SafeArea(
                  child: state.failureMessage.contains("No")
                      ? Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.signal_wifi_connected_no_internet_4,
                                color: AppColors.errorColor,
                                size: 100,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                state.failureMessage,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 30),
                              PrimaryButton(
                                onPressed: () => context
                                    .read<DiscoverCubit>()
                                    .fetchDiscoverProducts(),
                                text: "Try again",
                              )
                            ],
                          ),
                        )
                      : NotificationListener<UserScrollNotification>(
                          onNotification: (notification) {
                            final ScrollDirection direction =
                                notification.direction;
                            setState(
                              () {
                                if (direction == ScrollDirection.reverse &&
                                    notification.metrics.axis !=
                                        Axis.horizontal) {
                                  _showFab = false;
                                } else if (direction ==
                                        ScrollDirection.forward &&
                                    notification.metrics.axis !=
                                        Axis.horizontal) {
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
                        )),
            );
          },
        );
      },
    );
  }
}
