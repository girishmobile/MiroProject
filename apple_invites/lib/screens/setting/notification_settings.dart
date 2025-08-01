import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/screens/provider/Notification_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancySettings(context));
  }

  _buildFancySettings(BuildContext context) {
    final provider = Provider.of<NotificationSettingProvider>(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildFriendRequest(provider),
                  _buildEventPhoto(provider),
                  _buildFromGamePlan(provider),
                  _buildReminders(provider),
                  _buildEmailSMS(provider),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "NOTIFICATION SETTINGS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildFriendRequest(NotificationSettingProvider provider) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: loadRowWithIcon(
                  iconName: Icons.people_alt_outlined,
                  title: "FRIENDS, GROUPS, & REQUEST",
                ),
              ),
              loadCircleIcon(
                backgroundColor: Colors.transparent,
                radius: 16,
                iconSize: 16,
                icon:
                    provider.isOpenFriendMenu
                        ? Icons.arrow_downward
                        : Icons.arrow_forward,
                onTap: () {
                  provider.setIsOpenFriendMenu(!provider.isOpenFriendMenu);
                },
              ),
            ],
          ),
          provider.isOpenFriendMenu
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox.shrink(),
                    loadTitleText(fontSize: 16, title: "Friend Requests"),
                    _buildRadioButton(
                      value: FriendRequest.off,
                      title: "Off",
                      selectedValue: provider.friendRequest,
                      onTap:
                          () => provider.setIsFriendRequest(FriendRequest.off),
                    ),
                    _buildRadioButton(
                      value: FriendRequest.on,
                      title: "On",
                      selectedValue: provider.friendRequest,
                      onTap:
                          () => provider.setIsFriendRequest(FriendRequest.on),
                    ),
                    loadDivider(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Accepted Friend Requests",
                    ),
                    _buildRadioButton(
                      value: AcceptedRequest.off,
                      title: "Off",
                      selectedValue: provider.acceptedRequest,
                      onTap:
                          () => provider.setIsAcceptedRequest(
                            AcceptedRequest.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: AcceptedRequest.on,
                      title: "On",
                      selectedValue: provider.acceptedRequest,
                      onTap:
                          () =>
                              provider.setIsAcceptedRequest(AcceptedRequest.on),
                    ),

                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Group Requests"),
                    _buildRadioButton(
                      value: GroupRequest.off,
                      title: "Off",
                      selectedValue: provider.groupRequest,
                      onTap: () => provider.setIsGroupRequest(GroupRequest.off),
                    ),
                    _buildRadioButton(
                      value: GroupRequest.on,
                      title: "On",
                      selectedValue: provider.groupRequest,
                      onTap: () => provider.setIsGroupRequest(GroupRequest.on),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildEventPhoto(NotificationSettingProvider provider) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // spacing: 12,
        children: [
          Row(
            children: [
              Expanded(
                child: loadRowWithIcon(
                  iconName: Icons.event_outlined,
                  title: "EVENTS,COMMENTS,& PHOTOS",
                ),
              ),
              loadCircleIcon(
                backgroundColor: Colors.transparent,
                radius: 16,
                iconSize: 16,
                icon:
                    provider.isOpenEventMenu
                        ? Icons.arrow_downward
                        : Icons.arrow_forward,
                onTap: () {
                  provider.setIsOpenEventMenu(!provider.isOpenEventMenu);
                },
              ),
            ],
          ),
          provider.isOpenEventMenu
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox.shrink(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Events That You're Invited To",
                    ),
                    _buildRadioButton(
                      value: EventInvited.off,
                      title: "Off",
                      selectedValue: provider.eventInvited,
                      onTap:
                          () => provider.setIsEventInvitedTo(EventInvited.off),
                    ),
                    _buildRadioButton(
                      value: EventInvited.fromPeopleOnMyFriendList,
                      title: "From People on my Friend List",
                      selectedValue: provider.eventInvited,
                      onTap:
                          () => provider.setIsEventInvitedTo(
                            EventInvited.fromPeopleOnMyFriendList,
                          ),
                    ),
                    _buildRadioButton(
                      value: EventInvited.fromEveryone,
                      title: "From Everyone",
                      selectedValue: provider.eventInvited,
                      onTap:
                          () => provider.setIsEventInvitedTo(
                            EventInvited.fromEveryone,
                          ),
                    ),
                    loadDivider(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Guest RSVP to Your Event Invite",
                    ),
                    _buildRadioButton(
                      value: GuestEventInvited.off,
                      title: "Off",
                      selectedValue: provider.guestEventInvited,
                      onTap:
                          () => provider.setIsGuestEventInvited(
                            GuestEventInvited.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GuestEventInvited.fromGuests,
                      title: "From Guests",
                      selectedValue: provider.guestEventInvited,
                      onTap:
                          () => provider.setIsGuestEventInvited(
                            GuestEventInvited.fromGuests,
                          ),
                    ),
                    loadDivider(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Guest Updates Item List for Event",
                    ),
                    _buildRadioButton(
                      value: GuestUpdateEvent.off,
                      title: "Off",
                      selectedValue: provider.guestEventInvited,
                      onTap:
                          () => provider.setIsGuestEventInvited(
                            GuestEventInvited.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GuestUpdateEvent.fromPeopleOnMyFriendList,
                      title: "From People on my Friend List",
                      selectedValue: provider.guestUpdateEvent,
                      onTap:
                          () => provider.setIsGuestUpdateEvent(
                            GuestUpdateEvent.fromPeopleOnMyFriendList,
                          ),
                    ),
                    _buildRadioButton(
                      value: GuestUpdateEvent.fromEveryone,
                      title: "From Everyone",
                      selectedValue: provider.guestUpdateEvent,
                      onTap:
                          () => provider.setIsGuestUpdateEvent(
                            GuestUpdateEvent.fromEveryone,
                          ),
                    ),
                    loadDivider(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Guest Requests Payment",
                    ),
                    _buildRadioButton(
                      value: GuestRequestPayment.off,
                      title: "Off",
                      selectedValue: provider.guestRequestPayment,
                      onTap:
                          () => provider.setIsGuestRequestPayment(
                            GuestRequestPayment.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GuestRequestPayment.fromPeopleOnMyFriendList,
                      title: "From People on my Friend List",
                      selectedValue: provider.guestRequestPayment,
                      onTap:
                          () => provider.setIsGuestRequestPayment(
                            GuestRequestPayment.fromPeopleOnMyFriendList,
                          ),
                    ),
                    _buildRadioButton(
                      value: GuestRequestPayment.fromEveryone,
                      title: "From Everyone",
                      selectedValue: provider.guestRequestPayment,
                      onTap:
                          () => provider.setIsGuestRequestPayment(
                            GuestRequestPayment.fromEveryone,
                          ),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildFromGamePlan(NotificationSettingProvider provider) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: loadRowWithIcon(
                  iconName: Icons.gamepad_outlined,
                  title: "FROM GamePlan",
                ),
              ),
              loadCircleIcon(
                backgroundColor: Colors.transparent,
                radius: 16,
                iconSize: 16,
                icon:
                    provider.isOpenGamePlan
                        ? Icons.arrow_downward
                        : Icons.arrow_forward,
                onTap: () {
                  provider.setIsOpenGamePlanMenu(!provider.isOpenGamePlan);
                },
              ),
            ],
          ),
          provider.isOpenGamePlan
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox.shrink(),
                    loadTitleText(fontSize: 16, title: "Reminders"),
                    _buildRadioButton(
                      value: GamePlanReminder.off,
                      title: "Off",
                      selectedValue: provider.gamePlanReminder,
                      onTap:
                          () => provider.setIsGamePlanReminder(
                            GamePlanReminder.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GamePlanReminder.on,
                      title: "On",
                      selectedValue: provider.gamePlanReminder,
                      onTap:
                          () => provider.setIsGamePlanReminder(
                            GamePlanReminder.on,
                          ),
                    ),

                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Product Announcements"),
                    _buildRadioButton(
                      value: GamePlanProduct.off,
                      title: "Off",
                      selectedValue: provider.gamePlanProduct,
                      onTap:
                          () => provider.setIsGamePlanProduct(
                            GamePlanProduct.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GamePlanProduct.on,
                      title: "On",
                      selectedValue: provider.gamePlanProduct,
                      onTap:
                          () =>
                              provider.setIsGamePlanProduct(GamePlanProduct.on),
                    ),

                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Support Requests"),
                    _buildRadioButton(
                      value: GamePlanSupport.off,
                      title: "Off",
                      selectedValue: provider.gamePlanSupport,
                      onTap:
                          () => provider.setIsGamePlanSupport(
                            GamePlanSupport.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: GamePlanSupport.on,
                      title: "On",
                      selectedValue: provider.gamePlanSupport,
                      onTap:
                          () =>
                              provider.setIsGamePlanSupport(GamePlanSupport.on),
                    ),

                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Unrecognized Logins"),
                    _buildRadioButton(
                      value: GamePlanLogin.off,
                      title: "Off",
                      selectedValue: provider.gamePlanLogin,
                      onTap:
                          () => provider.setIsGamePlanLogin(GamePlanLogin.off),
                    ),
                    _buildRadioButton(
                      value: GamePlanLogin.on,
                      title: "On",
                      selectedValue: provider.gamePlanLogin,
                      onTap:
                          () => provider.setIsGamePlanLogin(GamePlanLogin.on),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildEmailSMS(NotificationSettingProvider provider) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: loadRowWithIcon(
                  iconName: Icons.email_outlined,
                  title: "EMAIL & SMS",
                ),
              ),
              loadCircleIcon(
                backgroundColor: Colors.transparent,
                radius: 16,
                iconSize: 16,
                icon:
                    provider.isOpenEmailSMS
                        ? Icons.arrow_downward
                        : Icons.arrow_forward,
                onTap: () {
                  provider.setIsOpenEmailSMSMenu(!provider.isOpenEmailSMS);
                },
              ),
            ],
          ),
          provider.isOpenEmailSMS
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox.shrink(),
                    loadTitleText(fontSize: 16, title: "Reminder Emails"),
                    _buildRadioButton(
                      value: ReminderEmail.off,
                      title: "Off",
                      selectedValue: provider.reminderEmail,
                      onTap:
                          () => provider.setIsReminderEmail(ReminderEmail.off),
                    ),
                    _buildRadioButton(
                      value: ReminderEmail.on,
                      title: "On",
                      selectedValue: provider.reminderEmail,
                      onTap:
                          () => provider.setIsReminderEmail(ReminderEmail.on),
                    ),
                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Product Emails"),
                    _buildRadioButton(
                      value: ProductEmail.off,
                      title: "Off",
                      selectedValue: provider.productEmail,
                      onTap: () => provider.setIsProductEmail(ProductEmail.off),
                    ),
                    _buildRadioButton(
                      value: ProductEmail.on,
                      title: "On",
                      selectedValue: provider.productEmail,
                      onTap: () => provider.setIsProductEmail(ProductEmail.on),
                    ),
                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "New Emails"),
                    _buildRadioButton(
                      value: NewEmail.off,
                      title: "Off",
                      selectedValue: provider.newEmail,
                      onTap: () => provider.setIsNewEmail(NewEmail.off),
                    ),
                    _buildRadioButton(
                      value: NewEmail.on,
                      title: "On",
                      selectedValue: provider.newEmail,
                      onTap: () => provider.setIsNewEmail(NewEmail.on),
                    ),
                    loadDivider(),
                    loadTitleText(fontSize: 16, title: "Support Emails"),
                    _buildRadioButton(
                      value: SupportEmail.off,
                      title: "Off",
                      selectedValue: provider.supportEmail,
                      onTap: () => provider.setIsSupportEmail(SupportEmail.off),
                    ),
                    _buildRadioButton(
                      value: SupportEmail.on,
                      title: "On",
                      selectedValue: provider.supportEmail,
                      onTap: () => provider.setIsSupportEmail(SupportEmail.on),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildReminders(NotificationSettingProvider provider) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: loadRowWithIcon(
                  iconName: Icons.watch_later_outlined,
                  title: "REMINDERS",
                ),
              ),
              loadCircleIcon(
                backgroundColor: Colors.transparent,
                radius: 16,
                iconSize: 16,
                icon:
                    provider.isOpenReminder
                        ? Icons.arrow_downward
                        : Icons.arrow_forward,
                onTap: () {
                  provider.setIsOpenReminderMenu(!provider.isOpenReminder);
                },
              ),
            ],
          ),
          provider.isOpenReminder
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    SizedBox.shrink(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Set Event Location If Host",
                    ),
                    _buildRadioButton(
                      value: LocationReminder.off,
                      title: "Off",
                      selectedValue: provider.locationReminder,
                      onTap:
                          () => provider.setIsLocationReminder(
                            LocationReminder.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: LocationReminder.weekFromEventDate,
                      title: "1 Week From Event Date",
                      selectedValue: provider.locationReminder,
                      onTap:
                          () => provider.setIsLocationReminder(
                            LocationReminder.weekFromEventDate,
                          ),
                    ),
                    _buildRadioButton(
                      value: LocationReminder.daysFromEventDate,
                      title: "3 Days From Event Date",
                      selectedValue: provider.locationReminder,
                      onTap:
                          () => provider.setIsLocationReminder(
                            LocationReminder.daysFromEventDate,
                          ),
                    ),
                    _buildRadioButton(
                      value: LocationReminder.hoursFromEventDate,
                      title: "24 Hours From Event Date",
                      selectedValue: provider.locationReminder,
                      onTap:
                          () => provider.setIsLocationReminder(
                            LocationReminder.hoursFromEventDate,
                          ),
                    ),
                    loadDivider(),
                    loadTitleText(
                      fontSize: 16,
                      title: "Upcoming Event Date & Time",
                    ),
                    _buildRadioButton(
                      value: UpcomingEventReminder.off,
                      title: "Off",
                      selectedValue: provider.upcomingEventReminder,
                      onTap:
                          () => provider.setIsUpcomingEventReminder(
                            UpcomingEventReminder.off,
                          ),
                    ),
                    _buildRadioButton(
                      value: UpcomingEventReminder.weekFromEventDate,
                      title: "1 Week From Event Date",
                      selectedValue: provider.upcomingEventReminder,
                      onTap:
                          () => provider.setIsUpcomingEventReminder(
                            UpcomingEventReminder.weekFromEventDate,
                          ),
                    ),
                    _buildRadioButton(
                      value: UpcomingEventReminder.daysFromEventDate,
                      title: "3 Days From Event Date",
                      selectedValue: provider.upcomingEventReminder,
                      onTap:
                          () => provider.setIsUpcomingEventReminder(
                            UpcomingEventReminder.daysFromEventDate,
                          ),
                    ),
                    _buildRadioButton(
                      value: UpcomingEventReminder.hoursFromEventDate,
                      title: "24 Hours From Event Date",
                      selectedValue: provider.upcomingEventReminder,
                      onTap:
                          () => provider.setIsUpcomingEventReminder(
                            UpcomingEventReminder.hoursFromEventDate,
                          ),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildRadioButton<T>({
    required T value,
    required String title,
    required T selectedValue,
    required VoidCallback onTap,
  }) {
    final isSelected = selectedValue == value;
    return Row(
      children: [
        Expanded(child: loadSubTitleText(title: title)),
        loadCircleIcon(
          onTap: onTap,
          radius: 14,
          icon:
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          iconSize: 20,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
