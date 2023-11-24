import 'package:flutter/material.dart';

class AnimatedCardContainer extends StatelessWidget {
  const AnimatedCardContainer({
    super.key,
    this.head,
    this.body,
    this.actions,
    this.padding = 0.0,
  });

  final Widget? head;
  final Widget? body;
  final Widget? actions;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelLarge!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (head != null) head as Widget,
              if (body != null) body as Widget,
              if (actions != null) actions as Widget
            ],
          ),
        ),
      ),
    );
  }
}