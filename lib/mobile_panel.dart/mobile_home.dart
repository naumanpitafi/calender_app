import 'package:calenderapp/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarController _controller = CalendarController();
    int buttonIndexVal = 0;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.gradientcol,
        flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: AppColors.gradientcol)),
        actions: [
          Container(
            height: 20,
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                abbbarActions('D'),
                abbbarActions('W'),
                abbbarActions('M'),
                abbbarActions('Y')
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: SfCalendar(
              allowAppointmentResize: true,
              view: CalendarView.timelineWeek,
              showWeekNumber: true,
              showCurrentTimeIndicator: true,
              firstDayOfWeek: 1, // Monday
              showNavigationArrow: true,
              timeSlotViewSettings:
                  const TimeSlotViewSettings(timelineAppointmentHeight: 100),
              dataSource: _getCalendarDataSource(),
              appointmentBuilder:
                  (BuildContext context, CalendarAppointmentDetails details) {
                final Appointment meeting = details.appointments.first;
                const String image = 'assets/images/first.png';
                if (_controller.view != CalendarView.month &&
                    _controller.view != CalendarView.schedule) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          // height: 18,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: meeting.color.withOpacity(0.15),
                                    blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 70,
                                color: meeting.color.withOpacity(0.8),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meeting.subject,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins-Bold'),
                                    // style: GoogleFonts.poppins(
                                    //   color: Colors.black,
                                    //   fontSize: 12,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                    maxLines: 3,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Image(
                                          image: ExactAssetImage(
                                              'assets/images/first.png'),
                                          fit: BoxFit.contain,
                                          width: 20,
                                          height: 20)),
                                  Text(
                                    meeting.notes!,
                                    style: TextStyle(
                                      color: meeting.color.withOpacity(0.8),
                                    ),
                                    // style:  GoogleFonts.poppins(
                                    //   color:  meeting.color.withOpacity(0.8),
                                    //   fontSize: 12,
                                    // ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  child: Text(meeting.subject),
                );
              },
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: AppColors.gradientcol),
          ),

          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.57,
          //       padding: EdgeInsets.only(bottom: 1),
          //       color: Colors.grey,
          //     ),
          //     Positioned(
          //       top: 40,
          //       // right: 1,
          //       // left: 1,
          //       child: Container(
          //         height: 30,
          //         width: MediaQuery.of(context).size.width,
          //         // color: Colors.red,
          //         decoration: BoxDecoration(gradient: AppColors.gradientcol),
          //       ),
          //     ),
          //     Positioned(
          //       top: 32,
          //       right: 15,
          //       left: 10,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           abbbarActions('D'),
          //           abbbarActions('W'),
          //           abbbarActions('M'),
          //           abbbarActions('Y')
          //         ],
          //       ),
          //     ),
          //     Positioned(
          //       top: 90,
          //       right: 15,
          //       left: 10,
          //       child: Center(
          //         child: SfCalendar(
          //           allowAppointmentResize: true,
          //           view: CalendarView.timelineWeek,
          //           showWeekNumber: true,
          //           showCurrentTimeIndicator: true,
          //           firstDayOfWeek: 1, // Monday
          //           showNavigationArrow: true,
          //           timeSlotViewSettings: const TimeSlotViewSettings(
          //               timelineAppointmentHeight: 100),
          //           dataSource: _getCalendarDataSource(),
          //           appointmentBuilder: (BuildContext context,
          //               CalendarAppointmentDetails details) {
          //             final Appointment meeting = details.appointments.first;
          //             const String image = 'assets/images/first.png';
          //             if (_controller.view != CalendarView.month &&
          //                 _controller.view != CalendarView.schedule) {
          //               return Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Column(
          //                   children: [
          //                     Container(
          //                       // height: 18,
          //                       width: 150,
          //                       decoration: BoxDecoration(
          //                           color: Colors.white,
          //                           boxShadow: [
          //                             BoxShadow(
          //                                 color:
          //                                     meeting.color.withOpacity(0.15),
          //                                 blurRadius: 2)
          //                           ],
          //                           borderRadius: BorderRadius.circular(10)),
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             width: 10,
          //                             height: 70,
          //                             color: meeting.color.withOpacity(0.8),
          //                           ),
          //                           SizedBox(width: 10),
          //                           Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.center,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 meeting.subject,
          //                                 style: TextStyle(
          //                                     color: Colors.black,
          //                                     fontSize: 12,
          //                                     fontFamily: 'Poppins-Bold'),
          //                                 // style: GoogleFonts.poppins(
          //                                 //   color: Colors.black,
          //                                 //   fontSize: 12,
          //                                 //   fontWeight: FontWeight.bold,
          //                                 // ),
          //                                 maxLines: 3,
          //                                 softWrap: false,
          //                                 overflow: TextOverflow.ellipsis,
          //                               ),
          //                               const Padding(
          //                                   padding: EdgeInsets.symmetric(
          //                                       vertical: 5),
          //                                   child: Image(
          //                                       image: ExactAssetImage(
          //                                           'assets/images/first.png'),
          //                                       fit: BoxFit.contain,
          //                                       width: 20,
          //                                       height: 20)),
          //                               Text(
          //                                 meeting.notes!,
          //                                 style: TextStyle(
          //                                   color:
          //                                       meeting.color.withOpacity(0.8),
          //                                 ),
          //                                 // style:  GoogleFonts.poppins(
          //                                 //   color:  meeting.color.withOpacity(0.8),
          //                                 //   fontSize: 12,
          //                                 // ),
          //                               )
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             }
          //             return Container(
          //               child: Text(meeting.subject),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: MediaQuery.of(context).size.height * 0.53,
          //       // right: 1,
          //       // left: 1,
          //       child: Container(
          //         height: 30,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(gradient: AppColors.gradientcol),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget abbbarActions(
    String buttonText,
  ) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          )),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'Poppins-Regular',
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource() {
  List<Appointment> appointments = [
    Appointment(
      startTime: DateTime(2022, 10, 20, 6, 0, 0),
      endTime: DateTime(2022, 10, 20, 10, 0, 0),
      isAllDay: true,
      subject: 'Meeting',
      notes: 'First Event',
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2022, 10, 21, 17, 30, 0),
      endTime: DateTime(2022, 10, 21, 23, 0, 0),
      isAllDay: true,
      subject: 'Nikkah',
      notes: 'Second Event',
      color: Colors.orange,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2022, 10, 21, 6, 30, 0),
      endTime: DateTime(2022, 10, 21, 10, 30, 0),
      isAllDay: true,
      subject: 'Play',
      notes: 'Third Event',
      color: Colors.red,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2022, 10, 22, 11, 30, 0),
      endTime: DateTime(2022, 10, 22, 12, 30, 0),
      isAllDay: true,
      subject: 'Nikah',
      notes: 'Tuesday Event',
      color: Colors.green,
      startTimeZone: '',
      endTimeZone: '',
    ),
    // Appointment(
    //   startTime: DateTime.now()..add(Duration(hours: 9)),
    //   endTime: DateTime.now().add(Duration(hours: 10)),
    //   isAllDay: true,
    //   subject: 'Meeting',
    //   notes: 'Fourth Event',
    //   color: Colors.green,
    //   startTimeZone: '',
    //   endTimeZone: '',
    // )
  ];

  return DataSource(appointments);
}
