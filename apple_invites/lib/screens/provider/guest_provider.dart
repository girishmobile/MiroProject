import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/guest_model.dart';
import 'package:flutter/material.dart';

class GuestProvider extends ChangeNotifier {
  final List<GuestModel> _guests = [];
  GuestProvider() {
    _initializeGuests();
  }
  void _initializeGuests() {
    final Map<String, List<GuestModel>> guestList = {
      'Accepted': [
        GuestModel(
          name: 'Alice Johnson',
          email: "alice.johnson@example.com",
          status: GuestStatus.accepted,
          subTitle: 'iOS developer',
          imageUrl:
              "https://images.unsplash.com/photo-1623517006691-00db997b4c58?q=80&w=1794&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        GuestModel(
          name: "Bob Smith",
          email: "bob.smith@example.com",
          status: GuestStatus.accepted,
          subTitle: 'Flutter developer',
          imageUrl:
              'https://images.unsplash.com/photo-1658281097220-eb7672eed00b?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GuestModel(
          name: "Charlie Daniels",
          email: "charlie.daniels@example.com",
          status: GuestStatus.accepted,
          subTitle: 'Project Manager',
          imageUrl:
              'https://images.unsplash.com/photo-1515463892140-58a22e37ff72?q=80&w=1803&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GuestModel(
          name: "Danial Victory",
          email: "danial.victory@example.com",
          status: GuestStatus.accepted,
          imageUrl:
              'https://images.unsplash.com/photo-1650658804900-10d2eee66295?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'Project Manager',
        ),
        GuestModel(
          name: "Ean Beth",
          email: "ean.beth@example.com",
          status: GuestStatus.accepted,
          imageUrl:
              'https://images.unsplash.com/photo-1630004184878-c60794d1c105?q=80&w=1816&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: null,
        ),
        GuestModel(
          name: "Franklin Jobs",
          email: "franklin.jobs@example.com",
          status: GuestStatus.accepted,
          imageUrl:
              'https://images.unsplash.com/photo-1484186694682-a940e4b1a9f7?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: null,
        ),
        GuestModel(
          name: "Henry Kassel",
          email: "henry.kassel@example.com",
          status: GuestStatus.accepted,
          subTitle: 'QA Engineer',
          imageUrl:
              'https://images.unsplash.com/photo-1568633782872-67d29d4615d2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GuestModel(
          name: "Irene Watson",
          email: "irene.watson@example.com",
          status: GuestStatus.accepted,
          subTitle: 'Data Analyst',
          imageUrl:
              'https://images.unsplash.com/photo-1512552215387-9aaa767d4799?q=80&w=1840&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GuestModel(
          name: "Jack Black",
          email: "jack.black@example.com",
          status: GuestStatus.accepted,
          subTitle: 'UI/UX Designer',
          imageUrl:
              'https://images.unsplash.com/photo-1638734922465-461059520ead?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GuestModel(
          name: "Karen Smith",
          email: "karen.smith@example.com",
          status: GuestStatus.accepted,
          subTitle: 'HR department',
          imageUrl:
              'https://images.unsplash.com/photo-1615751596346-9df8006e5381?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ],
      'Rejected': [
        GuestModel(
          name: "Leo Thompson",
          email: "leo.thompson@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1633875160137-538af5c5ca88?q=80&w=1750&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

          subTitle: 'Android developer',
        ),
        GuestModel(
          name: "Mona Lisa",
          email: "mona.lisa@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1718999398032-8fc0a58ed9c7?q=80&w=1449&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'Flutter developer',
        ),
        GuestModel(
          name: "Nathan Drake",
          email: "nathan.drake@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1732103776871-41d6d83d6b1a?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'HR Manager',
        ),
        GuestModel(
          name: "Olivia Grant",
          email: "olivia.grant@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'Project Manager',
        ),
        GuestModel(
          name: "Peter Parker",
          email: "peter.parker@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1604804531906-3c65b52e0681?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: null,
        ),
        GuestModel(
          name: "Quincy Adams",
          email: "quincy.adams@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1693910175141-e8dcca774ab4?q=80&w=1458&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

          subTitle: null,
        ),
        GuestModel(
          name: "Rachel Green",
          email: "rachel.green@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

          subTitle: 'QA Engineer',
        ),
        GuestModel(
          name: "Steve Rogers",
          email: "steve.rogers@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1534330786040-317bdb76ccff?q=80&w=1817&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'Data Analyst',
        ),
        GuestModel(
          name: "Tony Stark",
          email: "tony.stark@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1695990190014-306e1dc5e734?q=80&w=1798&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'Html Designer',
        ),
        GuestModel(
          name: "Uma Thurman",
          email: "uma.thurman@example.com",
          status: GuestStatus.rejected,
          imageUrl:
              'https://images.unsplash.com/photo-1595760780346-f972eb49709f?q=80&w=1427&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          subTitle: 'HR department',
        ),
      ],
    };
    guestList['Accepted']?.forEach((guest) {
      _guests.add(
        GuestModel(
          name: guest.name,
          subTitle: guest.subTitle,
          imageUrl: guest.imageUrl,
          status: GuestStatus.accepted,
          email: guest.email,
        ),
      );
    });

    guestList['Rejected']?.forEach((guest) {
      _guests.add(
        GuestModel(
          name: guest.name,
          email: guest.email,
          subTitle: guest.subTitle,
          imageUrl: guest.imageUrl,
          status: GuestStatus.rejected,
        ),
      );
    });
  }

  List<GuestModel> get allGuests => [..._guests];
  List<GuestModel> get acceptedGuests =>
      _guests.where((g) => g.status == GuestStatus.accepted).toList();
  List<GuestModel> get rejectedGuests =>
      _guests.where((g) => g.status == GuestStatus.rejected).toList();
}
