import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskCard extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String subtitle;

  TaskCard({
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularPercentIndicator(
                      animation: true,
                      radius: 55.0,
                      percent: loadingPercent,
                      lineWidth: 5.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.white10,
                      progressColor: Colors.white,
                      center: Text(
                        '${(loadingPercent*100).round()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),

                  Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
                ],
              ),
              
              // here is the delete button

            


            ],
          ),
          Container(
            // alignment: AlignmentGeometry(),
            child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.white54,
              fontWeight: FontWeight.w400,
            ),
              ),
          ),
        ],
      ),
    );
  }
}

