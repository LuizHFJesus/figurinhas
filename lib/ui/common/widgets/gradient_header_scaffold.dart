import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticker_manager_wc22/common/utils/constants.dart';

class GradientHeaderScaffold extends StatefulWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget progressCard;
  final Widget body;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;

  final Widget? header;
  final Gradient? gradient;
  final double cardOverlapFraction;
  final double horizontalPadding;
  final double verticalPadding;
  final double cardTranslateY;

  const GradientHeaderScaffold({
    required this.title,
    required this.subtitle,
    required this.progressCard,
    required this.body,
    this.header,
    this.leading,
    this.actions,
    this.gradient,
    this.floatingActionButton,
    this.persistentFooterButtons,
    this.cardOverlapFraction = 0.5,
    this.horizontalPadding = 24,
    this.verticalPadding = 20,
    this.cardTranslateY = -16,
    super.key,
  });

  @override
  State<GradientHeaderScaffold> createState() => _GradientHeaderScaffoldState();
}

class _GradientHeaderScaffoldState extends State<GradientHeaderScaffold> {
  final GlobalKey<State<StatefulWidget>> _headerKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> _cardKey = GlobalKey();

  double _headerH = 0;
  double _cardH = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didUpdateWidget(covariant GradientHeaderScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final gradient = widget.gradient ?? AppConstants.brandGradient;
    final gradientHeight = _headerH + (_cardH * widget.cardOverlapFraction);

    final colorScheme = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButton: widget.floatingActionButton,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: gradientHeight > 0 ? gradientHeight : 197,
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
            Column(
              children: [
                Padding(
                  key: _headerKey,
                  padding: EdgeInsets.only(
                    top: topInset + widget.verticalPadding,
                    left: widget.horizontalPadding,
                    right: widget.horizontalPadding,
                    bottom: widget.verticalPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.leading != null) widget.leading!,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.title,
                          if (widget.subtitle != null) ...[
                            const SizedBox(height: 4),
                            widget.subtitle!,
                          ],
                        ],
                      ),
                      const Spacer(),
                      if (widget.actions != null) ...widget.actions!,
                    ],
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, widget.cardTranslateY),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalPadding,
                    ),
                    child: KeyedSubtree(
                      key: _cardKey,
                      child: widget.progressCard,
                    ),
                  ),
                ),

                if (widget.header != null)
                  ColoredBox(
                    color: colorScheme.surface,
                    child: widget.header,
                  ),

                Expanded(
                  child: ColoredBox(
                    color: colorScheme.surface,
                    child: widget.body,
                  ),
                ),
              ],
            ),
          ],
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: widget.persistentFooterButtons,
      ),
    );
  }

  void _measure() {
    final headerBox =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    final cardBox = _cardKey.currentContext?.findRenderObject() as RenderBox?;

    final newHeaderH = headerBox?.size.height ?? 0;
    final newCardH = cardBox?.size.height ?? 0;

    if (newHeaderH != _headerH || newCardH != _cardH) {
      setState(() {
        _headerH = newHeaderH;
        _cardH = newCardH;
      });
    }
  }
}
