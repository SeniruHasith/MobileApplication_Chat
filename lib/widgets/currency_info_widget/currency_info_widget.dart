import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';

class CurrencyInfoWidget extends StatefulWidget {
  final String currencyName;
  final String currencyCode;
  final String dateNTime;
  final String buyAmount;
  final String sellAmount;
  const CurrencyInfoWidget(
      {Key? key,
      required this.currencyName,
      required this.currencyCode,
      required this.dateNTime,
      required this.buyAmount,
      required this.sellAmount})
      : super(key: key);

  @override
  State<CurrencyInfoWidget> createState() => _CurrencyInfoWidgetState();
}

class _CurrencyInfoWidgetState extends State<CurrencyInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 15)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      height: 35,
                      width: 35,
                      child: SvgPicture.asset(
                        "assets/currency_flags/" +
                            widget.currencyCode.trim() +
                            ".svg",
                        placeholderBuilder: (context) => const Icon(
                          Icons.info,
                          color: AppColors.grey,
                        ),
                      ))),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 38,
                          child: Text(
                            widget.currencyName.toUpperCase() ,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Text(
                          widget.currencyCode,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.appPrimaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          widget.dateNTime,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "BUY - " + widget.buyAmount.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "SELL - " + widget.buyAmount.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
