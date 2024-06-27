import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/screens/reusable_widget/detail_row.dart';
import 'package:flutter/material.dart';

class PositionHolding extends StatelessWidget {
  const PositionHolding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Portfolio and Loss',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(1, 2), blurRadius: 2)]),
            child: const Text('2.4', style: TextStyle(fontSize: 32, color: Constants.primary_color)),
          ),
          const DetailRow(title: 'Balance', content: '32514.5'),
          const DetailRow(title: 'Current Margin', content: '100'),
          const DetailRow(title: 'Risk Rate', content: '34475.904%'),
          const SizedBox(height: 6),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Constants.secondary_color),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('XAUUSD', style: TextStyle(
                      fontSize: 13
                    )),
                    Text('Order ID #158817', style: TextStyle(
                      fontSize: 11, color: Constants.grey_text
                    ))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('2175.79  ->  2175.53', style: TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600
                    )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Constants.primary_color)
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),

                                color: Constants.primary_color
                      ),
                            child: const Text('Buy', style: TextStyle(
                              fontSize: 11, color: Colors.white
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('0.1 Lots', style: TextStyle(
                              fontSize: 10 ,color: Constants.primary_color
                            ),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Row(crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2024-03-12 06:41:15', style: TextStyle(
                        fontSize: 11, color: Constants.grey_text
                    )),
                    Text('2.4', style: TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500,
                      color: Constants.primary_color
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
