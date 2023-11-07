import 'package:flutter/material.dart';
import 'package:joke_app/themes/images.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Image.asset(
            Images.imageLogo,
            width: 50,
          ),
          const Spacer(),
          const AccountWidget(),
        ],
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Handicrafted by'),
            Text('Jim HLS'),
          ],
        ),
        SizedBox(width: 6),
        CircleAvatar(
          backgroundImage: AssetImage(Images.imageAvatar),
        )
      ],
    );
  }
}
