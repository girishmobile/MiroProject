import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/auth/forgot_password.dart';
import 'package:apple_invites/screens/auth/login_page.dart';
import 'package:apple_invites/screens/create_event_screen.dart';
import 'package:apple_invites/screens/event/accepted_guest.dart';
import 'package:apple_invites/screens/event/buy_ticket_page.dart';
import 'package:apple_invites/screens/event/create_event.dart';
import 'package:apple_invites/screens/event/event_detail_not_hosted.dart';
import 'package:apple_invites/screens/event/event_detail_page.dart';
import 'package:apple_invites/screens/event/invite_guest_list.dart';
import 'package:apple_invites/screens/event/location_option_page.dart';
import 'package:apple_invites/screens/event/manage_event_page.dart';
import 'package:apple_invites/screens/event/poll_result_page.dart';
import 'package:apple_invites/screens/event/preview_event_page.dart';
import 'package:apple_invites/screens/event/public_event_detail.dart';
import 'package:apple_invites/screens/event/public_event_page.dart';
import 'package:apple_invites/screens/event/rejected_guest.dart';
import 'package:apple_invites/screens/event/simple_event_detail.dart';
import 'package:apple_invites/screens/event/ticket_page.dart';
import 'package:apple_invites/screens/friends/add_friend_by_phone.dart';
import 'package:apple_invites/screens/friends/contact_page.dart';
import 'package:apple_invites/screens/friends/friend_activity.dart';
import 'package:apple_invites/screens/friends/friend_messages.dart';
import 'package:apple_invites/screens/friends/friend_of_friends.dart';
import 'package:apple_invites/screens/friends/friend_profile_page.dart';
import 'package:apple_invites/screens/friends/friends_events.dart';
import 'package:apple_invites/screens/friends/friends_page.dart';
import 'package:apple_invites/screens/global_event_page.dart';
import 'package:apple_invites/screens/groups/create_group.dart';
import 'package:apple_invites/screens/groups/group_events.dart';
import 'package:apple_invites/screens/groups/group_info_page.dart';
import 'package:apple_invites/screens/groups/group_members.dart';
import 'package:apple_invites/screens/groups/group_message_page.dart';
import 'package:apple_invites/screens/groups/groups_page.dart';
import 'package:apple_invites/screens/groups/see_all_group.dart';
import 'package:apple_invites/screens/groups/update_group.dart';
import 'package:apple_invites/screens/groups/user_group_page.dart';
import 'package:apple_invites/screens/host/host_profile_page.dart';
import 'package:apple_invites/screens/main_container.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:apple_invites/screens/notification_page.dart';
import 'package:apple_invites/screens/order_payment/new_card_page.dart';
import 'package:apple_invites/screens/order_payment/order_and_payment.dart';
import 'package:apple_invites/screens/order_payment/payment_setting_page.dart';
import 'package:apple_invites/screens/order_payment/payment_support_help.dart';
import 'package:apple_invites/screens/order_payment/payment_terms_page.dart';
import 'package:apple_invites/screens/profile_page.dart';
import 'package:apple_invites/screens/qrcode/qr_code_page.dart';
import 'package:apple_invites/screens/qrcode/scan_qrcode_page.dart';
import 'package:apple_invites/screens/setting/about_us_page.dart';
import 'package:apple_invites/screens/setting/account_page.dart';
import 'package:apple_invites/screens/setting/block_account_list.dart';
import 'package:apple_invites/screens/setting/blocked_account_page.dart';
import 'package:apple_invites/screens/setting/change_password_page.dart';
import 'package:apple_invites/screens/setting/help/customer_support.dart';
import 'package:apple_invites/screens/setting/help/help_center.dart';
import 'package:apple_invites/screens/setting/help/help_page.dart';
import 'package:apple_invites/screens/setting/help/privacy_security_help.dart';
import 'package:apple_invites/screens/setting/help/report_a_problem.dart';
import 'package:apple_invites/screens/setting/help/report_problem_next.dart';
import 'package:apple_invites/screens/setting/help/report_request.dart';
import 'package:apple_invites/screens/setting/help/report_request_details.dart';
import 'package:apple_invites/screens/setting/help/support_request_page.dart';
import 'package:apple_invites/screens/setting/manage_account.dart';
import 'package:apple_invites/screens/setting/my_webview_page.dart';
import 'package:apple_invites/screens/setting/notification_settings.dart';
import 'package:apple_invites/screens/setting/photos_page.dart';
import 'package:apple_invites/screens/setting/privacy_security.dart';

import 'package:apple_invites/screens/setting/setting_page.dart';
import 'package:apple_invites/screens/setting/user_event_page.dart';
import 'package:apple_invites/screens/signup/sign_up_page.dart';
import 'package:apple_invites/screens/social/apple_login.dart';
import 'package:apple_invites/screens/social/facebook_login.dart';
import 'package:apple_invites/screens/social/google_login.dart';
import 'package:apple_invites/screens/social/need_more_help.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case RouteName.loginPage:
        screen = const LoginPage();
        break;
      case RouteName.mainPage:
        screen = const MainContainer();
        break;

      case RouteName.createEventScreen:
        //Extract argument safety
        final args = settings.arguments as Map<String, dynamic>?;
        final imageUrl = args?['imageUrl'] ?? '';
        screen = CreateEventScreen(imageUrl: imageUrl);
        break;
      case RouteName.notificationPage:
        screen = const NotificationPage();
        break;
      case RouteName.globalEventPage:
        screen = const GlobalEventPage();
        break;
      case RouteName.profilePage:
        screen = ProfilePage();
        break;
      case RouteName.friendsPage:
        screen = const FriendsPage();
        break;
      case RouteName.accountPage:
        screen = const AccountPage();
        break;
      case RouteName.qrcodePage:
        screen = const QrCodePage();
        break;
      case RouteName.scanQrCodePage:
        screen = const ScanQrCodePage();
        break;
      case RouteName.orderAndPaymentPage:
        screen = const OrderAndPayment();
        break;
      case RouteName.paymentSupport:
        screen = const PaymentSupportHelp();
        break;
      case RouteName.paymentSetting:
        screen = const PaymentSettingPage();
        break;
      case RouteName.newCardPage:
        screen = const NewCardPage();
        break;
      case RouteName.paymentTerms:
        screen = const PaymentTermsPage();
        break;
      case RouteName.settingPage:
        screen = const SettingPage();
        break;
      case RouteName.forgotPassword:
        screen = const ForgotPassword();
        break;
      case RouteName.facebookLogin:
        screen = const FacebookLogin();
        break;
      case RouteName.appleLogin:
        screen = const AppleLogin();
        break;
      case RouteName.googleLogin:
        screen = const GoogleLogin();
        break;
      case RouteName.needMoreHelp:
        screen = const NeedMoreHelp();
        break;
      case RouteName.signupPage:
        screen = const SignUpPage();
        break;
      case RouteName.pollResultPage:
        final args = settings.arguments as String;
        screen = PollResultPage(eventId: args);
        break;
      case RouteName.manageEventPage:
        screen = const ManageEventPage();
        break;
      case RouteName.previewEventPage:
        screen = const PreviewEventPage();
        break;
      case RouteName.addFriendByPhone:
        screen = AddFriendByPhone();
        break;
      case RouteName.friendProfilePage:
        final args = settings.arguments as ContactModel;
        screen = FriendProfilePage(friend: args);
        break;
      case RouteName.friendsEventPage:
        screen = const FriendsEvents();
        break;
      case RouteName.friendOfFriendsPage:
        screen = const FriendOfFriends();
        break;
      case RouteName.friendMessages:
        final args = settings.arguments as ContactModel;
        screen = FriendMessages(friend: args);
        break;
      case RouteName.groupsPage:
        screen = const GroupsPage();
        break;
      case RouteName.createGroupPage:
        screen = const CreateGroup();
        break;
      case RouteName.groupInfoPage:
        final args = settings.arguments as String;
        screen = GroupInfoPage(groupId: args);
        break;
      case RouteName.updateGroup:
        final args = settings.arguments as String;
        screen = UpdateGroup(groupId: args);
        break;
      case RouteName.groupMessagePage:
        final args = settings.arguments as String;
        screen = GroupMessagePage(groupId: args);
        break;
      case RouteName.groupEvents:
        final args = settings.arguments as String;
        screen = GroupEvents(groupId: args);
        break;
      case RouteName.userGroupPage:
        screen = const UserGroupPage();
        break;
      case RouteName.groupMembers:
        final args = settings.arguments as String;
        screen = GroupMembers(groupId: args);
        break;
      case RouteName.privacySecurity:
        screen = const PrivacySecurity();
        break;
      case RouteName.blockedAccount:
        screen = const BlockedAccountPage();
        break;
      case RouteName.blockAccountList:
        screen = const BlockAccountList();
        break;
      case RouteName.changePasswordPage:
        screen = const ChangePasswordPage();
        break;
      case RouteName.manageAccount:
        screen = const ManageAccount();
        break;
      case RouteName.userEventPage:
        screen = const UserEventPage();
        break;
      case RouteName.notificationSetting:
        screen = const NotificationSettings();
        break;

      case RouteName.helpPage:
        screen = const HelpPage();
        break;
      case RouteName.reportAProblem:
        screen = const ReportAProblem();
        break;
      case RouteName.reportProblemNext:
        screen = const ReportProblemNext();
        break;
      case RouteName.helpCenter:
        screen = const HelpCenter();
        break;
      case RouteName.supportRequestPage:
        screen = const SupportRequestPage();
        break;
      case RouteName.privacySecurityHelp:
        screen = const PrivacySecurityHelp();
        break;
      case RouteName.reportRequest:
        screen = ReportRequest();
        break;
      case RouteName.customerSupport:
        screen = CustomerSupport();
        break;
      case RouteName.reportRequestDetails:
        screen = const ReportRequestDetails();
        break;
      case RouteName.myWebviewPage:
        screen = MyWebviewPage(
          url: "https://support.apple.com/?cid=gn-ols-home-hp-tab",
        );
        break;
      case RouteName.aboutUsPage:
        screen = const AboutUsPage();
        break;
      case RouteName.photsPage:
        screen = const PhotosPage();
        break;
      //Event
      case RouteName.eventDetailNotHost:
        final args = settings.arguments as EventModel;
        screen = EventDetailNotHosted(event: args);
        break;
      case RouteName.inviteGuestList:
        screen = const InviteGuestList();
        break;
      case RouteName.hostProfilePage:
        screen = HostProfilePage();
        break;
      case RouteName.buyTicketPage:
        screen = const BuyTicketPage();
        break;
      case RouteName.publicEventPage:
        screen = const PublicEventPage();
        break;
      case RouteName.friendActivityPage:
        screen = const FriendActivity();
        break;
      case RouteName.createEventPage:
        screen = const CreateEvent();
        break;
      case RouteName.ticketPage:
        screen = const TicketPage();
        break;
      case RouteName.seeAllGroup:
        screen = const SeeAllGroup();
        break;
      case RouteName.publicEventDetail:
        screen = const PublicEventDetail();
        break;
      case RouteName.eventDetailPage:
        final args = settings.arguments as String;
        screen = EventDetailPage(eventId: args);
        break;
      case RouteName.acceptedGuest:
        screen = const AcceptedGuest();
        break;
      case RouteName.rejectedGuest:
        screen = const RejectedGuest();
        break;
      case RouteName.simpleEventDetail:
        screen = SimpleEventDetail();
        break;
      case RouteName.contactPage:
        screen = const ContactPage();
        break;
      case RouteName.locationOptionPage:
        screen = const LocationOptionPage();
        break;
      // Add other routes here
      default:
        screen = Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }
    return _pageRouteBuilder(screen, settings);
  }

  static PageRouteBuilder _pageRouteBuilder(
    Widget screen,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      opaque: false,
      settings: settings, //Girish 16-July-2025
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

/** 
 * switch (settings.name) {
      case RouteName.homeScreen:  
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.createEventScreen:
        return MaterialPageRoute(builder: (_) => CreateEventScreen());
      default:  
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No route define for ${settings.name}"),
                ),
              ),
        );
    }
  }
  ;;;////
 */
