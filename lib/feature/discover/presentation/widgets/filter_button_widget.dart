import 'package:flutter/widgets.dart';
import 'package:shoesly/core/routes.dart';

import '../../../../core/widgets/primary_button_widget.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required bool showFab,
    required this.duration,
  }) : _showFab = showFab;

  final bool _showFab;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _showFab ? Offset.zero : const Offset(0, 2),
      duration: duration,
      child: AnimatedOpacity(
        duration: duration,
        opacity: _showFab ? 1 : 0,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 130),
          child: PrimaryButton(
            text: "filter",
            iconRequired: true,
            onPressed: () async {
              Navigator.pushNamed(context, AppRoutes.productFilter);
              // await FirebaseDatabaseService().getRequests();
            },
          ),
        ),
      ),
    );
  }
}
