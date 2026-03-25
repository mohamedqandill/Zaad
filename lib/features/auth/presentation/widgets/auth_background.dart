import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/media_query_extension.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final dots = List<Offset>.generate(
      110,
      (i) {
        // Deterministic distribution per build so the layout doesn't flicker.
        final r = Random(42 + i);
        return Offset(r.nextDouble(), r.nextDouble());
      },
    );

    final screen = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Stack(
                children: [
                  for (final dot in dots)
                    Positioned(
                      left: dot.dx * screen.width,
                      top: dot.dy * screen.height * 0.62,
                      child: Container(
                        width: 2,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.45),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -context.h(4),
            child: SvgPicture.asset(
              AppAssets.zad,
              height: context.h(35),
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: child,
          ),
        ],
      ),
    );
  }
}

