library spider_chart;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class SpiderChart extends StatelessWidget {
  final List<double> data;
  final double maxValue;
  final List<Color> colors;
  final decimalPrecision;
  final Size size;
  final double fallbackHeight;
  final double fallbackWidth;
  final String avatarImg;

  SpiderChart({
    Key key,
    @required this.data,
    @required this.colors,
    @required this.maxValue,
    this.size = Size.infinite,
    this.decimalPrecision = 0,
    this.fallbackHeight = 290,
    this.fallbackWidth = 290,
    this.avatarImg = "assets/images/AVATAR_SKILL.png"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack (
      alignment: Alignment.center,
      children: <Widget>[
        LimitedBox(
          maxWidth: fallbackWidth,
          maxHeight: fallbackHeight,
          child: CustomPaint(
            size: size,
            painter: SpiderChartPainter(data, maxValue, colors, decimalPrecision),
          ),
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ],
    );
  }
}

class SpiderChartPainter extends CustomPainter {
  final List<double> data;
  final double maxNumber;
  final List<Color> colors;
  final decimalPrecision;

  final Paint spokes = Paint()..color = new Color(0xFFbceafe);

  final Paint fill = Paint()
    ..color = Color.fromARGB(210, 86, 116, 213)
    ..style = PaintingStyle.fill;

  final Paint stroke = Paint()
    ..color = Color.fromARGB(255, 50, 50, 50)
    ..style = PaintingStyle.stroke;

  SpiderChartPainter(
      this.data, this.maxNumber, this.colors, this.decimalPrecision);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    double angle = (2 * pi) / data.length;

    var points = List<Offset>();
    var points1 = List<Offset>();

    for (var i = 0; i < data.length; i++) {
      var scaledRadius = (data[i] / maxNumber) * center.dy;
      var x = scaledRadius * cos(angle * i - pi / 2);
      var y = scaledRadius * sin(angle * i - pi / 2);

      var scaledRadius1 = (11.3 / maxNumber) * center.dy;
      var x1 = scaledRadius1 * cos(angle * i - pi / 2);
      var y1 = scaledRadius1 * sin(angle * i - pi / 2);

      points.add(Offset(x, y) + center);
      points1.add(Offset(x1, y1) + center);
    }

    paintGraphOutline(canvas, center, angle);
    paintDataLines(canvas, points);
    paintDataPoints(canvas, points1);
    //paintText(canvas, center, points, data);
  }

  void paintDataLines(Canvas canvas, List<Offset> points) {
    Path path = Path()..addPolygon(points, true);

    canvas.drawPath(
      path,
      fill,
    );

    canvas.drawPath(path, stroke);

    canvas.drawShadow(path, Colors.black87, 3, true);
  }

  void paintDataPoints(Canvas canvas, List<Offset> points) {
    for (var i = 0; i < points.length; i++) {
      Path path = new Path();
      Rect myRect = Rect.fromLTWH(points[i].dx - 13, points[i].dy - 15, 32, 32);
      path.addOval(myRect);

      canvas.drawShadow(path, Colors.black, 3, true);

      Paint p = new Paint();

      //p.color = colors[i];
      //p.shader = createShader(Rect.fromCircle(points[0], 20));

      Rect shaderRect = Rect.fromLTWH(points[i].dx - 8, points[i].dy - 8, 16, 16);

      p.shader = RadialGradient(center: Alignment.center , colors: <Color> [ Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.grey ], radius: 1).createShader(shaderRect);

      canvas.drawCircle(points[i], 16.0, p);
    }
  }

  void paintText(
      Canvas canvas, Offset center, List<Offset> points, List<double> data) {
    var textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var i = 0; i < points.length; i++) {
      // ignore: unused_local_variable
      String s = data[i].toStringAsFixed(decimalPrecision);
      textPainter.text =
          TextSpan(text: "", style: TextStyle(color: Colors.black));
      textPainter.layout();
      if (points[i].dx < center.dx) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width + 5.0), 0));
      } else if (points[i].dx > center.dx) {
        textPainter.paint(canvas, points[i].translate(5.0, 0));
      } else if (points[i].dy < center.dy) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), -20));
      } else {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), 4));
      }
    }
  }

  void paintGraphOutline(Canvas canvas, Offset center, double angle) {
    var outline = List<Offset>();

    var distances = List<int>();
    distances = [120, 100, 80, 60];

    for (var i = 0; i < distances.length; i++) {
      for (var j = 0; j < data.length; j++) {
        var x = center.dy-distances[i] * cos(angle * j - pi / 2);
        var y = center.dy-distances[i] * sin(angle * j - pi / 2);

        outline.add(Offset(x, y) + center.translate(center.dx-330, center.dy-250));
        //canvas.drawLine(center, outline[i], spokes);
      }

      outline.add(outline[0]);

      canvas.drawPoints(PointMode.polygon, outline, spokes);

      outline.clear();
    }


    //canvas.drawCircle(center, 2, spokes);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
