import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AnnouncementDetails extends StatelessWidget {
  const AnnouncementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Announcement Details'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Under Maintenance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text(
              '13 July 2023 | 13:13',
              style: TextStyle(fontSize: 11, color: Constants.grey_text),
            ),
            Container(
              width: double.maxFinite,
              height: 217,
              margin: EdgeInsets.symmetric(vertical: 24),
              color: Constants.secondary_color,
              child: Icon(Icons.image, color: Constants.primary_color),
            ),
            Text(
              '''
Dear CT Users,

We hope this message finds you well.

We are committed to providing you with the best possible user experience. To achieve this, we regularly perform maintenance on our systems to ensure they are running smoothly and securely.

Start Date and Time: 13 July 2023 | 18:00
End Date and Time: 13 July 2023 | 22:00

During this maintenance period, our platform will be temporarily unavailable. We understand that this may cause some inconvenience, and we sincerely apologize for any disruption this may cause.

Sincerely,
CT Team
            ''',
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
