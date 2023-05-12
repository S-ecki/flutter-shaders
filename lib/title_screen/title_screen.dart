import 'package:flutter/material.dart';

import 'package:next_gen_ui/assets.dart';
import 'package:next_gen_ui/styles.dart';
import 'package:next_gen_ui/title_screen/title_screen_ui.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  Color get _emitColor =>
      AppColors.emitColors[_difficultyOverride ?? _difficulty];
  Color get _orbColor =>
      AppColors.orbColors[_difficultyOverride ?? _difficulty];

  int _difficulty = 0;

  int? _difficultyOverride;

  void _handleDifficultyPressed(int value) {
    setState(() => _difficulty = value);
  }

  void _handleDifficultyFocused(int? value) {
    setState(() => _difficultyOverride = value);
  }

  final _finalReceiveLightAmt = 0.7;
  final _finalEmitLightAmt = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Image.asset(AssetPaths.titleBgBase),
            _LitImage(
              color: _orbColor,
              imgSrc: AssetPaths.titleBgReceive,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgBase,
              color: _orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgReceive,
              color: _orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgEmit,
              color: _emitColor,
              lightAmt: _finalEmitLightAmt,
            ),
            Image.asset(AssetPaths.titleFgBase),
            _LitImage(
              imgSrc: AssetPaths.titleFgReceive,
              color: _orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleFgEmit,
              color: _emitColor,
              lightAmt: _finalEmitLightAmt,
            ),
            Positioned.fill(
              child: TitleScreenUi(
                difficulty: _difficulty,
                onDifficultyFocused: _handleDifficultyFocused,
                onDifficultyPressed: _handleDifficultyPressed,
              ),
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
    required this.lightAmt,
  });
  final Color color;
  final String imgSrc;
  final double lightAmt;

  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        hsl.withLightness(hsl.lightness * lightAmt).toColor(),
        BlendMode.modulate,
      ),
      child: Image.asset(imgSrc),
    );
  }
}
