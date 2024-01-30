@JS()
library fabric;

import 'dart:convert';
import 'dart:html';

import 'dart:js_util';
import 'package:js/js.dart';

// Calls invoke JavaScript `JSON.stringify(obj)`.
@JS('JSON.stringify')
external String jsonStringify(obj);

/// convert the a javascript object to a valid map
dynamic jsObjToMap(dynamic object) {
  return jsonDecode(jsonStringify(object));
}

// @JS('getFabricStateProperties')
// external getFabricStateProperties(fabricObj);

/// A workaround to converting an object from JS to a Dart Map.
Map jsToMap(jsObject) {
  return Map.fromIterable(
    getKeysOfObject(jsObject),
    value: (key) => getProperty(jsObject, key),
  );
}

@JS('Object.keys')
external List<String> getKeysOfObject(jsObject);

@JS('Object.entries')
external List<List> getObjectEntries(jsObject);

@JS('fabric.loadSVGFromString')
external void loadSVGFromString(String string,
    void Function(List<FabricObject> results, dynamic options) callback,
    [Function reviver]);

/// Groups SVG elements (usually those retrieved from SVG document)
@JS('fabric.util.groupSVGElements')
external Group /*Object|Group*/ groupSVGElements(List<dynamic> elements,
    [dynamic options, String path]);

/// Takes url corresponding to an SVG document, and parses it into a set of fabric objects.
/// Note that SVG is fetched via XMLHttpRequest, so it needs to conform to SOP (Same Origin Policy)
/// /void Function (List<FabricObject> results, dynamic options,dynamic elements,dynamic allElements) callback,
@JS('fabric.loadSVGFromURL')
external void loadSVGFromURL(
    String url,
    void Function(List<dynamic> results, dynamic options, dynamic elements,
            dynamic allElements)
        callback,
    [Function reviver,
    dynamic /*{ crossOrigin?: string | undefined }*/ options]);

@anonymous
@JS()
abstract class IDataURLOptions {
  /// The format of the output image. Either "jpeg" or "png"
  external dynamic /*String|dynamic*/ get format;
  external set format(dynamic /*String|dynamic*/ v);

  /// Quality level (0..1). Only used for jpeg
  external dynamic /*num|dynamic*/ get quality;
  external set quality(dynamic /*num|dynamic*/ v);

  /// Multiplier to scale by
  external dynamic /*num|dynamic*/ get multiplier;
  external set multiplier(dynamic /*num|dynamic*/ v);

  /// Cropping left offset. Introduced in v1.2.14
  external dynamic /*num|dynamic*/ get left;
  external set left(dynamic /*num|dynamic*/ v);

  /// Cropping top offset. Introduced in v1.2.14
  external dynamic /*num|dynamic*/ get top;
  external set top(dynamic /*num|dynamic*/ v);

  /// Cropping width. Introduced in v1.2.14
  external dynamic /*num|dynamic*/ get width;
  external set width(dynamic /*num|dynamic*/ v);

  /// Cropping height. Introduced in v1.2.14
  external dynamic /*num|dynamic*/ get height;
  external set height(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get enableRetinaScaling;
  external set enableRetinaScaling(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get withoutTransform;
  external set withoutTransform(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get withoutShadow;
  external set withoutShadow(dynamic /*bool|dynamic*/ v);
  external factory IDataURLOptions(
      {dynamic /*String|dynamic*/ format,
      dynamic /*num|dynamic*/ quality,
      dynamic /*num|dynamic*/ multiplier,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*bool|dynamic*/ enableRetinaScaling,
      dynamic /*bool|dynamic*/ withoutTransform,
      dynamic /*bool|dynamic*/ withoutShadow});
}

/// canvas = new fabric.Canvas(html.querySelector('#canvas'), {
///   hoverCursor: 'pointer',
///   selection: true,
///   selectionBorderColor: 'blue',
///   isDrawingMode: true
/// });
@JS('fabric.Canvas')
class Canvas {
  external Canvas(Element? element, [config]);
  external add(dynamic element);

  external calcOffset();
  external on(dynamic event, dynamic func);

  /// Stops event observing for a particular event handler. Calling this method
  /// without arguments removes all handlers for all events
  /// void Function(IEvent e) handler
  external off(dynamic eventName, dynamic func);

  external String toDataURL([IDataURLOptions options]);

  /// Fires event with an optional options object
  /// @chainable
  external fire(String eventName, [dynamic options]);

  external Point getPointer(Event e, [bool ignoreZoom]);

  external num getZoom();

  /// When true, mouse events on canvas (mousedown/mousemove/mouseup) result in free drawing.
  /// After mousedown, mousemove creates a shape,
  /// and then mouseup finalizes it and adds an instance of `fabric.Path` onto canvas.
  external dynamic /*bool|dynamic*/ get isDrawingMode;
  external set isDrawingMode(dynamic /*bool|dynamic*/ v);

  external dynamic /*List<num>|dynamic*/ get viewportTransform;
  external set viewportTransform(dynamic /*List<num>|dynamic*/ v);

  /// Sets viewport transformation of this canvas instance
  /// [vpt] List<num> vpt a Canvas 2D API transform matrix
  /// @return {fabric.Canvas} instance
  /// @chainable true
  external Canvas setViewportTransform(vpt);
  external Canvas zoomToPoint(Point point, num value);
  external Canvas setZoom(num value);
  external FabricObject? getActiveObject();
  external centerObject(dynamic element);

  /// Returns an array of children objects of this instance
  /// Type parameter introduced in 1.3.10
  external List<FabricObject> getObjects([String type]);
  //external List<dynamic> getObjects([String type]);

  external List<dynamic> getActiveObjects();

  /// http://fabricjs.com/docs/fabric.Canvas.html#toJSON
  /// Returns Object representation of canvas this alias is provided because if you call JSON.stringify on an instance, the toJSON object will be invoked if it exists. Having a toJSON method means you can do JSON.stringify(myCanvas)
  /// [propertiesToInclude]	Array	<optional> Any properties that you might want to additionally include in the output
  /// usa o  toObject na linha 20378 de fabric.js
  external toJSON([List<String> propertiesToInclude]);

  /// Returns dataless JSON representation of canvas
  /// @param {Array} [propertiesToInclude] Any properties that you might want to additionally include in the output
  /// @return {String} json string
  external dynamic /*{ version: string; objects: Object[] }*/ toDatalessJSON(
      [List<String> propertiesToInclude]);

  /// http://fabricjs.com/docs/fabric.Canvas.html#loadFromJSON
  /// Populates canvas with data from the specified JSON. JSON format must conform to the one of fabric.Canvas#toJSON
  /// [json]	String | Object		JSON string or jsObject
  /// [callback]	function	Callback, invoked when json is parsed and corresponding objects (e.g: fabric.Image) are initialized
  /// [reviver]	function <optional> Method for further parsing of JSON elements, called after each fabric object created.
  /// definido na linha 14234
  external Canvas loadFromJSON(json, Function callback, [Function reviveropt]);

  /// Returns svg clipPath representation of an instance
  external String toClipPathSVG([Function reviver]);

  /// Returns svg representation of an instance
  external String toSVG([dynamic functionReviver]);

  external remove(dynamic element);

  external setWidth(num v);
  external setHeight(num v);

  external getWidth();
  external getHeight();

  /// Method that determines what object we are clicking on
  /// the skipGroup parameter is for internal use, is needed for shift+click action
  external dynamic /*Object|dynamic*/ findTarget(Event e, bool skipGroup);

  /// Indicates if the right click on canvas can output the context menu or not
  /// @since 1.6.5
  /// @default
  external dynamic /*bool|dynamic*/ get stopContextMenu;
  external set stopContextMenu(dynamic /*bool|dynamic*/ v);

  /// Indicates if the canvas can fire right click events
  /// @since 1.6.5
  /// @default
  external dynamic /*bool|dynamic*/ get fireRightClick;
  external set fireRightClick(dynamic /*bool|dynamic*/ v);

  /// Indicates if the canvas can fire middle click events
  /// @since 1.7.8
  /// @default
  external dynamic /*bool|dynamic*/ get fireMiddleClick;
  external set fireMiddleClick(dynamic /*bool|dynamic*/ v);

  external Canvas discardActiveObject([Event e]);
  external Canvas setActiveObject(dynamic object, [Event e]);

  external Canvas clearContext(CanvasRenderingContext2D ctx);
  external CanvasRenderingContext2D getContext();
  external Canvas clear();
  external Canvas renderAll();
  external Canvas renderAndReset();
  external Canvas requestRenderAll();

  external Canvas sendToBack(dynamic object);
  external Canvas bringToFront(dynamic object);
  external Canvas sendBackwards(dynamic object, [bool intersecting]);
  external Canvas bringForward(dynamic object, [bool intersecting]);
  external Canvas moveTo(dynamic object, num index);
  external Canvas dispose();

  external dynamic /*bool|dynamic*/ get selection;
  external set selection(dynamic /*bool|dynamic*/ v);
}

extension CanvasExtension on Canvas {
  /// _activeObject
  dynamic get activeObjectProperty {
    return getProperty(this, '_activeObject');
  }

  /// _activeObject
  set activeObjectProperty(dynamic v) {
    setProperty(this, '_activeObject', v);
  }
}

@anonymous
@JS()
abstract class StateProperties {
  external num get top;
  external num get left;
  external num get width;
  external num get height;
  external num get scaleX;
  external num get scaleY;
  external bool? get flipX;
  external bool? get flipY;
  external num get angle; //0,
  external String? get originX;
  external String? get originY;
  external dynamic get stroke;
  external dynamic get strokeWidth; //: 1,
  external dynamic get strokeDashArray; //: null,
  external dynamic get strokeLineCap; //: "butt",
  external dynamic get strokeDashOffset; //: 0,
  external dynamic get strokeLineJoin; //: "miter",
  external dynamic get strokeMiterLimit; //: 4,
  external dynamic get opacity; //": 1,
  external dynamic get fill; // "#3C129A",
  external dynamic get globalCompositeOperation; // "source-over",
  external dynamic get shadow; // null,
  external dynamic get visible; // true,
  external dynamic get backgroundColor; // "",
  external dynamic get skewX; // 0,
  external dynamic get skewY; // 0,
  external dynamic get fillRule; // "nonzero",
  external dynamic get paintFirst; // "fill",
  external dynamic get strokeUniform; // false,
  external dynamic get rx; // 0,
  external dynamic get ry; // 0
}

extension FabricObjectExtension on FabricObject {
  dynamic get getStateProperties {
    return getProperty(this, '_stateProperties');
  }

  Map<String, dynamic>? get statePropertiesAsMap {
    final sp = getStateProperties;
    if (sp == null) {
      return null;
    }
    final en = getObjectEntries(sp);
    return {for (var item in en) (item).first: (item).last};
  }

  List<String> get statePropertiesKeys {
    final res = <String>[];
    if (stateProperties is List) {
      for (var item in stateProperties) {
        if (item is String) {
          res.add(item);
        }
      }
    }
    return res;
  }
}

@anonymous
@JS()
abstract class FabricObject {
  external FabricObject rotate(num angle);
  external FabricObject centerH();
  external FabricObject viewportCenterH();
  external FabricObject centerV();
  external FabricObject viewportCenterV();
  external FabricObject center();
  external FabricObject viewportCenter();

  /// Size of object's controlling corners (in pixels)
  /// @type Number
  /// @default
  external dynamic /*num|dynamic*/ get cornerSize;
  external set cornerSize(dynamic /*num|dynamic*/ v);

  external dynamic /*bool|dynamic*/ get strokeUniform;
  external set strokeUniform(dynamic /*bool|dynamic*/ v);

  external dynamic get originX;
  external set originX(dynamic v);

  external dynamic get originY;
  external set originY(dynamic v);

  external dynamic toObject([List<String> propertiesToInclude]);
  external dynamic /*bool|dynamic*/ get selectable;
  external set selectable(dynamic /*bool|dynamic*/ v);

  external Canvas? get canvas;
  external set canvas(Canvas? v);

  external dynamic get /*Group|dynamic*/ group;
  external set group(dynamic v);

  external dynamic get /*bool|dynamic*/ dirty;
  external set dirty(dynamic v);

  /// Executes given function for each object in this group
  external forEachObject(
      void Function(FabricObject element, num index, List<FabricObject> array)
          callback,
      [dynamic context]);

  external dynamic /*List<String>|dynamic*/ get stateProperties;
  external dynamic /*List<String>|dynamic*/ get cacheProperties;

  /// Saves state of an object
  external FabricObject saveState(
      [dynamic /*{ stateProperties?: any[] | undefined; propertySet?: string | undefined }*/
          options]);

  external dynamic get id;
  external set id(dynamic v);

  external dynamic get type;
  external set type(dynamic v);

  external dynamic get borderColor;
  external set borderColor(dynamic v);

  external dynamic /*num|dynamic*/ get left;
  external set left(dynamic /*num|dynamic*/ v);

  external dynamic /*num|dynamic*/ get top;
  external set top(dynamic /*num|dynamic*/ v);

  external dynamic /*num|dynamic*/ get angle;
  external set angle(dynamic /*num|dynamic*/ v);

  external num get width;
  external set width(num v);

  external num get height;
  external set height(num v);

  external num get scaleX;
  external set scaleX(num v);

  external num get rx;
  external set rx(num v);

  external num get ry;
  external set ry(num v);

  external num get scaleY;
  external set scaleY(num v);

  external dynamic /*num|dynamic*/ get strokeWidth;
  external set strokeWidth(dynamic /*num|dynamic*/ v);

  external setCoords();

  /// rect.set('fill', 'red');
  /// rect.set({ strokeWidth: 5, stroke: 'rgba(100,200,200,0.5)' });
  /// rect.set('angle', 15).set('flipY', true);
  external FabricObject set(dynamic propNameOrMap, [dynamic val]);

  external get(dynamic propName);

  /// Scales an object (equally by x and y)
  external FabricObject scale(num value);

  /// Scales an object to a given height, with respect to bounding box (scaling by x/y equally)
  external FabricObject scaleToHeight(num value, [bool absolute]);

  /// Scales an object to a given width, with respect to bounding box (scaling by x/y equally)
  external FabricObject scaleToWidth(num value, [bool absolute]);

  /// Calculate and returns the .coords of an object.
  /// @chainable
  external dynamic calcCoords([bool absolute]);

  external bool onDeselect(
      dynamic /*{ e?: Event | undefined; object?: Object | undefined }|{ e?: Event | undefined; object?: fabric.Object | undefined }*/
          options);

  /// This callback function is called every time _discardActiveObject or _setActiveObject
  /// try to to select this object. If the function returns true, the process is cancelled
  external bool onSelect(dynamic /*{ e?: Event | undefined }*/ options);

  external num getScaledWidth();
  external num getScaledHeight();

  external setAngle(num angle);

  /// functions from object stacking mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Moves an object up in stack of drawn objects
  external FabricObject bringForward([bool intersecting]);

  /// Moves an object to the top of the stack of drawn objects
  external FabricObject bringToFront();

  /// Moves an object down in stack of drawn objects
  external FabricObject sendBackwards([bool intersecting]);

  /// Moves an object to the bottom of the stack of drawn objects
  external FabricObject sendToBack();

  /// Moves an object to specified level in stack of drawn objects
  external FabricObject moveTo(num index);

  /// functions from object origin mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Translates the coordinates from origin to center coordinates (based on the object's dimensions)
  external Point translateToCenterPoint(
      Point point, String originX, String originY);

  /// Translates the coordinates from center to origin coordinates (based on the object's dimensions)
  external Point translateToOriginPoint(
      Point center, String originX, String originY);

  /// Returns the real center coordinates of the object
  external Point getCenterPoint();

  /// Returns the coordinates of the object as if it has a different origin
  external Point getPointByOrigin(String originX, String originY);

  /// Returns the point in local coordinates
  external Point toLocalPoint(Point point, String originX, String originY);

  /// Sets the position of the object taking into consideration the object's origin
  external void setPositionByOrigin(Point pos, String originX, String originY);
  external void adjustPosition(String to);

  /// Returns coordinates of object's bounding rectangle (left, top, width, height)
  /// the box is intented as aligned to axis of canvas.
  external BoundingRect getBoundingRect([bool absolute, bool calculate]);

  external void clone(Function callback, [List<String> propertiesToInclude]);

  external Group toGroup();
  external ActiveSelection toActiveSelection();
}

@anonymous
@JS()
abstract class BoundingRect {
  external num left;
  external num top;
  external num width;
  external num height;
}

extension BoundingRectExtension on BoundingRect {
  num get bottom => top + height;
  num get right => left + width;
  num get middleY => top + (height / 2);
}

// @anonymous
// @JS()
// class Group extends FabricObject {
//   external factory Group({String locationName, String locationPath});
// }

@JS('fabric.Rect')
class Rect extends FabricObject {
  external Rect(options);
}

/// Line([i, 25, i, 50],
@JS('fabric.Line')
class Line extends FabricObject {
  external Line(List<num> vals, options);
}

@JS('fabric.Circle')
class Circle extends FabricObject {
  external Circle(options);
}

@JS('fabric.Triangle')
class Triangle extends FabricObject {
  external Triangle(options);
}

@JS('fabric.Image')
class Image extends FabricObject {
  /// var imgElement = document.getElementsByClassName('imgBox');
  /// var imgInstance = new fabric.Image(imgElement, {
  ///   left: 100,
  ///   top: 100,
  ///   height: 30,
  ///   width: 30
  /// });
  /// canvas.add(imgInstance);
  external Image(imgElement, [options]);

  /// Creates an instance of fabric.Image from an URL string
  /// @static
  /// @param {String} url URL to create an image from
  /// @param {Function} [callback] Callback to invoke when image is created (newly created image is passed as a first argument). Second argument is a boolean indicating if an error occurred or not.
  /// @param {Object} [imgOptions] Options object
  external static Image fromURL(dynamic url,
      [Function callback, dynamic imgOptions]);

  external static Image fromElement(dynamic svgElement, Function callback,
      [dynamic options]);
}

@JS('fabric.Group')
class Group extends FabricObject {
  external Group(List<dynamic> objects,
      [dynamic /*Object*/ options, bool isAlreadyGrouped]);

  /// Returns an array of children objects of this instance
  /// Type parameter introduced in 1.3.10
  external List<FabricObject> getObjects([String type]);
}

extension GroupExtension on Group {
  /// _objects
  List<FabricObject> get propertyObjects {
    return getProperty(this, '_objects');
  }

  /// _objects
  set propertyObjects(val) {
    setProperty(this, '_objects', val);
  }
}

/// rect1 and rect2 are 2 object on a canvas, canvas is the canvas instance
/// var selection = new fabric.ActiveSelection([rect1, rect2], {
///   canvas: canvas
/// });
/// canvas.setActiveObject(selection);
///
/// Add an object to a multi selection
///  rect1 and rect2 are 2 object on a canvas, grouped in a multi selection
//  rect3 is another object on the canvas
/// var selection = canvas.getActiveObject();
/// if (selection.type === 'activeSelection') {
///   selection.addWithUpdate(rect3)
/// }
@JS('fabric.ActiveSelection')
class ActiveSelection extends FabricObject {
  external ActiveSelection(List<dynamic> objects, [dynamic /*Object*/ options]);
  external static void fromObject(dynamic object, Function callback);

  external List<FabricObject> getObjects([String type]);

  //external Group toGroup();
}

extension ActiveSelectionExtension on ActiveSelection {
  /// _objects
  List<FabricObject> get propertyObjects {
    return getProperty(this, '_objects');
  }

  /// _objects
  set propertyObjects(val) {
    setProperty(this, '_objects', val);
  }
}

/// var t = new fabric.Text(stationID, {
///         fontFamily: 'Calibri',
///         fontSize: 1.2,
///         textAlign: 'center',
///         originX: 'center',
///         originY: 'center',
///         left: LayoutCoordX(STA),
///         top: LayoutCoordY(BL-BLOffset)-radius-.4
///     });
@JS('fabric.Text')
class Text extends FabricObject {
  external Text(dynamic text, [dynamic /*Object*/ options]);
}

@JS('fabric.IText')
class IText extends FabricObject {
  external IText(dynamic text, [dynamic /*Object*/ options]);
}

@JS('fabric.Textbox')
class Textbox extends FabricObject {
  external Textbox(dynamic text, [dynamic /*Object*/ options]);
}

// @anonymous
// @JS()
// class IPoint {
//   external num get x;
//   external set x(num v);
//   external num get y;
//   external set y(num v);
//   external IPoint(num x, num y);
// }

/// selection:created
@JS()
@anonymous
abstract class SelectionEvent {
  external MouseEvent get e;
  external List<dynamic> get selected;
}

/// object:modified
@JS()
@anonymous
abstract class ModifiedEvent {
  external MouseEvent get e;
  external get target;
  external get transform;
  external String get action;
}

/// mouse:wheel
@JS()
@anonymous
abstract class MouseWheelEvent {
  external WheelEvent get e;
  external get target;
  external List get subTargets;
  external num get button;
  external bool get isClick;
  external Point get pointer;
  external Point get absolutePointer;
  external get transform;
}

/// mouse:move
@JS()
@anonymous
abstract class MouseMoveEvent {
  external MouseEvent get e;
  external get target;
  external List get subTargets;
  external num get button;
  external bool get isClick;
  external Point get pointer;
  external get transform;
}

/// mouse:down
@JS()
@anonymous
abstract class MouseDownEvent {
  external MouseEvent get e;
  external get target;
  external List get subTargets;
  external num get button;
  external bool get isClick;
  external Point get pointer;
  external Point get absolutePointer;
  external get transform;
}

/// mouse:up
@JS()
@anonymous
abstract class MouseUpEvent {
  external MouseEvent get e;
  external get target;
  external get currentTarget;
  external List get subTargets;
  external List get currentSubTargets;
  external num get button;
  external bool get isClick;
  external Point get pointer;
  external Point get absolutePointer;
  external get transform;
}

/// object:scaling
@JS()
@anonymous
abstract class ObjectScalingEvent {
  external MouseEvent get e;
  external get target;
  external Point get pointer;
  external get transform;
}

/// object:moving
@JS()
@anonymous
abstract class ObjectMovingEvent {
  external MouseEvent get e;
  external get target;
  external Point get pointer;
  external get transform;
}

@JS("fabric.Point")
class Point {
  external num x;
  external num y;
  external factory Point(num x, num y);
}


// @JS('fabric.Textbox')
// class Textbox extends FabricObject {
//   external Textbox(dynamic text, [dynamic /*Object*/ options]);
// }