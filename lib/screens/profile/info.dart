import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _info = [
      {
        'question': 'What is CT?',
        'answer':
            'CT is a cryptocurrency exchange platform that allows users to buy, sell, and trade various cryptocurrencies securely and efficiently.'
      },
      {
        'question': 'What cryptocurrencies can I trade on CT?',
        'answer':
            'CT is a cryptocurrency exchange platform that allows users to buy, sell, and trade various cryptocurrencies securely and efficiently.'
      },
      {
        'question': 'How secure CT is?',
        'answer':
            'CT is a cryptocurrency exchange platform that allows users to buy, sell, and trade various cryptocurrencies securely and efficiently.'
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Info'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ..._info
                .map((e) => Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), color: Constants.secondary_color),
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            e['question'],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          childrenPadding: EdgeInsets.fromLTRB(16, 0, 50, 20),
                          children: [
                            Text(
                              e['answer'],
                              style: TextStyle(fontSize: 11, color: Constants.grey_text),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
