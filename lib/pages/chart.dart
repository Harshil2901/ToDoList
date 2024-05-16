import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showChart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.bounceInOut,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color(0xFF002FFF).withAlpha(20),
                    offset: const Offset(0.5, 0.5),
                    blurRadius: 100,
                    spreadRadius: 10)
              ]),
              width: 200,
              height: _showChart ? 90 : 0,
              child: LineChart(
                LineChartData(
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(
                        drawHorizontalLine: false, show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    titlesData: const FlTitlesData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                          spots: const [
                            FlSpot(0, 1),
                            FlSpot(1, 2),
                            FlSpot(2, 1),
                            FlSpot(3, 2),
                            FlSpot(4, 1),
                            FlSpot(5, 4),
                            FlSpot(6, 2),
                            FlSpot(7, 1),
                            FlSpot(8, 2),
                            FlSpot(9, 4),
                            FlSpot(10, 3),
                          ],
                          isCurved: true,
                          color: const Color(0xFF002FFF),
                          barWidth: 2,
                          dotData: const FlDotData(show: false))
                    ]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Good",
            style: GoogleFonts.lato(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Text(
            "Consistency",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
