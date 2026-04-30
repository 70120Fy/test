import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;

  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.appBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar ??
          AppBar(
            title: title != null
                ? Text(
                    title!,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  )
                : null,
            actions: actions,
          ),
      body: child,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GoldAppScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const GoldAppScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: _GoldBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
      title: title,
      actions: actions,
      floatingActionButton: floatingActionButton,
    );
  }
}

class _GoldBackground extends StatelessWidget {
  final Widget child;

  const _GoldBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            const Color(0xFF1A1612),
            const Color(0xFF110F0D),
          ],
          center: Alignment.topCenter,
          radius: 1.0,
        ),
      ),
      child: child,
    );
  }
}
