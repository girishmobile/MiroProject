import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/models/event_model.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailPage extends StatelessWidget {
  final String eventId;

  const EventDetailPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final event = context.read<EventProvider>().findEventById(eventId);

    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: CustomScrollView(
              slivers: [
                SliverList.list(
                  children:
                      event != null
                          ? [
                            _buildEventPhoto(event.imageUrl),
                            _buildEventTitle(context, event),
                            _buildGuestList(context),
                            _buildEventRequestedItem(context),
                            _buildLocationMap(),
                          ]
                          : [
                            loadEmptyView(
                              emptyIcon: Icons.person_off_outlined,
                              title: "Event not found",
                              message:
                                  "Something went wrong. please try again...",
                              buttonTitle: "GO BACK",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppNavigationBar(
              title: "EVENT DETAILS",
              onLeftTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  _buildEventPhoto(String imageUrl) {
    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      bottomPadding: 0,
      topPadding: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: loadAssetImage(
          name: imageUrl,
          fit: BoxFit.cover,
          height: photoSize,
        ),
      ),
    );
  }

  _buildEventTitle(BuildContext context, EventModel event) {
    return loadGlassBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadTitleText(
            title: "${event.name} (${event.category})",
            fontSize: 14,
          ),
          loadDivider(),
          Row(
            children: [
              if (event.numberOfJoin != null) ...[
                Icon(
                  Icons.person_outline,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 24,
                ),
                loadSubTitleText(
                  fontColor: Colors.white.withValues(alpha: 0.7),
                  title: "[#${event.numberOfJoin}]",
                ),
                SizedBox(width: 16),
              ],

              Expanded(
                child: loadRowWithIcon(
                  fontWeight: FontWeight.w500,
                  iconName: Icons.calendar_month_outlined,
                  fontSize: 12,
                  iconSize: 20,
                  fontColor: Colors.white.withValues(alpha: 0.7),
                  iconColor: Colors.white.withValues(alpha: 0.7),
                  title: event.dateTime,
                ),
              ),
            ],
          ),

          loadDivider(),
          loadRowWithIcon(
            fontWeight: FontWeight.w500,
            iconName: Icons.place_outlined,
            iconSize: 20,
            fontSize: 12,
            fontColor: Colors.white.withValues(alpha: 0.7),
            iconColor: Colors.white.withValues(alpha: 0.7),
            title: event.location,
          ),
          loadDivider(),

          _buildRowOfAction(
            context: context,
            leftText: "See Poll Result",
            rightText: "You are Host",
            onLeftBtn: () {
              Navigator.pushNamed(
                context,
                RouteName.pollResultPage,
                arguments: eventId,
              );
            },
            onRightBtn: () {},
          ),
          _buildRowOfAction(
            context: context,
            leftText: "Manage Event",
            rightText: "Cancel Event",
            onLeftBtn: () {
              Navigator.pushNamed(context, RouteName.manageEventPage);
            },
            onRightBtn: () {
              showAlertWithGlassEffect(
                context: context,
                title: "Are you sure you want to cancel this event?",
                message:
                    "If you Cancel, this event will no longer show up in your Dashboard. Guests will be notified of the cancellation.",
                onConfirm: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context).maybePop();
                },
              );
            },
          ),
          _buildTicketOption(),
        ],
      ),
    );
  }

  _buildRowOfAction({
    required BuildContext context,
    required String leftText,
    required String rightText,
    required VoidCallback onLeftBtn,
    required VoidCallback onRightBtn,
  }) {
    return Row(
      spacing: 16,
      children: [
        Flexible(
          child: loadGlassButton(
            text: leftText,
            fontSize: 14,
            onPress: onLeftBtn,
          ),
        ),
        Flexible(
          child: loadGlassButton(
            text: rightText,
            fontSize: 14,
            onPress: onRightBtn,
          ),
        ),
      ],
    );
  }

  _buildTicketOption() {
    return loadGlassBackground(
      leftMargin: 0,
      rightMargin: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(
                Icons.confirmation_number_outlined,
                color: Colors.white,
                size: 24,
              ),
              loadSubTitleText(title: "\$5.0 per ticket"),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              Icon(
                Icons.local_activity_outlined,
                color: Colors.white,
                size: 24,
              ),
              loadSubTitleText(title: "\$200.0 collected"),
            ],
          ),
        ],
      ),
    );
  }

  _buildGuestList(BuildContext context) {
    final provider = Provider.of<GuestProvider>(context);
    final eventProvider = Provider.of<EventProvider>(context);
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          loadRowWithIcon(
            title: 'GUEST LIST',
            iconName: Icons.people_alt_outlined,
          ),
          const SizedBox(height: 16),
          loadDivider(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              loadSubTitleText(title: "Transparency Mode"),
              loadSwitchButton(context, eventProvider),
            ],
          ),
          const SizedBox(height: 4),
          loadDivider(),
          const SizedBox(height: 12),
          loadGlassButton(
            text: "Invite guest",
            onPress: () {
              Navigator.pushNamed(context, RouteName.inviteGuestList);
            },
          ),
          const SizedBox(height: 8),
          AppHorizontalList(
            title: "Accepted",
            guestList: provider.acceptedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.acceptedGuest);
            },
          ),
          const SizedBox(height: 20),
          loadDivider(),
          const SizedBox(height: 4),
          AppHorizontalList(
            title: "Rejected",
            guestList: provider.rejectedGuests,
            onPressed: () {
              Navigator.pushNamed(context, RouteName.rejectedGuest);
            },
          ),
        ],
      ),
    );
  }

  _buildEventRequestedItem(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: loadRowWithIcon(
                  title: "REQUESTED ITEM",
                  iconName: Icons.list_alt_outlined,
                ),
              ),
              Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  loadCircleIcon(
                    icon: Icons.add,
                    radius: 16,
                    onTap: () {
                      customGlassDialogWithChild(
                        context: context,
                        child: _buildNewItem(context: context, isEdit: false),
                      );
                    },
                  ),
                  Text(
                    "Add item",
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: provider.listOfItems1.length,
            itemBuilder: (context, index) {
              final item = provider.listOfItems1[index];

              return loadGlassBackground(
                leftMargin: 0,
                rightMargin: 0,
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AppTextWidget(
                            text: item.name,
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppTextWidget(
                          text: "Qty:- ${item.qty}",
                          color: Colors.white.withValues(alpha: 0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: "Des:- ${item.description}",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              AppTextWidget(
                                text: "Contributor:- ${item.contributor}",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        // Edit item
                        loadCircleIcon(
                          onTap: () {
                            customGlassDialogWithChild(
                              context: context,
                              child: _buildNewItem(
                                context: context,
                                isEdit: true,
                                updateItem: item,
                              ),
                            );
                          },
                          radius: 14,
                          icon: Icons.edit_outlined,
                          iconSize: 14,
                          iconColor: Colors.white.withValues(alpha: 0.9),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildNewItem({
    required BuildContext context,
    required bool isEdit,
    BringItemModel? updateItem,
  }) {
    final provider = Provider.of<EventProvider>(context, listen: false);
    final nameController = TextEditingController(text: updateItem?.name);
    final qtyController = TextEditingController();
    final contributorController = TextEditingController();
    final descController = TextEditingController();

    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        loadTitleText(title: isEdit ? "UPDATE ITEM" : "NEW ITEM"),
        AppTextfield(
          hintText: "Enter item name",
          textController: nameController,
        ),
        AppTextfield(hintText: "Item Qty", textController: qtyController),
        AppTextfield(
          hintText: "Contributor",
          textController: contributorController,
        ),
        loadMultiLineTextField(
          hintText: "Description",
          textController: descController,
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: loadGlassButton(
                text: "CANCEL",
                fontSize: 12,
                onPress: () {
                  // Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context).maybePop();
                },
              ),
            ),
            Expanded(
              child: loadGlassButton(
                text: isEdit ? "UPDATE" : "ADD ITEM",
                fontSize: 12,
                onPress: () {
                  final safeContext = context;

                  final name = nameController.text.trim();
                  final qtyText = qtyController.text.trim();
                  final desc = descController.text.trim();
                  final contributor = contributorController.text.trim();

                  final isValid =
                      name.isNotEmpty &&
                      qtyText.isNotEmpty &&
                      desc.isNotEmpty &&
                      contributor.isNotEmpty;

                  if (isValid) {
                    final qty = int.tryParse(qtyText);
                    if (qty != null) {
                      provider.addBringItem(
                        BringItemModel(
                          name: name,
                          qty: qty,
                          description: desc,
                          contributor: contributor,
                        ),
                      );
                      Navigator.maybePop(context); // Close the dialog
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        appSnackMessenger(
                          context: safeContext,
                          message: 'This is bew',
                        );
                      });
                    }
                  } else {
                    appSnackMessenger(
                      context: context,
                      message: "Please fill all field",
                    );
                  }
                  //Navigator.maybePop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildLocationMap() {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          loadRowWithIcon(title: 'ADDRESS', iconName: Icons.place_outlined),
          loadDivider(),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                AppTextWidget(text: '221B Baker Street', color: Colors.white),
                AppTextWidget(
                  text: 'Marlene, London, NW1 6XE',
                  color: Colors.white,
                ),
                AppTextWidget(text: 'United Kingdom', color: Colors.white),
                Container(
                  color: Colors.white.withValues(alpha: 0.1),
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: AppTextWidget(
                      text: 'Map here',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
