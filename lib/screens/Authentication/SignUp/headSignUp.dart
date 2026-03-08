import 'package:flutter/cupertino.dart';
import 'package:heroes_club/core/constant/AppNameEntity.dart';
import 'package:heroes_club/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class HeadsignUp extends StatelessWidget {
  final String logo;
  final String clubNameAr;
  final String clubNameEn;

  const HeadsignUp({
    super.key,
    this.logo = AppImageAsset.logo,
    this.clubNameAr = AppNameEntity.clubNameAr,
    this.clubNameEn = AppNameEntity.clubNameEn,
  });
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(

        logo,
          height: 50,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              clubNameAr,
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              clubNameEn,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
