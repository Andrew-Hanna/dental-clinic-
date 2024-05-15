import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatelessWidget {
  ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch data
    final data = getSampleData();

    List<charts.Series<VisitData, String>> series = [
      charts.Series(
        id: 'Visits',
        data: _generateData(data),
        domainFn: (VisitData visit, _) => visit.label,
        measureFn: (VisitData visit, _) => visit.numberOfVisits,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visit Data Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }

  List<VisitData> _generateData(List<Map<String, dynamic>> data) {
    return data
        .map((item) => VisitData(
            label: item['label'] as String,
            numberOfVisits: item['numberOfVisits'] as int))
        .toList();
  }

  List<Map<String, dynamic>> getSampleData() {
    return [
      {'label': 'January', 'numberOfVisits': 30},
      {'label': 'February', 'numberOfVisits': 42},
      {'label': 'March', 'numberOfVisits': 54},
      {'label': 'April', 'numberOfVisits': 20},
      {'label': 'May', 'numberOfVisits': 76},
      {'label': 'June', 'numberOfVisits': 35},
    ];
  }
}

class VisitData {
  final String label;
  final int numberOfVisits;

  VisitData({required this.label, required this.numberOfVisits});
}

void main() {
  runApp(MaterialApp(
    home: ChartWidget(),
  ));
}
