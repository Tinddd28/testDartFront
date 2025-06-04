import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ActivityData {
  final String domain;
  final double dataTransferred;

  ActivityData(this.domain, this.dataTransferred);
}

class ActivityChart extends StatelessWidget {
  final List<ActivityData> data;

  ActivityChart({required this.data});

  @override
  Widget build(BuildContext context) {
    final series = [
      charts.Series<ActivityData, String>(
        id: 'Traffic',
        domainFn: (ActivityData activity, _) => activity.domain,
        measureFn: (ActivityData activity, _) => activity.dataTransferred,
        data: data,
        labelAccessorFn: (ActivityData activity, _) => '${activity.dataTransferred.toStringAsFixed(1)} KB',
      )
    ];

    return SizedBox(
      height: 200,
      child: charts.BarChart(
        series,
        animate: true,
        animationDuration: Duration(milliseconds: 800),
      ),
    );
  }
}