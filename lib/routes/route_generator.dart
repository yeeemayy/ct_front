import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/asset/deposit.dart';
import 'package:ct_app/screens/asset/deposit_history.dart';
import 'package:ct_app/screens/asset/withdraw.dart';
import 'package:ct_app/screens/asset/withdraw_history.dart';
import 'package:ct_app/screens/auth/create_account.dart';
import 'package:ct_app/screens/auth/login.dart';
import 'package:ct_app/screens/orders/order_history.dart';
import 'package:ct_app/screens/profile/announcement.dart';
import 'package:ct_app/screens/profile/announcement_details.dart';
import 'package:ct_app/screens/profile/download_centre.dart';
import 'package:ct_app/screens/profile/edit_profile.dart';
import 'package:ct_app/screens/profile/info.dart';
import 'package:ct_app/screens/profile/kyc.dart';
import 'package:ct_app/screens/profile/security_centre.dart';
import 'package:ct_app/screens/profile/support.dart';
import 'package:ct_app/screens/profile/withdrawal_detail.dart';
import 'package:ct_app/screens/splash.dart';
import 'package:ct_app/screens/wrapper.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return buildRoute(const Splash(), settings: settings);
      case Routes.main:
        return buildRoute(const Wrapper(), settings: settings);
      case Routes.login:
        return buildRoute(const Login(), settings: settings);
      case Routes.create_account:
        return buildRoute(const CreateAccount(), settings: settings);
      case Routes.order_history:
        return buildRoute(const OrderHistory(), settings: settings);
      case Routes.deposit:
        return buildRoute(const Deposit(), settings: settings);
      case Routes.deposit_history:
        return buildRoute(const DepositHistory(), settings: settings);
      case Routes.withdraw:
        return buildRoute(const Withdraw(), settings: settings);
      case Routes.withdraw_history:
        return buildRoute(const WithdrawHistory(), settings: settings);
      case Routes.kyc:
        return buildRoute(const KYC(), settings: settings);
      case Routes.edit_profile:
        return buildRoute(const EditProfile(), settings: settings);
      case Routes.withdrawal_detail:
        return buildRoute(const WithdrawalDetail(), settings: settings);
      case Routes.security_centre:
        return buildRoute(const SecurityCentre(), settings: settings);
      case Routes.announcement:
        return buildRoute(const Announcement(), settings: settings);
      case Routes.announcement_details:
        return buildRoute(const AnnouncementDetails(), settings: settings);
      case Routes.info:
        return buildRoute(const Info(), settings: settings);
      case Routes.support:
        return buildRoute(const Support(), settings: settings);
      case Routes.download_centre:
        return buildRoute(const DownloadCentre(), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child, {required RouteSettings settings}) {
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
