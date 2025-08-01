import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:flutter/material.dart';

enum BringItemOption { yes, no, maybe }

class EventProvider extends ChangeNotifier {
  //Constant variable

  final List<EventModel> _listOfEvents = [
    EventModel(
      name: "Circle of Joy",
      category: "Travel",
      dateTime: "30-Jun-2025 08:00 PM",
      imageUrl: appEvent_2,
      location: "102 Jazz Blvd, New Orleans, LA 70130, USA",
      perTicket: 5.0,
      collected: 200.0,
      numberOfJoin: 12,
      host: true,
      totalVote: 900,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "Guitar Vibes",
      category: "Music",
      dateTime: "25-Jun-2025 07:00 PM",
      imageUrl: appEvent_4,
      location: "22 Sound Blvd, Nashville, TN 37201, USA",
      host: false,
    ),
    EventModel(
      name: "Taco Fest",
      category: "Food",
      dateTime: "21-Jun-2025 12:00 PM",
      imageUrl: appEvent_11,
      location: "55 Main Street, Austin, TX 78701, USA",
      host: false,
    ),
    EventModel(
      name: "Mind Modest",
      category: "Art",
      dateTime: "22-Jun-2025 11:00 AM",
      imageUrl: appEvent_3,
      location: "900 Art Lane, Chicago, IL 60601, USA",
      host: true,
      totalVote: 800,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "Canvas Carnival",
      category: "Art",
      dateTime: "22-Jun-2025 11:00 AM",
      imageUrl: appEvent_12,
      location: "900 Art Lane, Chicago, IL 60601, USA",
      host: true,
      totalVote: 800,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "Yoga is good for health",
      category: "Sport",
      dateTime: "23-Jun-2025 10:00 AM",
      imageUrl: appEvent_6,
      location: "456 Innovation Blvd, San Francisco, CA 94110, USA",
      host: false,
    ),
    EventModel(
      name: "Marathon 5K",
      category: "Sports",
      dateTime: "24-Jun-2025 06:30 AM",
      imageUrl: appEvent_5,
      location: "700 Sprint Street, Boston, MA 02110, USA",
      host: true,
      totalVote: 800,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "Vegan Delights Expo",
      category: "Food",
      dateTime: "26-Jun-2025 01:00 PM",
      imageUrl: appEvent_7,
      location: "81 Greenaway Ave, Portland, OR 97204, USA",
      host: false,
    ),
    EventModel(
      name: "Art in the Park",
      category: "Art",
      dateTime: "27-Jun-2025 03:00 PM",
      imageUrl: appEvent_8,
      location: "32 Sketch Drive, New York, NY 10003, USA",
      host: true,
      totalVote: 800,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "Hack the Future",
      category: "Technology",
      dateTime: "28-Jun-2025 09:00 AM",
      imageUrl: appEvent_9,
      location: "101 Silicon Street, Seattle, WA 98101, USA",
      host: false,
    ),
    EventModel(
      name: "Basketball Bash",
      category: "Sports",
      dateTime: "29-Jun-2025 05:00 PM",
      imageUrl: appEvent_10,
      location: "400 Slam Court, Miami, FL 33101, USA",
      host: false,
    ),
    EventModel(
      name: "Jazz Nights",
      category: "Music",
      dateTime: "30-Jun-2025 08:00 PM",
      imageUrl: appEvent_1,
      location: "102 Jazz Blvd, New Orleans, LA 70130, USA",
      host: true,
      totalVote: 800,
      chooseVenue: ["Miami", "Seattle", "Las Vegas", "Boston", "Atlanta"],
    ),
    EventModel(
      name: "BBQ Backyard Bash",
      category: "Food",
      dateTime: "01-July-2025 04:00 PM",
      imageUrl: appEvent_12,
      location: "56 Grill Road, Houston, TX 77002, USA",
      host: false,
    ),
    EventModel(
      name: "Street Murals Tour",
      category: "Art",
      dateTime: "02-July-2025 02:00 PM",
      imageUrl: appEvent_13,
      location: "12 Color Way, Philadelphia, PA 19106, USA",
      host: false,
    ),
  ];

  List<EventModel> get listOfEvents => _listOfEvents;

  final List<String> categories = [
    'Music',
    'Sport',
    'Dancing',
    'Study',
    'Art',
    'Theatre',
    'Technology',
    'Gaming',
    'Business',
    'Health & Fitness',
    'Education',
    'Travel',
    'Cooking',
    'Photography',
    'Networking',
    'Charity',
    'Spirituality',
    'Comedy',
    'Literature',
  ];
  final locationOption = ['Venue', 'Online Event', 'TBA'];
  final List<BringItemModel> _listOfItems = [
    BringItemModel(
      name: 'Water Bottle',
      qty: 24,
      description: '500ml packaged water',
      contributor: 'James Carter',
    ),
    BringItemModel(
      name: 'Paper Plates',
      qty: 50,
      description: 'Disposable, eco-friendly plates',
      contributor: 'Olivia Thompson',
    ),
    BringItemModel(
      name: 'Cutlery Set',
      qty: 50,
      description: 'Spoons, forks, knives',
      contributor: 'Sophia Davis',
    ),
    BringItemModel(
      name: 'Veg Biryani',
      qty: 1,
      description: 'Serves 20 guests',
      contributor: 'Liam Anderson',
    ),
  ];
  //----------------------- State Variable -----------------------
  // Event selection state
  String? selectedCategory;
  bool isCategoryOpen = false;
  bool isShareEvent = false;
  bool? isAcceptedEvent;
  bool isPollVote = false;
  bool showVenues = false;
  String? selectedVenue;

  // Date & time
  DateTime? selectedStartDate;
  String? selectedEndDate;
  String? startTime;
  String? endTime;

  // Event privacy
  bool isPublic = false;
  String? publicORprivate;

  // Event Image or Media
  String? imageUrl;

  //location
  int locationIndex = 0;

  //guest invite
  bool isShowGuest = true;

  //BringItem
  BringItemOption? _bringOption;
  BringItemOption? get bringOption => _bringOption;
  final List<BringItemModel> listOfItems = [];
  List<BringItemModel> get listOfItems1 => _listOfItems;

  //Wallet Process
  bool isRequiredTicket = false;
  bool isExpensesAfter = false;

  void setSelectedCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void setSelectedStartDate(DateTime startDate) {
    selectedStartDate = startDate;
    notifyListeners();
  }

  void setSelectedEndDate(String endDate) {
    selectedEndDate = endDate;
    notifyListeners();
  }

  void setSelectedStartTime(String startTime1) {
    startTime = startTime1;
    notifyListeners();
  }

  void setSelectedEndTime(String endTime1) {
    endTime = endTime1;
    notifyListeners();
  }

  void setPublicOrPrivate(bool eventType) {
    isPublic = eventType;
    notifyListeners();
  }

  void setPublicOrPrivateText(String value) {
    publicORprivate = value;
    notifyListeners();
  }

  void setImageUrl(String imageName) {
    imageUrl = imageName;
    notifyListeners();
  }

  void setOpenCategory(bool isOpen) {
    isCategoryOpen = isOpen;
    notifyListeners();
  }

  void setIsSharedEvent(bool val) {
    isShareEvent = val;
    notifyListeners();
  }

  void setLocationIndex(int inx) {
    locationIndex = inx;
    notifyListeners();
  }

  void setIsShowGuestList(bool invite) {
    isShowGuest = invite;
    notifyListeners();
  }

  //Bring Item
  void setBringOption(BringItemOption response) {
    _bringOption = response;
    notifyListeners();
  }

  void addBringItem(BringItemModel item) {
    listOfItems.add(item);
    listOfItems1.add(item);
    notifyListeners();
  }

  void removeBringItem(BringItemModel item) {
    listOfItems1.remove(item);
    notifyListeners();
  }

  void setIsRequiredTicket(bool value) {
    isRequiredTicket = value;
    notifyListeners();
  }

  void setIsExpensesAfter(bool value) {
    isExpensesAfter = value;
    notifyListeners();
  }

  void setIsAcceptedEvent(bool? value) {
    isAcceptedEvent = value;
    notifyListeners();
  }

  void setIsPollVoting(bool val) {
    isPollVote = val;
    notifyListeners();
  }

  void setShowChooseVenue(bool value) {
    showVenues = value;
    notifyListeners();
  }

  void setSelectedVenue(String venue) {
    selectedVenue = venue;
    notifyListeners();
  }

  EventModel? findEventById(String id) {
    try {
      return _listOfEvents.firstWhere((g) => g.id == id);
    } catch (e) {
      return null;
    }
  }
}

class BringItemModel {
  final String name;
  final int qty;
  final String description;
  final String? contributor;

  const BringItemModel({
    required this.name,
    required this.qty,
    required this.description,
    this.contributor,
  });
}
