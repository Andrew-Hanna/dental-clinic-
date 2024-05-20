import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  ChartWidget({Key? key}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  // late List<GDPData> _chartData;
  // @override
  // void initState() {
  //   super.initState();
  //   _chartData = getChartData();
  // }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('andrew', 52),
      ChartData('Ammar', 52)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              // Render pie chart
              DoughnutSeries<ChartData, String>(
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}


//     // Fetch data
//     final data = getSampleData();

//     List<charts.Series<VisitData, String>> series = [
//       charts.Series(
//         id: 'Visits',
//         data: _generateData(data),
//         domainFn: (VisitData visit, _) => visit.label,
//         measureFn: (VisitData visit, _) => visit.numberOfVisits,
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Visit Data Chart'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: charts.BarChart(
//           series,
//           animate: true,
//         ),
//       ),
//     );
//   }

//   List<VisitData> _generateData(List<Map<String, dynamic>> data) {
//     return data
//         .map((item) => VisitData(
//             label: item['label'] as String,
//             numberOfVisits: item['numberOfVisits'] as int))
//         .toList();
//   }

//   List<Map<String, dynamic>> getSampleData() {
//     return [
//       {'label': 'January', 'numberOfVisits': 30},
//       {'label': 'February', 'numberOfVisits': 42},
//       {'label': 'March', 'numberOfVisits': 54},
//       {'label': 'April', 'numberOfVisits': 20},
//       {'label': 'May', 'numberOfVisits': 76},
//       {'label': 'June', 'numberOfVisits': 35},
//     ];
//   }
// }

// class VisitData {
//   final String label;
//   final int numberOfVisits;

//   VisitData({required this.label, required this.numberOfVisits});
// }
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class ChartWidget extends StatelessWidget {
//   ChartWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Fetch data
//     final data = getSampleData();

//     List<charts.Series<VisitData, String>> series = [
//       charts.Series(
//         id: 'Visits',
//         data: _generateData(data),
//         domainFn: (VisitData visit, _) => visit.label,
//         measureFn: (VisitData visit, _) => visit.numberOfVisits,
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Visit Data Chart'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: charts.BarChart(
//           series,
//           animate: true,
//         ),
//       ),
//     );
//   }

//   List<VisitData> _generateData(List<Map<String, dynamic>> data) {
//     return data
//         .map((item) => VisitData(
//             label: item['label'] as String,
//             numberOfVisits: item['numberOfVisits'] as int))
//         .toList();
//   }

//   List<Map<String, dynamic>> getSampleData() {
//     return [
//       {'label': 'January', 'numberOfVisits': 30},
//       {'label': 'February', 'numberOfVisits': 42},
//       {'label': 'March', 'numberOfVisits': 54},
//       {'label': 'April', 'numberOfVisits': 20},
//       {'label': 'May', 'numberOfVisits': 76},
//       {'label': 'June', 'numberOfVisits': 35},
//     ];
//   }
// }

// class VisitData {
//   final String label;
//   final int numberOfVisits;

//   VisitData({required this.label, required this.numberOfVisits});
// }

