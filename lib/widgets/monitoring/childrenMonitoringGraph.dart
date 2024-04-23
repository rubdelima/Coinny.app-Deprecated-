import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class ChildrenMonitoringGraph extends StatelessWidget {
  final List<Children> children;
  final Children? selectedChild;

  ChildrenMonitoringGraph({
    required this.children,
    this.selectedChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> predefinedColors = [
  Colors.green as Color,
  Colors.blue as Color,
  Colors.yellow as Color,
  Colors.red as Color,
  Colors.purple as Color,
  Colors.orange as Color,
];


    List<Color> colors;
    if (selectedChild == null) {
      colors = [Colors.grey, ...predefinedColors.take(children.length)];
    } else {
      int index = children.indexOf(selectedChild!);
      colors = [index != -1 ? predefinedColors[index % predefinedColors.length] : Colors.orange];
    }
    
    List<String> names = selectedChild == null
      ? ['Todos'] + children.map((child) => child.name.split(' ')[0]).toList()
      : [selectedChild!.name.split(' ')[0]];

    List<List<_ChartData>> chartData = [];
    if (selectedChild == null) {
      chartData.add(_createChartDataForAll(children));
      chartData.addAll(children.map((child) => _createChartData(child.xpPerDay)));
    } else {
      chartData.add(_createChartData(selectedChild!.xpPerDay));
    }


    return SfCartesianChart(
      legend: Legend(
        isVisible: true, overflowMode: LegendItemOverflowMode.scroll,alignment: ChartAlignment.near, textStyle:TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold
        ) ),
      primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(color: Colors.black.withOpacity(0.1)),),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 1000, interval: 200, majorGridLines: MajorGridLines(color: Colors.black.withOpacity(0.1)),),

      series: List.generate(
        chartData.length,
        (index) => AreaSeries<_ChartData, String>(
          dataSource: chartData[index],
          color: colors[index % colors.length].withOpacity(0.7),
          name: names[index],
          borderDrawMode: BorderDrawMode.top,
          borderColor: colors[index % colors.length].withOpacity(0.5),
          borderWidth: 1,
          legendIconType: LegendIconType.circle,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          gradient: LinearGradient(
            colors: [colors[index % colors.length].withOpacity(0), colors[index % colors.length].withOpacity(0.8)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        
      ),
    );
  }

    List<_ChartData> _createChartDataForAll(List<Children> children) {
    final DateTime now = DateTime.now();
    final DateTime normalizedDateTime = DateTime(now.year, now.month, now.day);
    return List.generate(7, (i){
      DateTime day = normalizedDateTime.subtract(Duration(days: 6 - i));
      String label = DateFormat('dd/MM').format(day);
      int xp = 0;
      for (var child in children){
        xp += child.xpPerDay[day] ?? 0;
      }
      return _ChartData(label, xp.toDouble());
    });
  }

  List<_ChartData> _createChartData(Map<DateTime, int> xpPerDay) {
    final DateTime now = DateTime.now();
    final DateTime normalizedDateTime = DateTime(now.year, now.month, now.day);
    return List.generate(7, (i) {
        
        DateTime day = normalizedDateTime.subtract(Duration(days: 6 - i));
        String label = DateFormat('dd/MM').format(day);
        int xp = xpPerDay[day] ?? 0;
        return _ChartData(label, xp.toDouble());
    });
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}