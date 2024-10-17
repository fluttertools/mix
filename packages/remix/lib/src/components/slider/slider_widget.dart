part of 'slider.dart';

class Slider extends StatefulWidget {
  const Slider({
    super.key,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions = 0,
    required this.onChanged,
    required this.value,
    this.onChangeEnd,
    this.onChangeStart,
    this.style,
    this.variants = const [],
    this.disabled = false,
  });

  final double min;
  final double max;
  final int divisions;
  final double value;
  final SliderStyle? style;
  final List<Variant> variants;
  final bool disabled;

  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final ValueChanged<double>? onChangeStart;

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> with TickerProviderStateMixin {
  double _sliderWidth = 0.0;
  double _thumbWidth = 0.0;

  double _calculateValue(Offset localPosition) {
    double dx = (localPosition.dx - _thumbWidth / 2).clamp(0, _sliderWidth);
    double percent = dx / _sliderWidth;
    int divisions = widget.divisions;

    if (divisions > 0) {
      final range = widget.max - widget.min;
      final step = range / divisions;
      final rounded = ((percent * range) / step).round();

      return step * rounded;
    }

    return widget.min + percent * (widget.max - widget.min);
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.slider;
    final configuration = SpecConfiguration(context, SliderSpecUtility.self);

    return MixGestureDetector(
      enabled: !widget.disabled,
      mouseCursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onPanUpdate: (details) {
        final value = _calculateValue(details.localPosition);
        widget.onChanged?.call(value);
      },
      onPanEnd: (details) {
        final value = _calculateValue(details.localPosition);
        widget.onChangeEnd?.call(value);
      },
      onPanStart: (details) {
        final value = _calculateValue(details.localPosition);
        widget.onChangeStart?.call(value);
      },
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(widget.variants),
        builder: (context) {
          final spec = SliderSpec.of(context);
          _thumbWidth = spec.thumb.width ?? 0;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (spec.thumb.width ?? 0) / 2,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                _sliderWidth = constraints.maxWidth;
                double percent =
                    ((widget.value - widget.min) / (widget.max - widget.min))
                        .clamp(0, 1);

                final a =
                    (constraints.maxWidth - _thumbWidth / 4) / widget.divisions;
                final divisions = [
                  for (int i = 0; i < widget.divisions; i++)
                    Transform.translate(
                      offset: Offset(a * (i + 1), 0),
                      child: spec.division(),
                    ),
                ];

                return Container(
                  color: Colors.transparent,
                  height: (spec.thumb.height ?? 0) * 2,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      spec.track(),
                      ...divisions,
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: percent,
                        child: spec.activeTrack(),
                      ),
                      Transform.translate(
                        offset: Offset(
                          percent * constraints.maxWidth - _thumbWidth / 2,
                          0,
                        ),
                        child: spec.thumb(),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
