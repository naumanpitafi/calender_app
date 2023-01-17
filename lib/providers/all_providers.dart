import 'package:calenderapp/providers/day_tracker_provider.dart';
import 'package:calenderapp/providers/loading_provider.dart';
import 'package:provider/provider.dart';

var allProvider = [
  ChangeNotifierProvider<LoadingProvider>(
    create: (_) => LoadingProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<DayTrackerProvider>(
    create: (_) => DayTrackerProvider(),
    lazy: true,
  ),

];
