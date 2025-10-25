import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

class AppProfileButtonComponent extends StatefulWidget {
  final String title;
  final String assetImage;
  final VoidCallback? onTap;

  const AppProfileButtonComponent({
    required this.title,
    required this.assetImage,
    this.onTap,
    super.key,
  });

  @override
  State<AppProfileButtonComponent> createState() => _ProfileButtonComponentState();
}

class _ProfileButtonComponentState extends BaseState<AppProfileButtonComponent> {
 
var activeColor = Color(0x00FFFFFF);

  void _onEnter(PointerEvent details) {
    setState(() {
      activeColor = Color(0xFFC295FC);
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      activeColor = Color(0x00FFFFFF);
    });
  }

  void _onLongPress() {
    setState(() {
      activeColor = Color(0xFFC295FC);
    });
  }

  void _onRelease(LongPressEndDetails details) {
    setState(() {
      activeColor = Color(0x00FFFFFF);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles.of(context);
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title, style: textStyles.titleGrey),
        MouseRegion(
          onEnter: _onEnter,
          onExit: _onExit,
          child: GestureDetector(
            onTap: widget.onTap,
            onLongPress: _onLongPress,
            onLongPressEnd: _onRelease,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(radius: 60, backgroundColor: activeColor),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(widget.assetImage),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//0xFFC295FC
