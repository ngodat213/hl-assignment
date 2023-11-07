import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: const Column(
        children: [
          Text(
            'This appis created as part of Hlsolutions program. The materials con- tained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the infor- mation contained on this site.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.6,
              color: Color(0xff6B6B6B),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Copyright 2021 HLS',
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
