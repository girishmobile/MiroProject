import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:flutter/material.dart';

class FriendProvider extends ChangeNotifier {
  final List<ContactModel> listOfContacts = [
    ContactModel(
      name: "Alice Johnson",
      phoneNumber: "123-456-7890",
      email: "alice.johnson@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1623517006691-00db997b4c58?q=80&w=1794&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Bob Smith",
      email: "bob.smith@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1658281097220-eb7672eed00b?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      phoneNumber: "234-567-8901",
      description: null,
    ),
    ContactModel(
      name: "Charlie Daniels",
      email: "charlie.daniels@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1515463892140-58a22e37ff72?q=80&w=1803&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      phoneNumber: "345-678-9012",
      description: null,
    ),
    ContactModel(
      name: "Danial Victory",
      email: "danial.victory@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1650658804900-10d2eee66295?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      phoneNumber: "456-789-0123",
      description: null,
    ),
    ContactModel(
      name: "Ean Beth",
      email: "ean.beth@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1630004184878-c60794d1c105?q=80&w=1816&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
      phoneNumber: "567-890-1234",
    ),
    ContactModel(
      name: "Franklin Jobs",
      phoneNumber: "678-901-2345",
      email: "franklin.jobs@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1484186694682-a940e4b1a9f7?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Gilchrist Adam",
      phoneNumber: "789-012-3456",
      email: "gilchrist.adam@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1484186139897-d5fc6b908812?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Henry Kassel",
      phoneNumber: "890-123-4567",
      email: "henry.kassel@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1568633782872-67d29d4615d2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Irene Watson",
      phoneNumber: "901-234-5678",
      email: "irene.watson@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1512552215387-9aaa767d4799?q=80&w=1840&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Jack Black",
      phoneNumber: "123-987-6543",
      email: "jack.black@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1638734922465-461059520ead?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Karen Smith",
      phoneNumber: "234-876-5432",
      email: "karen.smith@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1615751596346-9df8006e5381?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Leo Thompson",
      phoneNumber: "345-765-4321",
      email: "leo.thompson@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1633875160137-538af5c5ca88?q=80&w=1750&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: "desc",
    ),
    ContactModel(
      name: "Mona Lisa",
      phoneNumber: "456-654-3210",
      email: "mona.lisa@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1718999398032-8fc0a58ed9c7?q=80&w=1449&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Nathan Drake",
      phoneNumber: "567-543-2109",
      email: "nathan.drake@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1732103776871-41d6d83d6b1a?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Olivia Grant",
      phoneNumber: "678-432-1098",
      email: "olivia.grant@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Peter Parker",
      phoneNumber: "789-321-0987",
      email: "peter.parker@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1604804531906-3c65b52e0681?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Quincy Adams",
      phoneNumber: "890-210-9876",
      email: "quincy.adams@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1693910175141-e8dcca774ab4?q=80&w=1458&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Rachel Green",
      phoneNumber: "901-109-8765",
      email: "rachel.green@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Steve Rogers",
      phoneNumber: "123-456-1234",
      email: "steve.rogers@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1534330786040-317bdb76ccff?q=80&w=1817&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Tony Stark",
      phoneNumber: "234-567-2345",
      email: "tony.stark@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1695990190014-306e1dc5e734?q=80&w=1798&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Uma Thurman",
      phoneNumber: "345-678-3456",
      email: "uma.thurman@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1595760780346-f972eb49709f?q=80&w=1427&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Victor Stone",
      phoneNumber: "456-789-4567",
      email: "victor.stone@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1519625594242-7db544018926?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Wanda Maxim",
      phoneNumber: "567-890-5678",
      email: "wanda.maxim@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1630520138985-43ef3c8b6bf3?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Lander Cage",
      phoneNumber: "678-901-6789",
      email: "lander.cage@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1630520778141-4eed402f4f4d?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Yama Swahili",
      phoneNumber: "789-012-7890",
      email: "yama.swahili@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1612427404252-f424ef7a7cf5?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Zoe Kraits",
      phoneNumber: "890-123-8901",
      email: "zoe.kraits@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1628875986390-15280f9865e5?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Adam Levine",
      phoneNumber: "901-234-9012",
      email: "adam.levine@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1655313709303-bb0479eeaa2b?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Bella Swan",
      phoneNumber: "123-345-0123",
      email: "bella.swan@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1612216533107-3a2f20e6fe29?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Calvin Klein",
      phoneNumber: "234-456-1234",
      email: "calvin.klein@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1678855746382-15173a12fb38?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Diana Prince",
      phoneNumber: "345-567-2345",
      email: "diana.prince@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1485893086445-ed75865251e0?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Elliot Page",
      phoneNumber: "456-678-3456",
      email: "elliot.page@example.com",
      profilePic: null,
      description: null,
    ),
    ContactModel(
      name: "Felicity Jones",
      phoneNumber: "567-789-4567",
      email: "felicity.jones@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1612847759772-17b4d420af34?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "George Looney",
      phoneNumber: "678-890-5678",
      email: "george.looney@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1511763368359-c0d890ede0c2?q=80&w=1756&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Harvey Specter",
      phoneNumber: "789-901-6789",
      email: "harvey.specter@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1636355747094-1a2f4019b78c?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Ziggy Azalea",
      phoneNumber: "890-012-7890",
      email: "ziggy.azalea@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1583058905141-deef2de746bb?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Jane Foster",
      phoneNumber: "901-123-8901",
      email: "jane.foster@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1583060005417-c10cc55e3bb6?q=80&w=3641&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Kyle Reese",
      phoneNumber: "123-234-9012",
      email: "kyle.reese@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1654765437547-6b572f52ee1a?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Lana Del Rey",
      email: "lana.delrey@example.com",
      phoneNumber: "234-345-0123",
      profilePic:
          'https://images.unsplash.com/photo-1595687825617-10c4d36566e7?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Mike Ross",
      email: "mike.ross@example.com",
      phoneNumber: "345-456-1234",
      profilePic:
          'https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Nina Dore",
      phoneNumber: "456-567-2345",
      email: "nina.dore@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1627903110580-3185f8b7258d?q=80&w=1821&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Oscar Isaac",
      email: "oscar.isaac@example.com",
      phoneNumber: "567-678-3456",
      profilePic:
          'https://images.unsplash.com/photo-1486302913014-862923f5fd48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Pam Basely",
      phoneNumber: "678-789-4567",
      email: "pam.basely@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1633197011007-34da7df0253b?q=80&w=1758&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Quinn Fabra",
      phoneNumber: "789-890-5678",
      email: "quinn.fabra@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1593439411281-6500cf61961c?q=80&w=3880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Ron Weasels",
      phoneNumber: "890-901-6789",
      email: "ron.weasels@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1610643120476-b458f324527c?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Sam Winchester",
      phoneNumber: "901-012-7890",
      email: "sam.winchester@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1697826988699-06f3b701fc1b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDczfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Tom Holland",
      phoneNumber: "123-123-8901",
      email: "tom.holland@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1588641750012-474003b37f49?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ContactModel(
      name: "Ursula Buffy",
      phoneNumber: "234-234-9012",
      email: "ursula.buffy@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1656329672365-a19c06a2be02?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Vera Formica",
      email: "vera.formica@example.com",
      phoneNumber: "345-345-0123",
      profilePic:
          'https://images.unsplash.com/photo-1634586401618-a5f45e89ea9a?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Will Smith",
      phoneNumber: "456-456-1234",
      email: "will.smith@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1728621999954-9c8ee3f85fa8?q=80&w=1451&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Xenia Onetup",
      phoneNumber: "567-567-2345",
      email: "xenia.onetup@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1550428083-7019ebe39b45?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjQwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
    ),
    ContactModel(
      name: "Jasmine Beth",
      phoneNumber: "678-678-3456",
      email: "jasmine.beth@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1681377629627-44d188ecaa16?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzgxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Zach Morris",
      phoneNumber: "789-789-4567",
      email: "zach.morris@example.com",
      profilePic: null,
      description: null,
    ),
    ContactModel(
      name: "Arcana Grande",
      phoneNumber: "890-890-5678",
      email: "arcana.grande@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1565622124507-e7815b561cc8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzg4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Brad Pitt",
      phoneNumber: "901-901-6789",
      email: "brad.pitt@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1681681789591-6e3d83829e8a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Cameron Dial",
      phoneNumber: "123-012-7890",
      email: "cameron.dial@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1595900743418-e8103d62ccac?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDI3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Dense Washington",
      phoneNumber: "234-123-8901",
      email: "dense.washington@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1629096209450-dfb91df44ce2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTMzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Emma Watson",
      phoneNumber: "345-234-9012",
      email: "emma.watson@example.com",
      description: null,
      profilePic:
          'https://images.unsplash.com/photo-1751470433729-b7d9bf97b811?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTYyfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
    ),
    ContactModel(
      name: "Finn Welfare",
      phoneNumber: "456-345-0123",
      email: "finn.welfare@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1534945900825-63cc0b6dd7d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTkwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Gal Gavot",
      phoneNumber: "567-456-1234",
      email: "gal.gavot@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1697672762740-2435ef602a9d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Hugh Hackman",
      email: "hugh.hackman@example.com",
      phoneNumber: "678-567-2345",
      profilePic:
          'https://images.unsplash.com/photo-1518991669955-9c7e78ec80ca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjE3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Isea Fisher",
      phoneNumber: "789-678-3456",
      email: "isea.fisher@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1678214839727-091992974acc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Jason Momma",
      phoneNumber: "890-789-4567",
      email: "jason.momma@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1724331061917-e7b17e5f86ba?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjQ4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Kier Knightly",
      phoneNumber: "901-890-5678",
      email: "kier.knightly@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1600206953976-98315cf21e14?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njc2fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Liam Hemsworth",
      phoneNumber: "123-901-6789",
      email: "liam.hemsworth@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1569605292330-189ccf83f98b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjcxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Mica Unis",
      phoneNumber: "234-012-7890",
      email: "mica.unis@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1584997159889-8bb96d0a2217?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njg3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
    ContactModel(
      name: "Noah Centene",
      phoneNumber: "345-123-8901",
      email: "noah.centene@example.com",
      profilePic:
          'https://images.unsplash.com/photo-1630280717628-7d0d071cf2e3?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njk0fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
      description: null,
    ),
  ];

  bool isEmptyFriend = true;

  void setIsEmptyFriends(bool value) {
    isEmptyFriend = value;
    notifyListeners();
  }

  //For selection process....
  final Map<String, bool> _selectedContacts = {};
  //Expose a copy or unmodifiable view

  Map<String, bool> get selectedContacts => _selectedContacts;
  bool isSelected(String name) => _selectedContacts[name] ?? false;

  void toggleSelection(String name, bool isSelected) {
    _selectedContacts[name] = isSelected;
    notifyListeners();
  }

  void clearSelection() {
    _selectedContacts.clear();
    notifyListeners();
  }

  List<ContactModel> get selectedContactList {
    return listOfContacts.where((c) => isSelected(c.name)).toList();
  }
}
