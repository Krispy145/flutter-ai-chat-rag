import "package:flutter/material.dart";

/// Animated typing indicator widget
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: theme.colorScheme.primary,
            child: Icon(Icons.smart_toy, size: 16, color: theme.colorScheme.onPrimary),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20).copyWith(bottomLeft: const Radius.circular(4)),
            ),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    final delay = index * 0.2;
                    final animationValue = (_animation.value - delay).clamp(0.0, 1.0);
                    final opacity = (animationValue * 2 - 1).clamp(0.0, 1.0);

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Opacity(
                        opacity: opacity,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(color: theme.colorScheme.onSurface, shape: BoxShape.circle),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
