import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/group_member_model.dart';
import 'package:apple_invites/screens/models/group_model.dart';
import 'package:flutter/material.dart';

// final sampleUser = UserModel(
//   email: "emilyjackson@example.com",
//   name: "Emily Jackson",
//   mobileNumber: "+91 9558697986",
//   dateOfBirth: "01-Feb-1990",
//   imageUrl:
//       "",
// );

class GroupProvider extends ChangeNotifier {
  final List<GroupModel> _groupList = [
    GroupModel(
      name: 'Art Admirers',
      subTitle: 'Best Art Admirers in the USA',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1710068145623-e972cc61ac10?q=80&w=1839&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Alice Johnson",
          phone: "123-456-7890",
          email: "alice.johnson@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1623517006691-00db997b4c58?q=80&w=1794&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Bob Smith",
          phone: "234-567-8901",
          email: "bob.smith@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1658281097220-eb7672eed00b?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Charlie Daniels",
          phone: "345-678-9012",
          email: "charlie.daniels@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1515463892140-58a22e37ff72?q=80&w=1803&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Danial Victory",
          phone: "456-789-0123",
          email: "danial.victory@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1650658804900-10d2eee66295?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Ean Beth",
          phone: "567-890-1234",
          email: "ean.beth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1630004184878-c60794d1c105?q=80&w=1816&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Franklin Jobs",
          phone: "678-901-2345",
          email: "franklin.jobs@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1484186694682-a940e4b1a9f7?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Gilchrist Adam",
          phone: "789-012-3456",
          email: "gilchrist.adam@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1484186139897-d5fc6b908812?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Henry Kassel",
          phone: "890-123-4567",
          email: "henry.kassel@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1568633782872-67d29d4615d2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Music Lovers',
      subTitle: 'Feel Every Note, Live Every Beat',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1579967844753-fa9cdd10a9c0?q=80&w=1829&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Irene Watson",
          phone: "901-234-5678",
          email: "irene.watson@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1512552215387-9aaa767d4799?q=80&w=1840&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Jack Black",
          phone: "123-987-6543",
          email: "jack.black@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1638734922465-461059520ead?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Karen Smith",
          phone: "234-876-5432",
          email: "karen.smith@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1615751596346-9df8006e5381?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Leo Thompson",
          phone: "345-765-4321",
          email: "leo.thompson@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1633875160137-538af5c5ca88?q=80&w=1750&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: "desc",
        ),
        GroupMemberModel(
          name: "Mona Lisa",
          phone: "456-654-3210",
          email: "mona.lisa@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1718999398032-8fc0a58ed9c7?q=80&w=1449&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Nathan Drake",
          phone: "567-543-2109",
          email: "nathan.drake@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1732103776871-41d6d83d6b1a?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Tech Titans',
      subTitle: 'The Minds Behind the Machines',
      isNetwork: true,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Olivia Grant",
          phone: "678-432-1098",
          email: "olivia.grant@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Peter Parker",
          phone: "789-321-0987",
          email: "peter.parker@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1604804531906-3c65b52e0681?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Quincy Adams",
          phone: "890-210-9876",
          email: "quincy.adams@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1693910175141-e8dcca774ab4?q=80&w=1458&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Rachel Green",
          phone: "901-109-8765",
          email: "rachel.green@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Steve Rogers",
          phone: "123-456-1234",
          email: "steve.rogers@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1534330786040-317bdb76ccff?q=80&w=1817&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Tony Stark",
          phone: "234-567-2345",
          email: "tony.stark@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1695990190014-306e1dc5e734?q=80&w=1798&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
      imageUrl:
          'https://images.unsplash.com/photo-1499673610122-01c7122c5dcb?q=80&w=1927&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    GroupModel(
      name: 'Fitness Freaks',
      subTitle: 'Most priority of health',
      isNetwork: true,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Uma Thurman",
          phone: "345-678-3456",
          email: "uma.thurman@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1595760780346-f972eb49709f?q=80&w=1427&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Victor Stone",
          phone: "456-789-4567",
          email: "victor.stone@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1519625594242-7db544018926?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Wanda Maxim",
          phone: "567-890-5678",
          email: "wanda.maxim@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1630520138985-43ef3c8b6bf3?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Lander Cage",
          phone: "678-901-6789",
          email: "lander.cage@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1630520778141-4eed402f4f4d?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Yama Swahili",
          phone: "789-012-7890",
          email: "yama.swahili@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1612427404252-f424ef7a7cf5?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Zoe Kraits",
          phone: "890-123-8901",
          email: "zoe.kraits@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1628875986390-15280f9865e5?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
      imageUrl:
          "https://images.unsplash.com/photo-1520877745935-616158eb7fcc?q=80&w=1833&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    GroupModel(
      name: 'Bookworms United',
      isNetwork: true,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Adam Levine",
          phone: "901-234-9012",
          email: "adam.levine@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1655313709303-bb0479eeaa2b?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Bella Swan",
          phone: "123-345-0123",
          email: "bella.swan@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1612216533107-3a2f20e6fe29?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Calvin Klein",
          phone: "234-456-1234",
          email: "calvin.klein@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1678855746382-15173a12fb38?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Diana Prince",
          phone: "345-567-2345",
          email: "diana.prince@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1485893086445-ed75865251e0?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Elliot Page",
          phone: "456-678-3456",
          email: "elliot.page@example.com",
          imageUrl: null,
          description: null,
        ),
      ],
      imageUrl:
          'https://images.unsplash.com/photo-1593640475850-83be133a4663?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    GroupModel(
      name: 'Gaming Legends',
      subTitle: 'Next generation rai',
      isNetwork: true,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Gal Gavot",
          phone: "567-456-1234",
          email: "gal.gavot@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1697672762740-2435ef602a9d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Hugh Hackman",
          email: "hugh.hackman@example.com",
          phone: "678-567-2345",
          imageUrl:
              'https://images.unsplash.com/photo-1518991669955-9c7e78ec80ca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjE3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Isea Fisher",
          phone: "789-678-3456",
          email: "isea.fisher@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1678214839727-091992974acc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Jason Momma",
          phone: "890-789-4567",
          email: "jason.momma@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1724331061917-e7b17e5f86ba?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjQ4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Kier Knightly",
          phone: "901-890-5678",
          email: "kier.knightly@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1600206953976-98315cf21e14?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njc2fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Liam Hemsworth",
          phone: "123-901-6789",
          email: "liam.hemsworth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1569605292330-189ccf83f98b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjcxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
      imageUrl: dummyImageUrl,
    ),
    GroupModel(
      name: 'Health Hustlers',
      subTitle: 'Where Discipline Meets Lifestyle',
      isNetwork: true,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Felicity Jones",
          phone: "567-789-4567",
          email: "felicity.jones@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1612847759772-17b4d420af34?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "George Looney",
          phone: "678-890-5678",
          email: "george.looney@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1511763368359-c0d890ede0c2?q=80&w=1756&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Harvey Specter",
          phone: "789-901-6789",
          email: "harvey.specter@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1636355747094-1a2f4019b78c?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Ziggy Azalea",
          phone: "890-012-7890",
          email: "ziggy.azalea@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1583058905141-deef2de746bb?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Mike Ross",
          email: "mike.ross@example.com",
          phone: "345-456-1234",
          imageUrl:
              'https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Nina Dore",
          phone: "456-567-2345",
          email: "nina.dore@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1627903110580-3185f8b7258d?q=80&w=1821&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Oscar Isaac",
          email: "oscar.isaac@example.com",
          phone: "567-678-3456",
          imageUrl:
              'https://images.unsplash.com/photo-1486302913014-862923f5fd48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
      imageUrl:
          'https://images.unsplash.com/photo-1485727749690-d091e8284ef3?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    GroupModel(
      imageUrl:
          'https://images.unsplash.com/photo-1615454299901-de13b71ecaae?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Study Buddies',
      isNetwork: true,
      subTitle: 'Learn Together, Grow Together',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Brad Pitt",
          phone: "901-901-6789",
          email: "brad.pitt@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1681681789591-6e3d83829e8a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Cameron Dial",
          phone: "123-012-7890",
          email: "cameron.dial@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1595900743418-e8103d62ccac?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDI3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Dense Washington",
          phone: "234-123-8901",
          email: "dense.washington@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1629096209450-dfb91df44ce2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTMzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Emma Watson",
          phone: "345-234-9012",
          email: "emma.watson@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1751470433729-b7d9bf97b811?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTYyfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
        ),
        GroupMemberModel(
          name: "Finn Welfare",
          phone: "456-345-0123",
          email: "finn.welfare@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1534945900825-63cc0b6dd7d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTkwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Gal Gavot",
          phone: "567-456-1234",
          email: "gal.gavot@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1697672762740-2435ef602a9d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Hugh Hackman",
          email: "hugh.hackman@example.com",
          phone: "678-567-2345",
          imageUrl:
              'https://images.unsplash.com/photo-1518991669955-9c7e78ec80ca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjE3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Isea Fisher",
          phone: "789-678-3456",
          email: "isea.fisher@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1678214839727-091992974acc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Photography Circle',
      subTitle: 'Capturing Moments, Framing Stories',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1603574670812-d24560880210?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Tom Holland",
          phone: "123-123-8901",
          email: "tom.holland@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1588641750012-474003b37f49?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Ursula Buffy",
          phone: "234-234-9012",
          email: "ursula.buffy@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1656329672365-a19c06a2be02?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Vera Formica",
          email: "vera.formica@example.com",
          phone: "345-345-0123",
          imageUrl:
              'https://images.unsplash.com/photo-1634586401618-a5f45e89ea9a?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Will Smith",
          phone: "456-456-1234",
          email: "will.smith@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1728621999954-9c8ee3f85fa8?q=80&w=1451&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Xenia Onetup",
          phone: "567-567-2345",
          email: "xenia.onetup@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1550428083-7019ebe39b45?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjQwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
        ),
        GroupMemberModel(
          name: "Jasmine Beth",
          phone: "678-678-3456",
          email: "jasmine.beth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1681377629627-44d188ecaa16?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzgxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Zach Morris",
          phone: "789-789-4567",
          email: "zach.morris@example.com",
          imageUrl: null,
          description: null,
        ),
        GroupMemberModel(
          name: "Arcana Grande",
          phone: "890-890-5678",
          email: "arcana.grande@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1565622124507-e7815b561cc8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzg4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Travel Troop',
      subTitle: 'Find Your Next Destination, With Friends',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1678270661787-eb116a04b6cb?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Mike Ross",
          email: "mike.ross@example.com",
          phone: "345-456-1234",
          imageUrl:
              'https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        GroupMemberModel(
          name: "Nina Dore",
          phone: "456-567-2345",
          email: "nina.dore@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1627903110580-3185f8b7258d?q=80&w=1821&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Oscar Isaac",
          email: "oscar.isaac@example.com",
          phone: "567-678-3456",
          imageUrl:
              'https://images.unsplash.com/photo-1486302913014-862923f5fd48?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Pam Basely",
          phone: "678-789-4567",
          email: "pam.basely@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1633197011007-34da7df0253b?q=80&w=1758&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Quinn Fabra",
          phone: "789-890-5678",
          email: "quinn.fabra@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1593439411281-6500cf61961c?q=80&w=3880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Ron Weasels",
          phone: "890-901-6789",
          email: "ron.weasels@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1610643120476-b458f324527c?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Sam Winchester",
          phone: "901-012-7890",
          email: "sam.winchester@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1697826988699-06f3b701fc1b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDczfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Nature Explorers',
      subTitle: 'Adventure Awaits in Every Leaf and Stone',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1666178070735-dc494239a0d0?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Felicity Jones",
          phone: "567-789-4567",
          email: "felicity.jones@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1612847759772-17b4d420af34?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "George Looney",
          phone: "678-890-5678",
          email: "george.looney@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1511763368359-c0d890ede0c2?q=80&w=1756&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Harvey Specter",
          phone: "789-901-6789",
          email: "harvey.specter@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1636355747094-1a2f4019b78c?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Ziggy Azalea",
          phone: "890-012-7890",
          email: "ziggy.azalea@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1583058905141-deef2de746bb?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Jane Foster",
          phone: "901-123-8901",
          email: "jane.foster@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1583060005417-c10cc55e3bb6?q=80&w=3641&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Kyle Reese",
          phone: "123-234-9012",
          email: "kyle.reese@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1654765437547-6b572f52ee1a?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Lana Del Rey",
          email: "lana.delrey@example.com",
          phone: "234-345-0123",
          imageUrl:
              'https://images.unsplash.com/photo-1595687825617-10c4d36566e7?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Movie Buffs',
      isNetwork: false,
      imageUrl: null,
      subTitle: null,
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Jason Momma",
          phone: "890-789-4567",
          email: "jason.momma@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1724331061917-e7b17e5f86ba?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjQ4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Kier Knightly",
          phone: "901-890-5678",
          email: "kier.knightly@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1600206953976-98315cf21e14?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njc2fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Liam Hemsworth",
          phone: "123-901-6789",
          email: "liam.hemsworth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1569605292330-189ccf83f98b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjcxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Mica Unis",
          phone: "234-012-7890",
          email: "mica.unis@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1584997159889-8bb96d0a2217?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njg3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Noah Centene",
          phone: "345-123-8901",
          email: "noah.centene@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1630280717628-7d0d071cf2e3?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njk0fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Business Brains',
      subTitle: 'Strategic Thinking Starts Here',
      isNetwork: true,
      imageUrl:
          'https://images.unsplash.com/photo-1585399090149-de01d4c28e70?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Gal Gavot",
          phone: "567-456-1234",
          email: "gal.gavot@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1697672762740-2435ef602a9d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Hugh Hackman",
          email: "hugh.hackman@example.com",
          phone: "678-567-2345",
          imageUrl:
              'https://images.unsplash.com/photo-1518991669955-9c7e78ec80ca?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjE3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Isea Fisher",
          phone: "789-678-3456",
          email: "isea.fisher@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1678214839727-091992974acc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Jason Momma",
          phone: "890-789-4567",
          email: "jason.momma@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1724331061917-e7b17e5f86ba?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjQ4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Kier Knightly",
          phone: "901-890-5678",
          email: "kier.knightly@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1600206953976-98315cf21e14?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njc2fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Liam Hemsworth",
          phone: "123-901-6789",
          email: "liam.hemsworth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1569605292330-189ccf83f98b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjcxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Mica Unis",
          phone: "234-012-7890",
          email: "mica.unis@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1584997159889-8bb96d0a2217?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njg3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
    GroupModel(
      name: 'Mindfulness Masters',
      subTitle: 'Breathe Deep. Live Fully.',
      isNetwork: true,
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1682434730554-ed160f123d68?q=80&w=2218&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      groupMembers: [
        GroupMemberModel(
          type: "Admin",
          name: "Emily Jackson",
          email: "emilyjackson@example.com",
          phone: "+91 9558697986",
          imageUrl:
              "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
          description: null,
        ),
        GroupMemberModel(
          name: "Xenia Onetup",
          phone: "567-567-2345",
          email: "xenia.onetup@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1550428083-7019ebe39b45?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjQwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
        ),
        GroupMemberModel(
          name: "Jasmine Beth",
          phone: "678-678-3456",
          email: "jasmine.beth@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1681377629627-44d188ecaa16?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzgxfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Zach Morris",
          phone: "789-789-4567",
          email: "zach.morris@example.com",
          imageUrl: null,
          description: null,
        ),
        GroupMemberModel(
          name: "Arcana Grande",
          phone: "890-890-5678",
          email: "arcana.grande@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1565622124507-e7815b561cc8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzg4fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Brad Pitt",
          phone: "901-901-6789",
          email: "brad.pitt@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1681681789591-6e3d83829e8a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDEwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Cameron Dial",
          phone: "123-012-7890",
          email: "cameron.dial@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1595900743418-e8103d62ccac?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDI3fHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Dense Washington",
          phone: "234-123-8901",
          email: "dense.washington@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1629096209450-dfb91df44ce2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTMzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Emma Watson",
          phone: "345-234-9012",
          email: "emma.watson@example.com",
          description: null,
          imageUrl:
              'https://images.unsplash.com/photo-1751470433729-b7d9bf97b811?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTYyfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
        ),
        GroupMemberModel(
          name: "Finn Welfare",
          phone: "456-345-0123",
          email: "finn.welfare@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1534945900825-63cc0b6dd7d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTkwfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
        GroupMemberModel(
          name: "Gal Gavot",
          phone: "567-456-1234",
          email: "gal.gavot@example.com",
          imageUrl:
              'https://images.unsplash.com/photo-1697672762740-2435ef602a9d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjAzfHxnaXJsfGVufDB8MnwwfHx8MA%3D%3D',
          description: null,
        ),
      ],
    ),
  ];

  bool isEmptyGroup = false;

  List<GroupModel> get listOfGroup => _groupList;

  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  void toggleEmptyGroup() {
    isEmptyGroup = !isEmptyGroup;
    notifyListeners();
  }

  void addGroup(GroupModel newGroup) {
    _groupList.add(newGroup);
    notifyListeners();
  }

  void removeGroup(String groupId) {
    _groupList.removeWhere((group) => group.id == groupId);
    notifyListeners();
  }

  void setImageUrl(String urlPath) {
    if (_imageUrl == urlPath) return;
    _imageUrl = urlPath;
    notifyListeners();
  }

  void insertNewGroup(int index, GroupModel newGroup) {
    _groupList.insert(0, newGroup);
    notifyListeners();
  }

  void updateGroup(String groupId, String newName, String newMessage) {
    final index = _groupList.indexWhere((group) => group.id == groupId);
    if (index != -1) {
      final oldGroup = _groupList[index];
      _groupList[index] = oldGroup.copyWith(
        name: newName,
        subTitle: newMessage,
      );
      notifyListeners();
    }
  }

  void updateImage(String groupId, String newImageUrl) {
    final index = _groupList.indexWhere((group) => group.id == groupId);
    if (index != -1) {
      final oldGroup = _groupList[index];
      _groupList[index] = oldGroup.copyWith(imageUrl: newImageUrl);
      notifyListeners();
    }
  }

  GroupModel? findGroupById(String id) {
    try {
      return _groupList.firstWhere((g) => g.id == id);
    } catch (e) {
      return null;
    }
  }
}
