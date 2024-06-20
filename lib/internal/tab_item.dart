import 'package:flutter/material.dart';

const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;
const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;

class TabItem extends StatelessWidget {
  final UniqueKey uniqueKey;

  final String title;
  final IconData iconData;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;
  final double iconYAlign = ICON_ON;

  final double textYAlign = TEXT_OFF;
  final double iconAlpha = ALPHA_ON;
  TabItem(
      {required this.uniqueKey,
      required this.selected,
      required this.iconData,
      required this.title,
      required this.callbackFunction,
      required this.textColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: Duration(milliseconds: ANIM_DURATION),
                alignment: Alignment(0, (selected) ? TEXT_ON : TEXT_OFF),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: ANIM_DURATION),
                    style: selected
                        ? TextStyle(
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          )
                        : TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.transparent,
                          ),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? ICON_OFF : ICON_ON),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: ANIM_DURATION),
                opacity: (selected) ? ALPHA_OFF : ALPHA_ON,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: Icon(
                    iconData,
                    color: iconColor,
                  ),
                  onPressed: () {
                    callbackFunction(uniqueKey);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
