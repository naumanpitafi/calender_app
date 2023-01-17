import 'package:calenderapp/providers/day_tracker_provider.dart';
import 'package:calenderapp/utils/appColors.dart';
import 'package:calenderapp/widgets/app_default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DayTrackerScreen extends StatefulWidget {
  const DayTrackerScreen({super.key});

  @override
  State<DayTrackerScreen> createState() => _DayTrackerScreenState();
}

class _DayTrackerScreenState extends State<DayTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    DayTrackerProvider dayTrackerProviderInstance =
        Provider.of<DayTrackerProvider>(context);
    final List<ChartData> chartData = [
      ChartData('w-3', 118, Colors.teal),
      ChartData('w-2', 123, Colors.orange),
      ChartData('w-1', 107, Colors.brown),
      ChartData('w', 87, Colors.deepOrange),
      ChartData('w+1', 87, Colors.green),
    ];
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: SfCartesianChart(
                      backgroundColor: AppColors.white,
                      primaryXAxis: CategoryAxis(),
                      series: <CartesianSeries>[
                    ColumnSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // Map color for each data points from the data source
                        pointColorMapper: (ChartData data, _) => data.color)
                  ])),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: AppColors.gradientcol),
                child: dayTrackerProviderInstance.isopen
                    ? Row(
                        children: [
                          SizedBox(width: 5.w),
                          daytrackerWidget1(AppColors.white, 'All'),
                          daytrackerWidget1(AppColors.greenShade, 'Work'),
                          daytrackerWidget1(AppColors.readcolor, 'learn'),
                          daytrackerWidget1(AppColors.purpleShade, 'Sport'),
                          InkWell(
                            onTap: () {
                              dayTrackerProviderInstance.setLoading(false);
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColors.white,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          dayTrackerProviderInstance.setLoading(true);
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                                size: 15,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              dayTrackerWidget(
                  indexVal: 1,
                  borderColor: AppColors.readcolor,
                  isDarkVal: true,
                  text1: 'Work',
                  text2: '25h 18m',
                  text3: 'adsf'),
              dayTrackerWidget(
                  indexVal: 1,
                  borderColor: Colors.green,
                  isDarkVal: true,
                  text1: 'Sport',
                  text2: '01h 45m',
                  text3: 'adsf'),
              dayTrackerWidget(
                  indexVal: 1,
                  borderColor: Colors.blue,
                  isDarkVal: true,
                  text1: 'learn',
                  text2: '00h 45m',
                  text3: 'adsf')
            ],
          ),
        ),
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

  Widget dayTrackerWidget({
    int? indexVal,
    Color? borderColor,
    bool? isDarkVal,
    String? text1,
    String? text2,
    String? text3,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      height: 69,
      width: 325,
      child: Container(
        height: 69,
        width: 325,
        margin: EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 0),
              blurStyle: BlurStyle.outer,
              color: AppColors.black.withOpacity(0.14),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 69,
                  width: 7,
                  decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  text1.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins-Bold'),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Icon(
              Icons.play_arrow,
              color: Colors.grey[500],
            ),
            Row(
              children: [
                Text(
                  text2.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins-SemiBold'),
                  maxLines: 3,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget daytrackerWidget1(
    bgColor,
    String textVal,
  ) {
    return Container(
      margin: EdgeInsets.only(right: 1),
      height: 40.h,
      width: 70.w,
      child: Align(
        alignment: Alignment.center,
        child: text(
          context,
          textVal,
          12.0,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: bgColor,
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double? y;
  final Color? color;
}
