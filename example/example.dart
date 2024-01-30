import 'dart:html' as html;
import 'dart:math' as math;

import 'package:fabricjs/fabricjs.dart';
import 'package:js/js_util.dart';

final rnd = math.Random();
void main() {
  final canvasEle = html.querySelector('#canvas') as html.CanvasElement;
  final btnDrawToggle = html.querySelector('#btnDrawToggle');
  final wrapper = html.querySelector('.wrapper');

  final canvas = Canvas(
      canvasEle,
      jsify({
        'hoverCursor': 'pointer',
        'selection': true,
        'selectionBorderColor': 'blue',
        'isDrawingMode': false
      }));

  for (final i in List.generate(10, (i) => i)) {
    var x = rnd.nextDouble() * (canvasEle.width! - 120);
    var y = rnd.nextDouble() * (canvasEle.height! - 120);
    if (i % 2 == 0) {
      canvas.add(Rect(jsify({
        'left': x,
        'top': y,
        'width': rnd.nextInt(120),
        'height': rnd.nextInt(120),
        'fill': genColor()
      })));
    } else {
      canvas.add(Circle(jsify({
        'left': x,
        'top': y,
        'radius': rnd.nextInt(90),
        'fill': genColor(),
      })));
    }
  }

  canvas.on('object:moving', allowInterop((ObjectMovingEvent e) {
    final target = e.target as FabricObject;
    html.querySelector('#spanX')?.text = target.left.toStringAsFixed(2);
    html.querySelector('#spanY')?.text = target.top.toStringAsFixed(2);
  }));

  btnDrawToggle?.onClick.listen((e) {
    canvas.isDrawingMode = !canvas.isDrawingMode;
    btnDrawToggle.text = canvas.isDrawingMode ? 'Draw Mode' : 'Selection Mode';
  });

  wrapper?.onKeyDown.listen((event) {
    if (event.keyCode == html.KeyCode.DELETE) {
      final targets = canvas.getActiveObjects();
      if (targets.isNotEmpty) {
        canvas.remove(targets);
        for (var element in targets) {
          canvas.remove(element);
        }
      }
      canvas.discardActiveObject().renderAll();
    }
  });
}

String genColor() {
  int r = rnd.nextInt(256);
  int g = rnd.nextInt(256);
  int b = rnd.nextInt(256);
  String hexColor = '#${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
  return hexColor;
}
