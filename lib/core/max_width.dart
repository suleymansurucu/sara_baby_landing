import 'package:flutter/material.dart';

const kMaxContentWidth = 1100.0;
const kBreakpointTablet = 900.0;
const kBreakpointPhone  = 600.0;

bool isPhone(BuildContext c)  => MediaQuery.sizeOf(c).width < kBreakpointPhone;
bool isTablet(BuildContext c) => MediaQuery.sizeOf(c).width >= kBreakpointPhone && MediaQuery.sizeOf(c).width < kBreakpointTablet;

class MaxWidth extends StatelessWidget {
  final Widget child;
  const MaxWidth({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );
  }
}
