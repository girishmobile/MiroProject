import 'dart:ffi';

import 'package:flutter/material.dart';

//Friend, Group, Request
enum FriendRequest { on, off }

enum AcceptedRequest { on, off }

enum GroupRequest { on, off }

//Events,Comments & Photos
enum EventInvited { off, fromPeopleOnMyFriendList, fromEveryone }

enum GuestEventInvited { off, fromGuests }

enum GuestUpdateEvent { off, fromPeopleOnMyFriendList, fromEveryone }

enum GuestRequestPayment { off, fromPeopleOnMyFriendList, fromEveryone }

//From GamePlan
enum GamePlanReminder { on, off }

enum GamePlanProduct { on, off }

enum GamePlanSupport { on, off }

enum GamePlanLogin { on, off }

//Event Reminder
enum LocationReminder {
  off,
  weekFromEventDate,
  daysFromEventDate,
  hoursFromEventDate,
}

enum UpcomingEventReminder {
  off,
  weekFromEventDate,
  daysFromEventDate,
  hoursFromEventDate,
}

//EMAIL AND SMS
enum ReminderEmail { off, on }

enum ProductEmail { off, on }

enum NewEmail { off, on }

enum SupportEmail { off, on }

class NotificationSettingProvider extends ChangeNotifier {
  bool _isOpenEventMenu = true;
  bool _isOpenFriendMenu = true;
  bool _isOpenGamePlan = true;
  bool _isOpenEmailSMS = true;
  bool _isOpenReminder = true;

  //Friend
  FriendRequest _friendRequest = FriendRequest.on;
  AcceptedRequest _acceptedRequest = AcceptedRequest.on;
  GroupRequest _groupRequest = GroupRequest.on;
  //Event
  EventInvited _eventInvited = EventInvited.fromPeopleOnMyFriendList;
  GuestEventInvited _guestEventInvited = GuestEventInvited.fromGuests;
  GuestUpdateEvent _guestUpdateEvent =
      GuestUpdateEvent.fromPeopleOnMyFriendList;
  GuestRequestPayment _guestRequestPayment =
      GuestRequestPayment.fromPeopleOnMyFriendList;

  //GamePlan
  GamePlanReminder _gamePlanReminder = GamePlanReminder.on;
  GamePlanProduct _gamePlanProduct = GamePlanProduct.on;
  GamePlanSupport _gamePlanSupport = GamePlanSupport.on;
  GamePlanLogin _gamePlanLogin = GamePlanLogin.on;

  //Event Reminder
  LocationReminder _locationReminder = LocationReminder.weekFromEventDate;
  UpcomingEventReminder _upcomingEventReminder =
      UpcomingEventReminder.weekFromEventDate;

  //EMAIL and SMS
  ReminderEmail _reminderEmail = ReminderEmail.on;
  ProductEmail _productEmail = ProductEmail.on;
  NewEmail _newEmail = NewEmail.on;
  SupportEmail _supportEmail = SupportEmail.on;

  bool get isOpenEventMenu => _isOpenEventMenu;
  bool get isOpenFriendMenu => _isOpenFriendMenu;
  bool get isOpenGamePlan => _isOpenGamePlan;
  bool get isOpenEmailSMS => _isOpenEmailSMS;
  bool get isOpenReminder => _isOpenReminder;

  FriendRequest get friendRequest => _friendRequest;
  AcceptedRequest get acceptedRequest => _acceptedRequest;
  GroupRequest get groupRequest => _groupRequest;
  EventInvited get eventInvited => _eventInvited;
  GuestEventInvited get guestEventInvited => _guestEventInvited;
  GuestUpdateEvent get guestUpdateEvent => _guestUpdateEvent;
  GuestRequestPayment get guestRequestPayment => _guestRequestPayment;

  //GamePlan
  GamePlanReminder get gamePlanReminder => _gamePlanReminder;
  GamePlanProduct get gamePlanProduct => _gamePlanProduct;
  GamePlanSupport get gamePlanSupport => _gamePlanSupport;
  GamePlanLogin get gamePlanLogin => _gamePlanLogin;

  //Event Reminder
  LocationReminder get locationReminder => _locationReminder;
  UpcomingEventReminder get upcomingEventReminder => _upcomingEventReminder;
  //EMAIL and SMS
  ReminderEmail get reminderEmail => _reminderEmail;
  ProductEmail get productEmail => _productEmail;
  NewEmail get newEmail => _newEmail;
  SupportEmail get supportEmail => _supportEmail;

  void setIsOpenEventMenu(bool value) {
    _isOpenEventMenu = value;
    notifyListeners();
  }

  void setIsOpenFriendMenu(bool value) {
    _isOpenFriendMenu = value;
    notifyListeners();
  }

  void setIsOpenGamePlanMenu(bool value) {
    _isOpenGamePlan = value;
    notifyListeners();
  }

  void setIsOpenReminderMenu(bool value) {
    _isOpenReminder = value;
    notifyListeners();
  }

  void setIsOpenEmailSMSMenu(bool value) {
    _isOpenEmailSMS = value;
    notifyListeners();
  }

  void setIsFriendRequest(FriendRequest value) {
    _friendRequest = value;
    notifyListeners();
  }

  void setIsAcceptedRequest(AcceptedRequest value) {
    _acceptedRequest = value;
    notifyListeners();
  }

  void setIsGroupRequest(GroupRequest value) {
    _groupRequest = value;
    notifyListeners();
  }

  void setIsEventInvitedTo(EventInvited value) {
    _eventInvited = value;
    notifyListeners();
  }

  void setIsGuestEventInvited(GuestEventInvited value) {
    _guestEventInvited = value;
    notifyListeners();
  }

  void setIsGuestUpdateEvent(GuestUpdateEvent value) {
    _guestUpdateEvent = value;
    notifyListeners();
  }

  void setIsGuestRequestPayment(GuestRequestPayment value) {
    _guestRequestPayment = value;
    notifyListeners();
  }

  //GamePlan
  void setIsGamePlanReminder(GamePlanReminder value) {
    _gamePlanReminder = value;
    notifyListeners();
  }

  void setIsGamePlanProduct(GamePlanProduct value) {
    _gamePlanProduct = value;
    notifyListeners();
  }

  void setIsGamePlanSupport(GamePlanSupport value) {
    _gamePlanSupport = value;
    notifyListeners();
  }

  void setIsGamePlanLogin(GamePlanLogin value) {
    _gamePlanLogin = value;
    notifyListeners();
  }

  //Event Reminder
  void setIsLocationReminder(LocationReminder value) {
    _locationReminder = value;
    notifyListeners();
  }

  void setIsUpcomingEventReminder(UpcomingEventReminder value) {
    _upcomingEventReminder = value;
    notifyListeners();
  }

  //EMAIL ANS SMS
  void setIsReminderEmail(ReminderEmail value) {
    _reminderEmail = value;
    notifyListeners();
  }

  void setIsProductEmail(ProductEmail value) {
    _productEmail = value;
    notifyListeners();
  }

  void setIsNewEmail(NewEmail value) {
    _newEmail = value;
    notifyListeners();
  }

  void setIsSupportEmail(SupportEmail value) {
    _supportEmail = value;
    notifyListeners();
  }
}
