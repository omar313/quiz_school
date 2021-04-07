import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/color_constant.dart';

class RectangleShadowBtn extends StatelessWidget {
  final double width, height;
  final String text;
  final Function action;
  final double fontSize;
  const RectangleShadowBtn({
    Key key,
    this.width,
    this.height,
    this.action,
    this.text,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: this.height,
        padding: EdgeInsets.symmetric(horizontal: width == null ? 20 : 0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 1, offset: Offset(-1, 8))
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kBorderColor, width: 1)),
        child:
            //  Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Text(this.text , style: TextStyle(fontSize: fontSize, color: Color(0xff5d5d5d)),),
            //   ),
            // ),
            MaterialButton(
           
          onPressed: action,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                this.text,
                
                maxLines: 2,
                style: TextStyle(
                    height: 1,
                    fontSize: fontSize,
                    color: Color(0xff5d5d5d),
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal),
              ),
          ),
        ));
  }
}
