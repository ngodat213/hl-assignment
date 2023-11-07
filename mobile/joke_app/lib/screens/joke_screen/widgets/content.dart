import 'package:flutter/material.dart';
import 'package:joke_app/themes/app_colors.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.colorGreen,
      padding: const EdgeInsets.only(top: 50, bottom: 35),
      child: const Column(
        children: [
          Text(
            'A joke a day keeps the doctor away',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 25),
          Text(
            'If you joke wrong way, your teeth have to pay. (Seriour)',
            style: TextStyle(color: Colors.white, fontSize: 11),
          )
        ],
      ),
    );
  }
}
