import 'dart:ui';

import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_group_list.dart';
import 'package:apple_invites/core/common/app_horizontal_list.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/core/utility/date_time_helper.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:apple_invites/screens/provider/group_provider.dart';
import 'package:apple_invites/screens/provider/guest_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyEvent(context));
  }

  _buildFancyEvent(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildEventPhotoSection(context),
                  _buildTitleSection(context),
                  _buildEventDateTimeSection(context),
                  _buildEventPrivacySection(context),
                  _buildLocationSection(context),
                  _buildEventDetail(),
                  _buildEventGuestInvited(context),
                  _buildGuestsNeedToBring(context),
                  _buildEventWalletProcess(context),
                  _buildSaveAndContinue(context),
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
            title: "CREATE EVENT",
            onLeftTap: () {
              Navigator.pop(context);
            },
            isRightIcon: true,
            rightIcons: Icons.close_outlined,
            onRightTap: () {
              showAlertWithGlassEffect(
                context: context,
                title: "Are you sure you want to stop creating this event?",
                message:
                    "if you press Yes, your event will not be created. or press No to continue",
                onConfirm: () {
                  Navigator.pop(context);
                  appNavigatorPop(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  _buildEventPhotoSection(BuildContext context) {
    final provider = context.watch<EventProvider>();
    return Stack(
      children: [
        loadGlassBackground(
          leftPadding: 0,
          rightPadding: 0,
          bottomPadding: 0,
          topPadding: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            child:
                provider.imageUrl != null
                    ? Stack(
                      children: [
                        loadAssetImage(
                          name: provider.imageUrl ?? appEvent_1,
                          fit: BoxFit.cover,
                          height: photoSize,
                          width: double.infinity,
                        ),

                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: loadCircleIcon(
                            radius: 18,
                            iconSize: 18,
                            icon: Icons.camera_alt_outlined,
                            backgroundColor: Colors.black.withValues(
                              alpha: 0.6,
                            ),
                            onTap: () => _showPhotoOrCamera(context, provider),
                          ),
                        ),
                      ],
                    )
                    : Container(
                      color: Colors.transparent,
                      height: photoSize,
                      width: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            loadCircleIcon(
                              iconSize: 36,
                              radius: 36,
                              icon: Icons.camera_alt_outlined,
                              iconColor: Colors.white.withValues(alpha: 0.7),
                              onTap:
                                  () => _showPhotoOrCamera(context, provider),
                            ),
                            Text(
                              'Choose from Library or Camera',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: fontRoboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
          ),
        ),
      ],
    );
  }

  _showPhotoOrCamera(BuildContext context, EventProvider provider) {
    loadBottomSheetWithSafeArea(
      context: context,
      child: loadImageOrCamera(
        context,
        onPhotoTap: (imagePath) {
          provider.setImageUrl(imagePath);
        },
        onCameraTap: (imagePath) {
          provider.setImageUrl(imagePath);
        },
      ),
    );
  }

  _buildTitleSection(BuildContext context) {
    final provider = context.watch<EventProvider>();
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'EVENT BASICS',
            iconName: Icons.event_outlined,
          ),
          loadTextField(hintText: "Event name"),
          loadTextField(
            text: provider.selectedCategory ?? '',
            hintText: "Select category",
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
            onTaped: () {
              provider.setOpenCategory(!provider.isCategoryOpen);
            },
          ),
          if (provider.isCategoryOpen) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  provider.categories.map((category) {
                    final isSelected = provider.selectedCategory == category;
                    return _buildGlassChip(
                      category: category,
                      isSelected: isSelected,
                      onTap: () => provider.setSelectedCategory(category),
                    );
                  }).toList(),
            ),
          ],
          loadTextField(hintText: "Note*"),
        ],
      ),
    );
  }

  Widget _buildGlassChip({
    required String category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white.withAlpha(40),
            ),
            gradient: appGradient,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    if (isSelected) ...[
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                    Text(
                      category,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildEventDateTimeSection(BuildContext context) {
    final provider = context.watch<EventProvider>();
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'DATE AND TIME',
            iconName: Icons.date_range_outlined,
          ),
          Row(
            children: [
              Flexible(
                child: loadTextField(
                  text:
                      provider.selectedStartDate == null
                          ? ''
                          : DateTimeHelper.getFormattedDate(
                            provider.selectedStartDate ?? DateTime.now(),
                            format: 'dd MMMM yyyy',
                          ),
                  hintText: "Start Date",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    showGlassCalendarDialog(
                      context,
                      firstDay: DateTime.now(),
                      onDateSelected: (dateTime) {
                        provider.setSelectedStartDate(dateTime);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: loadTextField(
                  text: provider.startTime,
                  hintText: "Start Time",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    showGlassTimeDialog(
                      context,
                      onTimeSelected: (selectedTime) {
                        provider.setSelectedStartTime(
                          selectedTime.format(context),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: loadTextField(
                  text: provider.selectedEndDate ?? '',
                  hintText: "End Date",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    showGlassCalendarDialog(
                      context,
                      firstDay: provider.selectedStartDate ?? DateTime.now(),
                      onDateSelected: (dateTime) {
                        provider.setSelectedEndDate(
                          DateTimeHelper.getFormattedDate(
                            dateTime,
                            format: 'dd MMMM yyyy',
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: loadTextField(
                  text: provider.endTime,
                  hintText: "End Time",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    showGlassTimeDialog(
                      context,
                      onTimeSelected: (timeOfDay) {
                        provider.setSelectedEndTime(timeOfDay.format(context));
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          loadSubTitleText(
            title: 'Timezone base on device',
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
        ],
      ),
    );
  }

  _buildEventPrivacySection(BuildContext context) {
    final provider = context.watch<EventProvider>();

    return loadGlassBackground(
      child: Column(
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'PUBLIC OR PRIVACY?',
            iconName: Icons.lock_outline,
          ),
          loadTextField(
            text: provider.publicORprivate,
            hintText: "Public or Private event?",
            readOnly: true,
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              provider.setPublicOrPrivate(!provider.isPublic);
            },
          ),
          if (provider.isPublic) ...[
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: loadGlassButton(
                    text: "Public",
                    icon: Icons.public_outlined,
                    onPress: () {
                      provider.setPublicOrPrivateText("Public");
                    },
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  child: loadGlassButton(
                    text: 'Private',
                    icon: Icons.privacy_tip_outlined,
                    fontSize: 16,
                    onPress: () {
                      provider.setPublicOrPrivateText("Private");
                    },
                  ),
                ),
              ],
            ),
          ],
          loadSubTitleText(
            title:
                "If private, then only invited guests will be able to find this event in their own newsfeed. If it's public, then it will appear in the newsfeed of other users who did not attend and users can search for event.",
            fontSize: 14,

            fontColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  _buildLocationSection(BuildContext context) {
    final provider = context.watch<EventProvider>();

    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'DO YOU WANT GUESTS TO VOTE ON LOCATION?',
            iconName: Icons.place_outlined,
          ),
          loadGlassButton(
            text: "Yes, their opinions matter",
            onPress: () {
              Navigator.pushNamed(context, RouteName.locationOptionPage);
            },
            fontSize: 14,
          ),
          loadGlassButton(
            text: "No, what I say goes",
            onPress: () {},
            fontSize: 14,
          ),
          loadRowWithIcon(title: 'EXACT LOCATION', fontSize: 14),
          _buildTogglePlaces(provider),
          _buildVenueContent(provider),
        ],
      ),
    );
  }

  _buildTogglePlaces(EventProvider provider) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(provider.locationOption.length, (index) {
          final isSelected = provider.locationIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                provider.setLocationIndex(index);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 200),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Colors.white.withValues(alpha: 0.6)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color:
                        isSelected
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.transparent,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  provider.locationOption[index],
                  style: TextStyle(
                    color:
                        isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.7),
                    fontFamily: fontRoboto,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 1.02,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildVenueContent(EventProvider provider) {
    switch (provider.locationIndex) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            loadSubTitleText(
              title: 'Venue location',
              fontSize: 14,
              fontColor: kPrimaryColor,
            ),
            loadTextField(
              hintText: 'Enter venue name',
              readOnly: false,
              prefixIcon: Icons.search_outlined,
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            loadSubTitleText(
              title: 'Online event link',
              fontSize: 14,
              fontColor: Colors.white,
            ),
            loadTextField(hintText: 'Add link to online event'),
          ],
        );
      case 2:
        return Align(
          alignment: Alignment.centerLeft,
          child: loadSubTitleText(
            title: 'Place not decide',
            fontSize: 14,
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }

  _buildEventDetail() {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(title: 'DESCRIPTION', iconName: Icons.info_outline),
          loadTextField(hintText: "Summary"),
          loadMultiLineTextField(),
          loadTextField(hintText: "Enter video link (if wanted)"),
        ],
      ),
    );
  }

  _buildEventGuestInvited(BuildContext context) {
    final provider = context.read<EventProvider>();
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //spacing: 16,
        children: [
          loadRowWithIcon(title: "GUESTS", iconName: Icons.person_4_outlined),
          SizedBox(height: 8),
          loadRowWithIcon(
            title: "WILL GUESTS BE ABLE TO SEE WHO'S INVITED AND WHO'S RSVP'D?",
            fontSize: 14,
          ),
          SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: loadGlassButton(
                  text: "Yes",
                  textColor:
                      provider.isShowGuest
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.5),
                  borderColor:
                      provider.isShowGuest
                          ? Colors.white.withValues(alpha: 0.8)
                          : Colors.white.withAlpha(50),
                  onPress: () {
                    provider.setIsShowGuestList(true);
                  },
                ),
              ),
              Expanded(
                child: loadGlassButton(
                  text: "No",
                  textColor:
                      !provider.isShowGuest
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.5),
                  borderColor:
                      !provider.isShowGuest
                          ? Colors.white.withValues(alpha: 0.8)
                          : Colors.white.withAlpha(50),
                  onPress: () {
                    provider.setIsShowGuestList(false);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
            title:
                """If "Yes", then invitee will be able to see guest list in "Event Details" frame; if "No", then they won't be able to see the list""",
          ),
          if (provider.isShowGuest) _buildGuestInvitationList(context),
        ],
      ),
    );
  }

  _buildGuestInvitationList(BuildContext context) {
    final provider = context.read<GuestProvider>();
    final groupProvider = context.read<GroupProvider>();
    return Column(
      children: [
        SizedBox(height: 16),
        loadRowWithIcon(
          title: 'WHO WOULD YOU LIKE TO INVITE?',
          iconName: Icons.contact_page_outlined,
        ),
        SizedBox(height: 16),
        AppGroupList(listOfGroup: groupProvider.listOfGroup),
        SizedBox(height: 24),
        loadDivider(),
        SizedBox(height: 4),
        AppHorizontalList(
          title: "Friends",
          guestList: provider.acceptedGuests,
          height: 155,
          isInvite: true,
          onPressed: () {
            Navigator.pushNamed(context, RouteName.friendOfFriendsPage);
          },
        ),
      ],
    );
  }

  _buildGuestsNeedToBring(BuildContext context) {
    final selected = context.watch<EventProvider>().bringOption;
    final provider = context.read<EventProvider>();

    buildBringButton({
      required String label,
      required BringItemOption value,
      double? fontSize,
      required VoidCallback? onTap,
    }) {
      final isSelected = selected == value;
      return ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    isSelected
                        ? Colors.white.withValues(alpha: 0.7)
                        : Colors.white.withAlpha(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.white.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize ?? 14,
                        color: Colors.white,
                        letterSpacing: 1.02,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: "WILL GUESTS NEED TO BRING ITEMS TO THIS EVENT?",
            fontSize: 14,
            iconName: Icons.dining_outlined,
          ),
          buildBringButton(
            label: "Yes, they can bring whatever they want",
            value: BringItemOption.yes,
            onTap: () {
              provider.setBringOption(BringItemOption.yes);
            },
          ),
          buildBringButton(
            label: 'Yes, they\'ll choose from a list that I\'ll make',
            value: BringItemOption.maybe,
            fontSize: 13,
            onTap: () {
              provider.setBringOption(BringItemOption.maybe);

              loadBottomSheetWithSafeArea(
                context: context,

                child: Consumer<EventProvider>(
                  builder:
                      (context, provider, _) =>
                          _buildRequestedItemList(context, provider),
                ),
              );
            },
          ),
          buildBringButton(
            label: 'No, I\'ve got it covered',
            value: BringItemOption.no,
            onTap: () {
              provider.setBringOption(BringItemOption.no);
            },
          ),
        ],
      ),
    );
  }

  _buildRequestedItemList(BuildContext context, EventProvider provider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        loadRowWithIcon(
          title: "REQUESTED ITEM",
          iconName: Icons.list_alt_outlined,
        ),
        // AutoScrollList(provider: provider)
        provider.listOfItems.isEmpty
            ? Text(
              "You don't have any items yet.\nPlease add one.",
              style: TextStyle(
                fontFamily: fontRoboto,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
            : Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 8),
                shrinkWrap: true,
                itemCount: provider.listOfItems.length,
                itemBuilder: (context, index) {
                  final item = provider.listOfItems[index];
                  return loadGlassBackground(
                    leftMargin: 0,
                    rightMargin: 0,
                    child: Column(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextWidget(
                              text: item.name,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            AppTextWidget(
                              text: "Qty:- ${item.qty}",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),

                        AppTextWidget(
                          text: "Des:- ${item.description}",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        loadGlassButton(
          text: "ADD ITEM",
          fontSize: 14,
          onPress: () {
            Navigator.maybePop(context);
            customGlassDialogWithChild(
              context: context,
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  loadTitleText(title: "NEW ITEM"),
                  AppTextfield(hintText: "Enter item name"),
                  AppTextfield(hintText: "Item Qty"),
                  loadMultiLineTextField(hintText: "Description"),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: loadGlassButton(
                          text: "CANCEL",
                          fontSize: 14,
                          onPress: () {
                            // Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).maybePop();
                          },
                        ),
                      ),
                      Expanded(
                        child: loadGlassButton(
                          text: "ADD ITEM",
                          fontSize: 14,
                          onPress: () {
                            provider.addBringItem(
                              BringItemModel(
                                name: "Water Bottle",
                                qty: 10,
                                description: "Kindly water bottle",
                              ),
                            );
                            Navigator.maybePop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
            //provider.addBringItem("NEW ITEM");
          },
        ),
        loadGlassButton(
          text: "CANCEL",
          textColor: Colors.white.withValues(alpha: 0.7),

          fontSize: 14,
          onPress: () {
            Navigator.of(context).maybePop();
          },
        ),
      ],
    );
  }

  _buildEventWalletProcess(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(title: "WALLET", iconName: Icons.wallet_outlined),
          loadRowWithIcon(
            title:
                "LET'S TALK MONEY...\nWILL YOUR EVENT REQUIRE TICKETS FOR ADMISSION?",
            fontSize: 14,
          ),
          _buildYesNoButtonForWallet(context),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title:
                'Decide if your event needs ticketing. Charging for entry helps manage attendance, cover costs, or generate revenue. You can always change this later.',
          ),
          loadDivider(),
          loadRowWithIcon(
            title: "WILL GUEST NEED TO COVER EXPENSES AFTER THE EVENT?",
            fontSize: 14,
            iconName: Icons.wallet_membership,
          ),
          _buildYesNoButtonForExpenses(context),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title:
                "Wondering if you’ll need to pay anything after the event? Here’s a quick breakdown to keep things clear",
          ),
        ],
      ),
    );
  }

  _buildYesNoButtonForWallet(BuildContext context) {
    final provider = context.read<EventProvider>();
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: loadGlassButton(
            text: "Yes",
            textColor:
                provider.isRequiredTicket
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.5),
            borderColor:
                provider.isRequiredTicket
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.white.withAlpha(50),
            onPress: () {
              provider.setIsRequiredTicket(true);
              Navigator.pushNamed(context, RouteName.ticketPage);
            },
          ),
        ),
        Expanded(
          child: loadGlassButton(
            text: "No",
            textColor:
                !provider.isRequiredTicket
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.5),
            borderColor:
                !provider.isRequiredTicket
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.white.withAlpha(50),
            onPress: () {
              provider.setIsRequiredTicket(false);
            },
          ),
        ),
      ],
    );
  }

  _buildYesNoButtonForExpenses(BuildContext context) {
    final provider = context.read<EventProvider>();
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: loadGlassButton(
            text: "Yes",
            textColor:
                provider.isExpensesAfter
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.5),
            borderColor:
                provider.isExpensesAfter
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.white.withAlpha(50),
            onPress: () {
              provider.setIsExpensesAfter(true);
            },
          ),
        ),
        Expanded(
          child: loadGlassButton(
            text: "No",
            textColor:
                !provider.isExpensesAfter
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.5),
            borderColor:
                !provider.isExpensesAfter
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.white.withAlpha(50),
            onPress: () {
              provider.setIsExpensesAfter(false);
            },
          ),
        ),
      ],
    );
  }

  _buildSaveAndContinue(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: "SAVE AND CONTINUE",
            iconName: Icons.save_outlined,
          ),
          loadGlassButton(
            text: "SAVE & CONTINUE",
            onPress: () {
              Navigator.pushNamed(context, RouteName.previewEventPage);
            },
          ),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            title:
                "Review your event details before moving on. This preview lets you double-check guest info, cost-sharing, and settings—so you can make sure everything looks right before saving and continuing.",
          ),
        ],
      ),
    );
  }
}

class AutoScrollList extends StatefulWidget {
  final EventProvider provider;
  const AutoScrollList({super.key, required this.provider});
  @override
  State<AutoScrollList> createState() => _AutoScrollListState();
}

class _AutoScrollListState extends State<AutoScrollList> {
  final ScrollController _scrollController = ScrollController();
  int _previousCount = 0;

  @override
  void didUpdateWidget(covariant AutoScrollList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.provider.listOfItems.length > _previousCount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }

    _previousCount = widget.provider.listOfItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 8),
        shrinkWrap: true,
        itemCount: widget.provider.listOfItems.length,
        itemBuilder: (context, index) {
          return loadGlassBackground(child: Text("Item $index"));
        },
      ),
    );
  }
}
