# fabricjs

A Dart API for [fabric.js](http://fabricjs.com/)


### example

To run `webdev serve example:8081` from the root directory of project

#### example.dart

```dart
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

```
#### index.html

```html
<!doctype html>
<html>

<head>
  <title>Fabric.js and Dart interop example</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/5.3.1/fabric.min.js"></script>
  <script defer type="application/javascript" src="example.dart.js"></script>
  <style type="text/css">
    html,
    body {
      margin: 0;
      background-color: rgb(211, 211, 211);
      height: 100%;
      font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    }

    .main {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
    }

    .wrapper {
      background-color: rgb(255, 255, 255);
      outline: none;
    }

    .tools {
      color: white;
      background-color: rgb(130, 129, 129);
    }
  </style>
</head>

<body>
  <div class="main">
    <div class="container">
      <div class="wrapper" tabindex="1000">
        <canvas id="canvas" height="450" width="600"></canvas>
      </div>
      <div class="tools">
        <button id="btnDrawToggle" type="button">Selection Mode</button>
        <span>X:<span id="spanX"></span></span>
        <span>Y:<span id="spanY"></span></span>
        Example of the <a href="http://fabricjs.com/">Dart API for fabric.js</a>
      </div>

    </div>
  </div>
</body>

</html>
```