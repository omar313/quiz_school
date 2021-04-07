import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/color_constant.dart';

class DialogHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      
      
      backgroundColor: kHomeDialogBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'About',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kAppBlueColor, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(color: kAppBlueColor,),textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleIconButton(
                    icon: Icons.location_on_rounded,
                    action: () {},
                  ),
                  CircleIconButton(
                    icon: Icons.mail,
                    action: () {},
                  ),
                  CircleIconButton(
                    icon: Icons.call,
                    action: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Function action;
  const CircleIconButton({
    Key key,
    this.icon,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Color(0xffafd8fd), width: 1)),
        child: Icon(
          icon,
          color: kAppBlueColor,
          size: 15,
        ),
      ),
    );
  }
}
