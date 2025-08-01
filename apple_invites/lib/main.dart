import 'package:apple_invites/core/router/route_generate.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/Notification_setting_provider.dart';
import 'package:apple_invites/screens/provider/block_account_provider.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:apple_invites/screens/provider/friend_provider.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:apple_invites/screens/provider/help_provider.dart';
import 'package:apple_invites/screens/provider/payment_provider.dart';
import 'package:apple_invites/screens/provider/privacy_provider.dart';
import 'package:apple_invites/screens/provider/profile_provider.dart';
import 'package:apple_invites/screens/provider/public_provider.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:apple_invites/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
  ChangeNotifierProvider<GuestProvider>(create: (_) => GuestProvider()),
  ChangeNotifierProvider<GroupProvider>(create: (_) => GroupProvider()),
  ChangeNotifierProvider<FriendProvider>(create: (_) => FriendProvider()),
  ChangeNotifierProvider<PublicProvider>(create: (_) => PublicProvider()),
  ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
  ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  ChangeNotifierProvider<NotificationSettingProvider>(
    create: (_) => NotificationSettingProvider(),
  ),
  ChangeNotifierProvider<BlockAccountProvider>(
    create: (_) => BlockAccountProvider(),
  ),
  ChangeNotifierProvider<PrivacyProvider>(create: (_) => PrivacyProvider()),
  ChangeNotifierProvider<HelpProvider>(create: (_) => HelpProvider()),
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Events',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: RouteName.loginPage,
        onGenerateRoute: RouteGenerate.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
