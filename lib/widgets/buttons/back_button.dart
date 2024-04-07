import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



import '../../values/colors.dart';

/// Project SLM_Wallet
/// Created by sahan on 2022-05-17 14:32
///
/// updated by Rhylvin April 2023
class CustomBackButton extends StatelessWidget {
  final bool enabled;
  final String? route;
  final bool root;
  final Function? dontUseRouteUseThisFunctionInstead;

  const CustomBackButton({
    Key? key,
    this.enabled = true,
    this.route,
    this.root = true ,
    this.dontUseRouteUseThisFunctionInstead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (dontUseRouteUseThisFunctionInstead == null) {
         // PreLoginLocations.routerDelegateMobile.update();
         // PreLoginLocations.routerDelegate.update();
         // PostLoginRoutes.postLoginRouterDelegate.update();
          if (route!.isNotEmpty) {
            Beamer.of(context, root: root).beamToNamed(route!);
          } else {
            Beamer.of(context).beamBack();
          }
        } else {
          dontUseRouteUseThisFunctionInstead!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: (kIsWeb ? 40 : 50.0),
        width: (kIsWeb ? 40 : 50.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: kIsWeb ? 15 : null,
              color: AppColors.accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
