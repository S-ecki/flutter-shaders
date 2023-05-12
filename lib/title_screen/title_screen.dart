import 'package:flutter/material.dart';

import '../assets.dart';
import '../styles.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  final _finalReceiveLightAmount = 0.8;
  final _finalEmitLightAmount = 0.5;

  @override
  Widget build(BuildContext context) {
    final orbColor = AppColors.orbColors[0];
    final emitColor = AppColors.emitColors[0];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Image.asset(AssetPaths.titleBgBase),
            _LitImage(
              imgSrc: AssetPaths.titleBgReceive,
              color: orbColor,
              lightAmount: _finalReceiveLightAmount,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgBase,
              color: orbColor,
              lightAmount: _finalReceiveLightAmount,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgReceive,
              color: orbColor,
              lightAmount: _finalReceiveLightAmount,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgEmit,
              color: emitColor,
              lightAmount: _finalEmitLightAmount,
            ),
            Image.asset(AssetPaths.titleFgBase),
            _LitImage(
              imgSrc: AssetPaths.titleFgReceive,
              color: orbColor,
              lightAmount: _finalReceiveLightAmount,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleFgEmit,
              color: emitColor,
              lightAmount: _finalEmitLightAmount,
            ),
          ],
        ),
      ),
    );
  }
}

class _LitImage extends StatelessWidget {
  const _LitImage({
    required this.color,
    required this.imgSrc,
    required this.lightAmount,
  });
  final Color color;
  final String imgSrc;
  final double lightAmount;

  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        hsl.withLightness(hsl.lightness * lightAmount).toColor(),
        BlendMode.modulate,
      ),
      child: Image.asset(imgSrc),
    );
  }
}
