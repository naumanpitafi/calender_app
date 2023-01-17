import 'dart:developer';

import 'package:bottom_bar/bottom_bar.dart';
import 'package:calenderapp/utils/appColors.dart';
import 'package:calenderapp/utils/appImages.dart';
import 'package:calenderapp/widgets/gradiant_Icon_Widget.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'day_tracker_screen.dart';
import 'mobile_home.dart';

class BottomNevBarScreen extends StatefulWidget {
  @override
  _BottomNevBarScreenState createState() => _BottomNevBarScreenState();
}

class _BottomNevBarScreenState extends State<BottomNevBarScreen> {


  int index = 0;

  final pages = <Widget>[
    const MyMobileBody(),
    const DayTrackerScreen(),
    const Center(
        child: Text('Messages',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.red,
            ))),
    const Center(
        child: Text('Info',
            style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.red,
            ))),
  ];

  int selected = 0;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(gradient: AppColors.gradientcol),
        child: StylishBottomBar(
          // backgroundColor: Colors.red,
          items: [
            AnimatedBarItems(
                icon: const Icon(
                  Icons.bar_chart,
                ),
                // selectedIcon: const Icon(
                //   Icons.bar_chart,
                //   color: AppColors.darkbule,
                // ),
                selectedColor: AppColors.darkbule,
                backgroundColor: AppColors.darkbule,
                unSelectedColor: Colors.grey,
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 12,
                    color: AppColors.darkbule,
                  ),
                )),
            AnimatedBarItems(
                icon: ImageIcon(AssetImage(AppImages().reuse)),
                // selectedIcon: ImageIcon(
                //   AssetImage(AppImages().reuse),
                //   color: index == 1 ? AppColors.darkbule : Colors.grey,
                // ),
                selectedColor: index == 1 ? AppColors.darkbule : Colors.grey,
                backgroundColor: index == 1 ? AppColors.darkbule : Colors.grey,
                unSelectedColor: Colors.grey,
                title: const Text(
                  'Event',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 12,
                    color: AppColors.darkbule,
                  ),
                )),
            AnimatedBarItems(
                icon: const Icon(
                  Icons.mail_outline,
                ),
                selectedIcon: const Icon(
                  Icons.mail,
                  color: AppColors.darkbule,
                ),
                selectedColor: AppColors.darkbule,
                backgroundColor: AppColors.darkbule,
                unSelectedColor: Colors.grey,
                title: const Text(
                  'Messages',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 12,
                    color: AppColors.darkbule,
                  ),
                )),
            AnimatedBarItems(
                icon: const Icon(
                  Icons.logout,
                ),
                selectedIcon: const Icon(
                  Icons.logout,
                  color: AppColors.darkbule,
                ),
                selectedColor: AppColors.darkbule,
                backgroundColor: AppColors.darkbule,
                unSelectedColor: Colors.grey,
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 12,
                    color: AppColors.darkbule,
                  ),
                )),
          ],
          iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          opacity: 0.3,
          currentIndex: index,
          onTap: onChangedTab,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log(index.toString());
          if (index == 0) {
            showModalBottomSheet(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      //padding: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          //  color: AppColors.readcolor,
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Add Event",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    fontSize: 16,
                                    color: AppColors.black)),
                            const SizedBox(
                              height: 10,
                            ),
                            maxLineTextFieldWidget(
                                context: context, hinttext: "What"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                log('Location Fetching ');
                                //    Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                //     builder: (context) => PlacePicker(
                                //         apiKey: googleApikey,
                                //         hintText: "Find a place ...",
                                //         searchingText: "Please wait ...",
                                //         selectText: "Select place",
                                //         outsideOfPickAreaText: "Place not in area",
                                //         initialPosition: currentLaltg != null
                                //             ? currentLaltg
                                //             : _center,
                                //         useCurrentLocation: true,
                                //         selectInitialPosition: true,
                                //         usePinPointingSearch: true,
                                //         usePlaceDetailSearch: true,
                                //         onPlacePicked: (result) {
                                //           renterCurrentLoaction = result;
                                //           Navigator.of(context).pop();
                                //           setState(() {
                                //             log(renterCurrentLoaction
                                //                 .formattedAddress);
                                //             log(renterCurrentLoaction
                                //                 .geometry!.location.lat
                                //                 .toString());
                                //             log(renterCurrentLoaction
                                //                 .geometry!.location.lng
                                //                 .toString());
                                //             renteraddress = renterCurrentLoaction
                                //                 .formattedAddress;
                                //             parkingAddressLat =
                                //                 renterCurrentLoaction
                                //                     .geometry!.location.lat;
                                //             parkingAddressLong =
                                //                 renterCurrentLoaction
                                //                     .geometry!.location.lng;
                                //             log('parkingAddressLong = $parkingAddressLong');
                                //             log('parkingAddressLat = $parkingAddressLat');
                                //             log('renteraddress = $renteraddress');
                                //           });
                                //         })),
                                // );
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.25))
                                    ]),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Where',
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.grey,
                                          fontSize: 16,
                                          // fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GradientIcon(
                                            Icons.send,
                                            20.0,
                                            AppColors.gradientcol,
                                            // const LinearGradient(
                                            //   colors: [
                                            //     Colors.yellow,
                                            //     Colors.purple,
                                            //   ],
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.centerRight,
                                          ),
                                          // Icon(
                                          //   Icons.send,
                                          //   color: AppColors.readcolor,
                                          // ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          GradientIcon(
                                            Icons.computer_sharp,
                                            20.0,
                                            AppColors.gradientcol,
                                            // const LinearGradient(
                                            //   colors: [
                                            //     Colors.yellow,
                                            //     Colors.purple,
                                            //   ],
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.centerRight,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // maxLineTextFieldWidget(
                            //     context: context, hinttext: "Where"),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Start",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w300,
                                  ),
                                  // style: GoogleFonts.poppins(
                                  //   color: Color(0xff1e1e1e),
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "27 OCT 2022",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w300,
                                    ),
                                    // style: GoogleFonts.poppins(
                                    //   color: Color(0xff1e1e1e),
                                    //   fontSize: 14,
                                    //   fontWeight: FontWeight.w500,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "02:00 pm",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.check_box_outline_blank_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  "All day",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "End",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w300,
                                  ),
                                  // style: GoogleFonts.poppins(
                                  //   color: Color(0xff1e1e1e),
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "27 OCT 2022",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w300,
                                    ),
                                    // style: GoogleFonts.poppins(
                                    //   color: Color(0xff1e1e1e),
                                    //   fontSize: 14,
                                    //   fontWeight: FontWeight.w500,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "02:00 pm",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Spacer(),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  "01h 30min",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.only(left: 8),
                            //       child: Text(
                            //         "End",
                            //         style: TextStyle(
                            //           fontFamily: 'Poppins-Regular',
                            //           color: Color(0xff1e1e1e),
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       height: 40,
                            //       width: 130,
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //           boxShadow: [
                            //             BoxShadow(
                            //                 blurRadius: 4,
                            //                 color: Colors.black.withOpacity(0.25))
                            //           ]),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Text(
                            //             "27 OCT 2022",
                            //             style: TextStyle(
                            //               fontFamily: 'Poppins-Regular',
                            //               color: Color(0xff1e1e1e),
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500,
                            //             ),
                            //           ),
                            //           const Icon(
                            //             Icons.calendar_today_outlined,
                            //             size: 20,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //     Container(
                            //       height: 40,
                            //       width: 130,
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //           boxShadow: [
                            //             BoxShadow(
                            //                 blurRadius: 4,
                            //                 color: Colors.black.withOpacity(0.25))
                            //           ]),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Text(
                            //             "02:00 pm",
                            //             style: TextStyle(
                            //               fontFamily: 'Poppins-Regular',
                            //               color: Color(0xff1e1e1e),
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500,
                            //             ),
                            //           ),
                            //           const Icon(
                            //             Icons.timer_sharp,
                            //             size: 20,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                maxLineTextFieldWidget1(
                                    context: context, hinttext: "Never repeat"),
                                const SizedBox(
                                  width: 15,
                                ),
                                maxLineTextFieldWidget1(
                                    context: context,
                                    hinttext: "No track type"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            maxLineTextFieldWidget(
                                context: context,
                                hinttext: "Invite friends",
                                suffixIcon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: Color(0xff1e1e1e),
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            maxLineTextFieldWidget(
                                context: context,
                                hinttext: "Share",
                                suffixIcon: const Icon(
                                  Icons.share,
                                  size: 18,
                                  color: Color(0xff1e1e1e),
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //     height: 48,
                                //     width: 172,
                                //     decoration: BoxDecoration(
                                //         gradient: AppColors.gradientcol,
                                //         borderRadius: BorderRadius.circular(10)),
                                //     child: Align(
                                //       alignment: Alignment.center,

                                //       child: Text(
                                //         "Cancel",
                                //         style: TextStyle(
                                //           fontFamily: 'Poppins-Regular',
                                //           color: Color(0xff1e1e1e),
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     )),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 0,
                                        fixedSize: const Size(172, 48),
                                        primary: const Color(0xfffafafa)),
                                    // style: ElevatedButton.styleFrom(
                                    //     shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(10)),
                                    //     elevation: 2,
                                    //     fixedSize: const Size(172, 48),
                                    //     primary: AppColors.white),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: Color(0xff1e1e1e),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                Container(
                                  height: 48,
                                  width: 172,
                                  decoration: BoxDecoration(
                                      gradient: AppColors.gradientcol,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Create",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Bold',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // ElevatedButton(
                                //     onPressed: () {},
                                //     style: ElevatedButton.styleFrom(
                                //         shape: RoundedRectangleBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(10)),
                                //         elevation: 2,
                                //         fixedSize: const Size(172, 48),
                                //         primary: AppColors.gradientcol),
                                //     child: Text(
                                //       "Create",
                                //       style: TextStyle(
                                //         fontFamily: 'Poppins-Bold',
                                //         color: Colors.white,
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                        ),
                      ));
                });
          } else if (index == 1) {
            showModalBottomSheet(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      //padding: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          //  color: AppColors.readcolor,
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Add Day Trcaker",
                                style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    fontSize: 16,
                                    color: AppColors.black)),
                            const SizedBox(
                              height: 10,
                            ),
                            maxLineTextFieldWidget(
                                context: context, hinttext: "Title"),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Start",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w300,
                                  ),
                                  // style: GoogleFonts.poppins(
                                  //   color: Color(0xff1e1e1e),
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "27 OCT 2022",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w300,
                                    ),
                                    // style: GoogleFonts.poppins(
                                    //   color: Color(0xff1e1e1e),
                                    //   fontSize: 14,
                                    //   fontWeight: FontWeight.w500,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "02:00 pm",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.check_box_outline_blank_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  "All day",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "End",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w300,
                                  ),
                                  // style: GoogleFonts.poppins(
                                  //   color: Color(0xff1e1e1e),
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "27 OCT 2022",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w300,
                                    ),
                                    // style: GoogleFonts.poppins(
                                    //   color: Color(0xff1e1e1e),
                                    //   fontSize: 14,
                                    //   fontWeight: FontWeight.w500,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Spacer(),
                                Container(
                                  height: 40,
                                  // width: 130,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: const Text(
                                    "02:00 pm",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Color(0xff1e1e1e),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.timer_sharp,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Spacer(),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  "01h 30min",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 0,
                                        fixedSize: const Size(172, 48),
                                        primary: const Color(0xfffafafa)),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        color: Color(0xff1e1e1e),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                Container(
                                  height: 48,
                                  width: 172,
                                  decoration: BoxDecoration(
                                      gradient: AppColors.gradientcol,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Create",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Bold',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // ElevatedButton(
                                //     onPressed: () {},
                                //     style: ElevatedButton.styleFrom(
                                //         shape: RoundedRectangleBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(10)),
                                //         elevation: 2,
                                //         fixedSize: const Size(172, 48),
                                //         primary: AppColors.gradientcol),
                                //     child: Text(
                                //       "Create",
                                //       style: TextStyle(
                                //         fontFamily: 'Poppins-Bold',
                                //         color: Colors.white,
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                        ),
                      ));
                });
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: AppColors.darkbule,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(currentIndex) {
    print(currentIndex);
    setState(() {
      this.index = currentIndex;
    });
  }
}

Widget maxLineTextFieldWidget({
  BuildContext? context,
  TextEditingController? controller,
  String? hinttext,
  Widget? suffixIcon,
  String? Function(String?)? validator,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.25))
        ]),
    width: MediaQuery.of(context!).size.width,
    child: TextFormField(
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        fontFamily: 'Poppins-Regular',
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: const Color(0xfffafafa),
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          fontFamily: 'Poppins-Regular',
          color: suffixIcon == null ? Colors.grey : const Color(0xff1e1e1e),
          fontSize: 16,
          // fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}

Widget maxLineTextFieldWidget1({
  BuildContext? context,
  TextEditingController? controller,
  String? hinttext,
  String? Function(String?)? validator,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.25))
        ]),
    width: 172,
    child: TextFormField(
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        fontFamily: 'Poppins-Regular',
        color: Color(0xff1e1e1e),
        fontSize: 14,
        // fontWeight: FontWeight.w300,
      ),
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.arrow_drop_down_rounded,
          size: 36,
        ),
        fillColor: const Color(0xfffafafa),
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins-Regular',
          color: Colors.grey,
          fontSize: 14,
          // fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
