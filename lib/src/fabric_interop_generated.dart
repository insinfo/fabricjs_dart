// ignore_for_file: constant_identifier_names, unused_element, non_constant_identifier_names, annotate_overrides

@JS("fabric")
library fabric;

import 'dart:html';
import 'dart:html' as dart_html;
import 'dart:svg' as dart_svg;


import "package:js/js.dart";

//extends dart_svg.SvgElement implements dart_svg.UriReference
@JS("SVGGradientElement")
class GradientElement {
  // To suppress missing implicit constructor warnings.
  factory GradientElement._() {
    throw UnsupportedError("Not supported");
  }

  ///
  /// Constructor instantiated by the DOM when a custom element has been created.
  ///
  /// This can only be called by subclasses from their created constructor.
  ///
  //GradientElement.created() : super.created();

  static const int SVG_SPREADMETHOD_PAD = 1;

  static const int SVG_SPREADMETHOD_REFLECT = 2;

  static const int SVG_SPREADMETHOD_REPEAT = 3;

  static const int SVG_SPREADMETHOD_UNKNOWN = 0;

  external dart_svg.AnimatedTransformList? get gradientTransform;

  external dart_svg.AnimatedEnumeration? get gradientUnits;

  external dart_svg.AnimatedEnumeration? get spreadMethod;

  // From SVGURIReference

  external dart_svg.AnimatedString? get href;
}

typedef SVGGradientElement = dynamic;
typedef SVGElement = dart_svg.SvgElement;
typedef HTMLElement = dart_html.HtmlElement;
typedef HTMLCanvasElement = dart_html.CanvasElement;
typedef XMLHttpRequest = dynamic;
typedef HTMLImageElement = dart_html.ImageElement;
//typedef Array = dynamic;

/// This module does not really exist.
/// This is just to get `export as namespace fabric;` to work and to be re-exportable from `index.d.ts`.
@JS()
external bool get isLikelyNode;
@JS()
external bool get isTouchSupported;
@JS()
external String get version;
@JS()
external List<num> get iMatrix;
@JS()
external num get textureSize;
@JS()
external set textureSize(num v);
@JS()
external String get copiedText;
@JS()
external set copiedText(String v);
@JS()
external List<dynamic> get copiedTextStyle;
@JS()
external set copiedTextStyle(List<dynamic> v);
@JS()
external dynamic /*JSMap of <String,JSMap of <String,JSMap of <String,num>>>*/
    get charWidthsCache;
@JS()
external set charWidthsCache(
    dynamic /*JSMap of <String,JSMap of <String,JSMap of <String,num>>>*/ v);

/// //////////////////////////////////////////////////////////
/// fabric Functions
/// //////////////////////////////////////////////////////////
@JS()
external Canvas createCanvasForNode(num width, num height);

/// Parse
/// ----------------------------------------------------------
/// Creates markup containing SVG referenced elements like patterns, gradients etc.
@JS()
external String createSVGRefElementsMarkup(StaticCanvas canvas);

/// Creates markup containing SVG font faces
@JS()
external String createSVGFontFacesMarkup(List<FabricObject> objects);

/// Takes string corresponding to an SVG document, and parses it into a set of fabric objects
@JS()
external void loadSVGFromString(String string,
    void Function(List<FabricObject> results, dynamic options) callback,
    [Function reviver]);

/// Takes url corresponding to an SVG document, and parses it into a set of fabric objects.
/// Note that SVG is fetched via XMLHttpRequest, so it needs to conform to SOP (Same Origin Policy)
@JS()
external void loadSVGFromURL(
    String url, void Function(List<FabricObject> results, dynamic options) callback,
    [Function reviver,
    dynamic /*{ crossOrigin?: string | undefined }*/ options]);

/// Returns CSS rules for a given SVG document
@JS()
external dynamic getCSSRules(SVGElement doc);
/*external void parseElements(
    List<dynamic> elements, Function callback, dynamic options,
    [Function reviver]);
*/
/// Transforms an array of svg elements to corresponding fabric.* instances
/*external void parseElements(List<SVGElement> elements, Function callback,
    [dynamic options, Function reviver]);
*/
@JS()
external void parseElements(
    List<dynamic> /*List<dynamic>|List<SVGElement>*/ elements,
    Function callback,
    [dynamic options,
    Function reviver]);
@JS()
external List<dynamic> parsePointsAttribute(String points);
@JS()
external dynamic parseStyleAttribute(SVGElement element);

/// Returns an object of attributes' name/value, given element and an array of attribute names;
/// Parses parent "g" nodes recursively upwards.
@JS()
external dynamic /*JSMap of <String,String>*/ parseAttributes(
    HTMLElement element, List<String> attributes,
    [String svgUid]);

/// Parses an SVG document, returning all of the gradient declarations found in it
@JS()
external dynamic /*JSMap of <String,dynamic>*/ getGradientDefs(SVGElement doc);

/// Parses a short font declaration, building adding its properties to a style object
@JS()
external void parseFontDeclaration(String value, dynamic oStyle);

/// Parses an SVG document, converts it to an array of corresponding fabric.* instances and passes them to a callback
@JS()
external void parseSVGDocument(SVGElement doc,
    void Function(List<FabricObject> results, dynamic options) callback,
    [Function reviver]);

/// Parses "transform" attribute, returning an array of values
@JS()
external List<num> parseTransformAttribute(String attributeValue);

/// fabric Log
/// ---------------
/// Wrapper around `console.log` (when available)
@JS()
external void log(
    [dynamic values1,
    dynamic values2,
    dynamic values3,
    dynamic values4,
    dynamic values5]);

/// Wrapper around `console.warn` (when available)
@JS()
external void warn(
    [dynamic values1,
    dynamic values2,
    dynamic values3,
    dynamic values4,
    dynamic values5]);

/// ////////////////////////////////////////////////////////////////////////////
/// Data Object Interfaces - These interface are not specific part of fabric,
/// They are just helpful for for defining function parameters
/// ///////////////////////////////////////////////////////////////////////////
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

@anonymous
@JS()
abstract class IEvent<E extends Event> {
  external E get e;
  external set e(E v);
  external dynamic /*Object|dynamic*/ get target;
  external set target(dynamic /*Object|dynamic*/ v);
  external dynamic /*List<Object>|dynamic*/ get subTargets;
  external set subTargets(dynamic /*List<Object>|dynamic*/ v);
  external dynamic /*List<Object>|dynamic*/ get selected;
  external set selected(dynamic /*List<Object>|dynamic*/ v);
  external dynamic /*List<Object>|dynamic*/ get deselected;
  external set deselected(dynamic /*List<Object>|dynamic*/ v);
  external dynamic /*String|dynamic*/ get action;
  external set action(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get button;
  external set button(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get isClick;
  external set isClick(dynamic /*bool|dynamic*/ v);
  external dynamic /*Point|dynamic*/ get pointer;
  external set pointer(dynamic /*Point|dynamic*/ v);
  external dynamic /*Point|dynamic*/ get absolutePointer;
  external set absolutePointer(dynamic /*Point|dynamic*/ v);
  external dynamic /*Transform|dynamic*/ get transform;
  external set transform(dynamic /*Transform|dynamic*/ v);
  external dynamic /*Object|dynamic*/ get currentTarget;
  external set currentTarget(dynamic /*Object|dynamic*/ v);
  external dynamic /*List<Object>|dynamic*/ get currentSubTargets;
  external set currentSubTargets(dynamic /*List<Object>|dynamic*/ v);
  external factory IEvent(
      {E e,
      dynamic /*Object|dynamic*/ target,
      dynamic /*List<Object>|dynamic*/ subTargets,
      dynamic /*List<Object>|dynamic*/ selected,
      dynamic /*List<Object>|dynamic*/ deselected,
      dynamic /*String|dynamic*/ action,
      dynamic /*num|dynamic*/ button,
      dynamic /*bool|dynamic*/ isClick,
      dynamic /*Point|dynamic*/ pointer,
      dynamic /*Point|dynamic*/ absolutePointer,
      dynamic /*Transform|dynamic*/ transform,
      dynamic /*Object|dynamic*/ currentTarget,
      dynamic /*List<Object>|dynamic*/ currentSubTargets});
}

@anonymous
@JS()
abstract class IFillOptions {
  /// options.source Pattern source
  external dynamic /*String|HTMLImageElement*/ get source;
  external set source(dynamic /*String|HTMLImageElement*/ v);

  /// Repeat property of a pattern (one of repeat, repeat-x, repeat-y or no-repeat)
  external dynamic /*String|dynamic*/ get repeat;
  external set repeat(dynamic /*String|dynamic*/ v);

  /// Pattern horizontal offset from object's left/top corner
  external dynamic /*num|dynamic*/ get offsetX;
  external set offsetX(dynamic /*num|dynamic*/ v);

  /// Pattern vertical offset from object's left/top corner
  external dynamic /*num|dynamic*/ get offsetY;
  external set offsetY(dynamic /*num|dynamic*/ v);
  external factory IFillOptions(
      {dynamic /*String|HTMLImageElement*/ source,
      dynamic /*String|dynamic*/ repeat,
      dynamic /*num|dynamic*/ offsetX,
      dynamic /*num|dynamic*/ offsetY});
}

@anonymous
@JS()
abstract class IToSVGOptions {
  /// If true xml tag is not included
  external dynamic /*bool|dynamic*/ get suppressPreamble;
  external set suppressPreamble(dynamic /*bool|dynamic*/ v);

  /// SVG viewbox object
  external dynamic /*IViewBox|dynamic*/ get viewBox;
  external set viewBox(dynamic /*IViewBox|dynamic*/ v);

  /// Encoding of SVG output
  external dynamic /*String|dynamic*/ get encoding;
  external set encoding(dynamic /*String|dynamic*/ v);

  /// desired width of svg with or without units
  external dynamic /*num|String|dynamic*/ get width;
  external set width(dynamic /*num|String|dynamic*/ v);

  /// desired height of svg with or without units
  external dynamic /*num|String|dynamic*/ get height;
  external set height(dynamic /*num|String|dynamic*/ v);
  external factory IToSVGOptions(
      {dynamic /*bool|dynamic*/ suppressPreamble,
      dynamic /*IViewBox|dynamic*/ viewBox,
      dynamic /*String|dynamic*/ encoding,
      dynamic /*num|String|dynamic*/ width,
      dynamic /*num|String|dynamic*/ height});
}

@anonymous
@JS()
abstract class IViewBox {
  /// x-cooridnate of viewbox
  external num get x;
  external set x(num v);

  /// y-coordinate of viewbox
  external num get y;
  external set y(num v);

  /// Width of viewbox
  external num get width;
  external set width(num v);

  /// Height of viewbox
  external num get height;
  external set height(num v);
  external factory IViewBox({num x, num y, num width, num height});
}

/// ////////////////////////////////////////////////////////////////////////////
/// Mixins Interfaces
/// ///////////////////////////////////////////////////////////////////////////
@anonymous
@JS()
abstract class ICollection<T> {
  external List<FabricObject> get JS$_objects;
  external set JS$_objects(List<FabricObject> v);

  /// Adds objects to collection, then renders canvas (if `renderOnAddRemove` is not `false`)
  /// Objects should be instances of (or inherit from) fabric.Object
  external T add(
      [FabricObject object1,
      FabricObject object2,
      FabricObject object3,
      FabricObject object4,
      FabricObject object5]);

  /// Inserts an object into collection at specified index, then renders canvas (if `renderOnAddRemove` is not `false`)
  /// An object should be an instance of (or inherit from) fabric.Object
  /// @chainable
  external T insertAt(FabricObject object, num index, bool nonSplicing);

  /// Removes objects from a collection, then renders canvas (if `renderOnAddRemove` is not `false`)
  /// @chainable
  external T remove(
      [FabricObject object1,
      FabricObject object2,
      FabricObject object3,
      FabricObject object4,
      FabricObject object5]);

  /// Executes given function for each object in this group
  external T forEachObject(
      void Function(FabricObject element, num index, List<FabricObject> array) callback,
      [dynamic context]);

  /// Returns an array of children objects of this instance
  /// Type parameter introduced in 1.3.10
  external List<FabricObject> getObjects([String type]);

  /// Returns object at specified index
  external T item(num index);

  /// Returns true if collection contains no objects
  external bool isEmpty();

  /// Returns a size of a collection (i.e: length of an array containing its objects)
  external num size();

  /// Returns true if collection contains an object
  external bool contains(FabricObject object);

  /// Returns number representation of a collection complexity
  external num complexity();
}

/*type EventName =
    | "object:modified"
    | "object:moving"
    | "object:scaling"
    | "object:rotating"
    | "object:skewing"
    | "object:resizing"
    | "object:selected"
    | "object:added"
    | "object:removed"
    | "group:selected"
    | "before:transform"
    | "before:selection:cleared"
    | "selection:cleared"
    | "selection:created"
    | "selection:updated"
    | "mouse:up"
    | "mouse:down"
    | "mouse:move"
    | "mouse:up:before"
    | "mouse:down:before"
    | "mouse:move:before"
    | "mouse:dblclick"
    | "mouse:wheel"
    | "mouse:over"
    | "mouse:out"
    | "drop:before"
    | "drop"
    | "dragover"
    | "dragenter"
    | "dragleave"
    | "before:render"
    | "after:render"
    | "before:path:created"
    | "path:created"
    | "canvas:cleared"
    | "moving"
    | "scaling"
    | "rotating"
    | "skewing"
    | "resizing"
    | "mouseup"
    | "mousedown"
    | "mousemove"
    | "mouseup:before"
    | "mousedown:before"
    | "mousemove:before"
    | "mousedblclick"
    | "mousewheel"
    | "mouseover"
    | "mouseout"
    | "drop:before"
    | "drop"
    | "dragover"
    | "dragenter"
    | "dragleave";
*/
@anonymous
@JS()
abstract class IObservable<T> {
  /// Observes specified event
  /*external T on('object:modified'|'object:moving'|'object:scaling'|'object:rotating'|'object:skewing'|'object:resizing'|'object:selected'|'object:added'|'object:removed'|'group:selected'|'before:transform'|'before:selection:cleared'|'selection:cleared'|'selection:created'|'selection:updated'|'mouse:up'|'mouse:down'|'mouse:move'|'mouse:up:before'|'mouse:down:before'|'mouse:move:before'|'mouse:dblclick'|'mouse:wheel'|'mouse:over'|'mouse:out'|'drop:before'|'drop'|'dragover'|'dragenter'|'dragleave'|'before:render'|'after:render'|'before:path:created'|'path:created'|'canvas:cleared'|'moving'|'scaling'|'rotating'|'skewing'|'resizing'|'mouseup'|'mousedown'|'mousemove'|'mouseup:before'|'mousedown:before'|'mousemove:before'|'mousedblclick'|'mousewheel'|'mouseover'|'mouseout'|'drop:before'|'drop'|'dragover'|'dragenter'|'dragleave' eventName, void handler(IEvent<MouseEvent> e));*/
  /*external T on('mouse:wheel' eventName, void handler(IEvent<WheelEvent> e));*/
  /*external T on(String eventName, void handler(IEvent e));*/
  external T on(
      String /*'object:modified'|'object:moving'|'object:scaling'|'object:rotating'|'object:skewing'|'object:resizing'|'object:selected'|'object:added'|'object:removed'|'group:selected'|'before:transform'|'before:selection:cleared'|'selection:cleared'|'selection:created'|'selection:updated'|'mouse:up'|'mouse:down'|'mouse:move'|'mouse:up:before'|'mouse:down:before'|'mouse:move:before'|'mouse:dblclick'|'mouse:wheel'|'mouse:over'|'mouse:out'|'drop:before'|'drop'|'dragover'|'dragenter'|'dragleave'|'before:render'|'after:render'|'before:path:created'|'path:created'|'canvas:cleared'|'moving'|'scaling'|'rotating'|'skewing'|'resizing'|'mouseup'|'mousedown'|'mousemove'|'mouseup:before'|'mousedown:before'|'mousemove:before'|'mousedblclick'|'mousewheel'|'mouseover'|'mouseout'|String*/
          eventName,
      Function /*void Function(IEvent<MouseEvent>)|void Function(IEvent<WheelEvent>)|void Function(IEvent)*/
          handler);

  /// Stops event observing for a particular event handler. Calling this method
  /// without arguments removes all handlers for all events
  external T off(
      [dynamic /*String|dynamic*/ eventName, void Function(IEvent e) handler]);

  /// Fires event with an optional options object
  /// @chainable
  external T fire(String eventName, [dynamic options]);
}

@anonymous
@JS()
abstract class Callbacks {
  /// Invoked on completion
  external dynamic /*Function|dynamic*/ get onComplete;
  external set onComplete(dynamic /*Function|dynamic*/ v);

  /// Invoked on every step of animation
  external dynamic /*Function|dynamic*/ get onChange;
  external set onChange(dynamic /*Function|dynamic*/ v);
  external factory Callbacks(
      {dynamic /*Function|dynamic*/ onComplete,
      dynamic /*Function|dynamic*/ onChange});
}

/// animation mixin
/// ----------------------------------------------------
@anonymous
@JS()
abstract class ICanvasAnimation<T> {
  external num get FX_DURATION;
  external set FX_DURATION(num v);

  /// Centers object horizontally with animation.
  external T fxCenterObjectH(FabricObject object, [Callbacks callbacks]);

  /// Centers object vertically with animation.
  external T fxCenterObjectV(FabricObject object, [Callbacks callbacks]);

  /// Same as `fabric.Canvas#remove` but animated
  /// @chainable
  external T fxRemove(FabricObject object);

  /// Same as [fabric.Canvas.prototype.straightenObject], but animated
  /// @chainable
  external T fxStraightenObject(FabricObject object);
}

@anonymous
@JS()
abstract class IObjectAnimation<T> {
  /// Animates object's properties
  /// object.animate('left', ..., {duration: ...});
  /*external Object animate(String property, num|String value, [IAnimationOptions options]);*/
  /// Animates object's properties
  /// object.animate({ left: ..., top: ... }, { duration: ... });
  /*external Object animate(JSMap of <String,num|String> properties, [IAnimationOptions options]);*/
  external FabricObject animate(
      dynamic /*String|JSMap of <String,num|String>*/ property_properties,
      [dynamic /*num|String|IAnimationOptions*/ value_options,
      IAnimationOptions options]);
}

@anonymous
@JS()
abstract class IAnimationOptions {
  /// Allows to specify starting value of animatable property (if we don't want current value to be used).
  external dynamic /*String|num|dynamic*/ get from;
  external set from(dynamic /*String|num|dynamic*/ v);

  /// Defaults to 500 (ms). Can be used to change duration of an animation.
  external dynamic /*num|dynamic*/ get duration;
  external set duration(dynamic /*num|dynamic*/ v);

  /// Callback; invoked on every value change
  external dynamic /*Function|dynamic*/ get onChange;
  external set onChange(dynamic /*Function|dynamic*/ v);

  /// Callback; invoked when value change is completed
  external dynamic /*Function|dynamic*/ get onComplete;
  external set onComplete(dynamic /*Function|dynamic*/ v);

  /// Easing function. Default: fabric.util.ease.easeInSine
  external dynamic /*Function|dynamic*/ get easing;
  external set easing(dynamic /*Function|dynamic*/ v);

  /// Value to modify the property by, default: end - start
  external dynamic /*num|dynamic*/ get by;
  external set by(dynamic /*num|dynamic*/ v);
  external factory IAnimationOptions(
      {dynamic /*String|num|dynamic*/ from,
      dynamic /*num|dynamic*/ duration,
      dynamic /*Function|dynamic*/ onChange,
      dynamic /*Function|dynamic*/ onComplete,
      dynamic /*Function|dynamic*/ easing,
      dynamic /*num|dynamic*/ by});
}

/// ////////////////////////////////////////////////////////////////////////////
/// General Fabric Interfaces
/// ///////////////////////////////////////////////////////////////////////////
@JS()
class Color {
  // @Ignore
  // Color.fakeConstructor$();

  /// Color class
  /// The purpose of Color is to abstract and encapsulate common color operations;
  external factory Color([String color]);

  /// Returns source of this color (where source is an array representation; ex: [200, 200, 100, 1])
  external List<num> getSource();

  /// Sets source of this color (where source is an array representation; ex: [200, 200, 100, 1])
  external void setSource(List<num> source);

  /// Returns color represenation in RGB format ex: rgb(0-255,0-255,0-255)
  external String toRgb();

  /// Returns color represenation in RGBA format ex: rgba(0-255,0-255,0-255,0-1)
  external String toRgba();

  /// Returns color represenation in HSL format ex: hsl(0-360,0%-100%,0%-100%)
  external String toHsl();

  /// Returns color represenation in HSLA format ex: hsla(0-360,0%-100%,0%-100%,0-1)
  external String toHsla();

  /// Returns color represenation in HEX format ex: FF5555
  external String toHex();

  /// Returns color representation in HEXA format
  external String toHexa();

  /// Gets value of alpha channel for this color
  external num getAlpha();

  /// Sets value of alpha channel for this color
  external void setAlpha(num alpha);

  /// Transforms color to its grayscale representation
  external Color toGrayscale();

  /// Transforms color to its black and white representation
  external Color toBlackWhite(num threshold);

  /// Overlays color with another color
  external Color overlayWith(dynamic /*String|Color*/ otherColor);

  /// Returns new color object, when given a color in RGB format
  external static Color fromRgb(String color);

  /// Returns new color object, when given a color in RGBA format
  external static Color fromRgba(String color);

  /// Returns array represenatation (ex: [100, 100, 200, 1]) of a color that's in RGB or RGBA format
  external static List<num> sourceFromRgb(String color);

  /// Returns new color object, when given a color in HSL format
  external static Color fromHsl(String color);

  /// Returns new color object, when given a color in HSLA format
  external static Color fromHsla(String color);

  /// Returns array represenatation (ex: [100, 100, 200, 1]) of a color that's in HSL or HSLA format.
  external static List<num> sourceFromHsl(String color);

  /// Returns new color object, when given a color in HEX format
  external static Color fromHex(String color);

  /// Returns array represenatation (ex: [100, 100, 200, 1]) of a color that's in HEX format
  external static List<num> sourceFromHex(String color);

  /// Returns new color object, when given color in array representation (ex: [200, 100, 100, 0.5])
  external static Color fromSource(List<num> source);

  /// Regex matching color in HEX format (ex: #FF5544CC, #FF5555, 010155, aff)
  /// @static
  /// @field
  external static RegExp get reHex;
  external static set reHex(RegExp v);

  /// Regex matching color in HSL or HSLA formats (ex: hsl(200, 80%, 10%), hsla(300, 50%, 80%, 0.5), hsla( 300 , 50% , 80% , 0.5 ))
  /// @static
  /// @field
  external static RegExp get reHSLa;
  external static set reHSLa(RegExp v);

  /// Regex matching color in RGB or RGBA formats (ex: rgb(0, 0, 0), rgba(255, 100, 10, 0.5), rgba( 255 , 100 , 10 , 0.5 ), rgb(1,1,1), rgba(100%, 60%, 10%, 0.5))
  /// @static
  /// @field
  external static RegExp get reRGBa;
  external static set reRGBa(RegExp v);
}

@anonymous
@JS()
abstract class IGradientOptionsCoords {
  external dynamic /*num|dynamic*/ get x1;
  external set x1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y1;
  external set y1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get x2;
  external set x2(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y2;
  external set y2(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get r1;
  external set r1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get r2;
  external set r2(dynamic /*num|dynamic*/ v);
  external factory IGradientOptionsCoords(
      {dynamic /*num|dynamic*/ x1,
      dynamic /*num|dynamic*/ y1,
      dynamic /*num|dynamic*/ x2,
      dynamic /*num|dynamic*/ y2,
      dynamic /*num|dynamic*/ r1,
      dynamic /*num|dynamic*/ r2});
}

/*type IGradientOptionsColorStops = Array<{
    offset: number;
    color: string;
}>;
*/
@anonymous
@JS()
abstract class IGradientOptions {
  /// Horizontal offset for aligning gradients coming from SVG when outside pathgroups
  external dynamic /*num|dynamic*/ get offsetX;
  external set offsetX(dynamic /*num|dynamic*/ v);

  /// Vertical offset for aligning gradients coming from SVG when outside pathgroups
  external dynamic /*num|dynamic*/ get offsetY;
  external set offsetY(dynamic /*num|dynamic*/ v);
  external dynamic /*String|dynamic*/ get type;
  external set type(dynamic /*String|dynamic*/ v);
  external dynamic /*IGradientOptionsCoords|dynamic*/ get coords;
  external set coords(dynamic /*IGradientOptionsCoords|dynamic*/ v);

  /// Color stops object eg. {0:string; 1:string;
  external dynamic /*Array<{
    offset: number;
    color: string;
}>|dynamic*/
      get colorStops;
  external set colorStops(
      dynamic
          /*Array<{
    offset: number;
    color: string;
}>|dynamic*/
          v);
  external dynamic get gradientTransform;
  external set gradientTransform(dynamic v);
  external factory IGradientOptions(
      {dynamic /*num|dynamic*/ offsetX,
      dynamic /*num|dynamic*/ offsetY,
      dynamic /*String|dynamic*/ type,
      dynamic /*IGradientOptionsCoords|dynamic*/ coords,
      dynamic
          /*Array<{
    offset: number;
    color: string;
}>|dynamic*/
          colorStops,
      dynamic gradientTransform});
}

@anonymous
@JS()
abstract class OGradientOptions {
  external dynamic /*String|dynamic*/ get type;
  external set type(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get x1;
  external set x1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y1;
  external set y1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get x2;
  external set x2(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y2;
  external set y2(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get r1;
  external set r1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get r2;
  external set r2(dynamic /*num|dynamic*/ v);
  external dynamic /*JSMap of <String,String>|dynamic*/ get colorStops;
  external set colorStops(dynamic /*JSMap of <String,String>|dynamic*/ v);
  external dynamic get gradientTransform;
  external set gradientTransform(dynamic v);
  external factory OGradientOptions(
      {dynamic /*String|dynamic*/ type,
      dynamic /*num|dynamic*/ x1,
      dynamic /*num|dynamic*/ y1,
      dynamic /*num|dynamic*/ x2,
      dynamic /*num|dynamic*/ y2,
      dynamic /*num|dynamic*/ r1,
      dynamic /*num|dynamic*/ r2,
      dynamic /*JSMap of <String,String>|dynamic*/ colorStops,
      dynamic gradientTransform});
}

@anonymous
@JS()
abstract class Gradient implements IGradientOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Gradient({
        type?: string | undefined;
        gradientUnits?: any;
        offsetX?: any;
        offsetY?: any;
        colorStops?: IGradientOptionsColorStops | undefined;
        coords?: IGradientOptionsCoords | undefined;
    } options);*/
  /// Adds another colorStop
  external Gradient addColorStop(dynamic colorStop);

  /// Returns object representation of a gradient
  external dynamic toObject([dynamic propertiesToInclude]);

  /// Returns SVG representation of an gradient
  external String toSVG(dynamic object);

  /// Returns an instance of CanvasGradient
  external CanvasGradient toLive(CanvasRenderingContext2D ctx);

  /// Returns [fabric.Gradient] instance from an SVG element
  /// @static
  /// @see http://www.w3.org/TR/SVG/pservers.html#LinearGradientElement
  /// @see http://www.w3.org/TR/SVG/pservers.html#RadialGradientElement
  external static Gradient fromElement(SVGGradientElement el, FabricObject instance);
}

@JS()
class Intersection {
  // @Ignore
//  Intersection.fakeConstructor$();
  external dynamic /*String|dynamic*/ get status;
  external set status(dynamic /*String|dynamic*/ v);
  external dynamic /*List<Point>|dynamic*/ get points;
  external set points(dynamic /*List<Point>|dynamic*/ v);
  external factory Intersection([String status]);

  /// Appends a point to intersection
  external Intersection appendPoint(Point point);

  /// Appends points to intersection
  external Intersection appendPoints(List<Point> points);

  /// Checks if one line intersects another
  external static Intersection intersectLineLine(
      Point a1, Point a2, Point b1, Point b2);

  /// Checks if line intersects polygon
  external static Intersection intersectLinePolygon(
      Point a1, Point a2, List<Point> points);

  /// Checks if polygon intersects another polygon
  external static Intersection intersectPolygonPolygon(
      List<Point> points1, List<Point> points2);

  /// Checks if polygon intersects rectangle
  external static Intersection intersectPolygonRectangle(
      List<Point> points, Point r1, Point r2);
}

@anonymous
@JS()
abstract class IPatternOptions {
  /// Repeat property of a pattern (one of repeat, repeat-x, repeat-y or no-repeat)
  external dynamic /*String|dynamic*/ get repeat;
  external set repeat(dynamic /*String|dynamic*/ v);

  /// Pattern horizontal offset from object's left/top corner
  external dynamic /*num|dynamic*/ get offsetX;
  external set offsetX(dynamic /*num|dynamic*/ v);

  /// Pattern vertical offset from object's left/top corner
  external dynamic /*num|dynamic*/ get offsetY;
  external set offsetY(dynamic /*num|dynamic*/ v);

  /// crossOrigin value (one of "", "anonymous", "use-credentials")
  /// @see https://developer.mozilla.org/en-US/docs/HTML/CORS_settings_attributes
  external dynamic /*''|'anonymous'|'use-credentials'|dynamic*/ get crossOrigin;
  external set crossOrigin(
      dynamic /*''|'anonymous'|'use-credentials'|dynamic*/ v);

  /// Transform matrix to change the pattern, imported from svgs
  external dynamic /*List<num>|dynamic*/ get patternTransform;
  external set patternTransform(dynamic /*List<num>|dynamic*/ v);

  /// The source for the pattern
  external dynamic /*String|HTMLImageElement*/ get source;
  external set source(dynamic /*String|HTMLImageElement*/ v);
  external factory IPatternOptions(
      {dynamic /*String|dynamic*/ repeat,
      dynamic /*num|dynamic*/ offsetX,
      dynamic /*num|dynamic*/ offsetY,
      dynamic /*''|'anonymous'|'use-credentials'|dynamic*/ crossOrigin,
      dynamic /*List<num>|dynamic*/ patternTransform,
      dynamic /*String|HTMLImageElement*/ source});
}

@anonymous
@JS()
abstract class Pattern implements IPatternOptions {
  /// Unique identifier
  external num get id;
  external set id(num v);
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Pattern([IPatternOptions options]);*/
  /// Returns object representation of a pattern
  external dynamic toObject(dynamic propertiesToInclude);

  /// Returns SVG representation of a pattern
  external String toSVG(FabricObject object);
  external void setOptions(IPatternOptions options);

  /// Returns an instance of CanvasPattern
  external CanvasPattern toLive(CanvasRenderingContext2D ctx);
}

@anonymous
@JS()
abstract class IPoint {
  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
  external factory IPoint({num x, num y});
}

@JS()
class Point implements IPoint {
  // @Ignore
  // Point.fakeConstructor$();

  external num get x;

  external set x(num v);

  external num get y;

  external set y(num v);
  external String get type;
  external set type(String v);
  external factory Point(num x, num y);

  /// Adds another point to this one and returns another one
  external Point add(IPoint that);

  /// Adds another point to this one
  /// @chainable
  external Point addEquals(IPoint that);

  /// Adds value to this point and returns a new one
  external Point scalarAdd(num scalar);

  /// Adds value to this point
  /// @chainable
  external Point scalarAddEquals(num scalar);

  /// Subtracts another point from this point and returns a new one
  external Point subtract(IPoint that);

  /// Subtracts another point from this point
  /// @chainable
  external Point subtractEquals(IPoint that);

  /// Subtracts value from this point and returns a new one
  external Point scalarSubtract(num scalar);

  /// Subtracts value from this point
  /// @chainable
  external Point scalarSubtractEquals(num scalar);

  /// Multiplies this point by a value and returns a new one
  external Point multiply(num scalar);

  /// Multiplies this point by a value
  /// @chainable
  external Point multiplyEquals(num scalar);

  /// Divides this point by a value and returns a new one
  external Point divide(num scalar);

  /// Divides this point by a value
  /// @chainable
  external Point divideEquals(num scalar);

  /// Returns true if this point is equal to another one
  external Point eq(IPoint that);

  /// Returns true if this point is less than another one
  external Point lt(IPoint that);

  /// Returns true if this point is less than or equal to another one
  external Point lte(IPoint that);

  /// Returns true if this point is greater another one
  external Point gt(IPoint that);

  /// Returns true if this point is greater than or equal to another one
  external Point gte(IPoint that);

  /// Returns new point which is the result of linear interpolation with this one and another one
  external Point lerp(IPoint that, num t);

  /// Returns distance from this point and another one
  external num distanceFrom(IPoint that);

  /// Returns the point between this point and another one
  external Point midPointFrom(IPoint that);

  /// Returns a new point which is the min of this and another one
  external Point min(IPoint that);

  /// Returns a new point which is the max of this and another one
  external Point max(IPoint that);

  /// Returns string representation of this point

  external String toString();

  /// Sets x/y of this point
  /// @chainable
  external Point setXY(num x, num y);

  /// Sets x of this point
  /// @chainable
  external Point setX(num x);

  /// Sets y of this point
  /// @chainable
  external Point setY(num y);

  /// Sets x/y of this point from another point
  /// @chainable
  external Point setFromPoint(IPoint that);

  /// Swaps x/y of this point and another point
  external Point swap(IPoint that);

  /// return a cloned instance of the point
  external Point clone();
}

@anonymous
@JS()
abstract class IShadowOptions {
  /// Shadow color
  external dynamic /*String|dynamic*/ get color;
  external set color(dynamic /*String|dynamic*/ v);

  /// Shadow blur
  external dynamic /*num|dynamic*/ get blur;
  external set blur(dynamic /*num|dynamic*/ v);

  /// Shadow horizontal offset
  external dynamic /*num|dynamic*/ get offsetX;
  external set offsetX(dynamic /*num|dynamic*/ v);

  /// Shadow vertical offset
  external dynamic /*num|dynamic*/ get offsetY;
  external set offsetY(dynamic /*num|dynamic*/ v);

  /// Whether the shadow should affect stroke operations
  external dynamic /*bool|dynamic*/ get affectStroke;
  external set affectStroke(dynamic /*bool|dynamic*/ v);

  /// Indicates whether toObject should include default values
  external dynamic /*bool|dynamic*/ get includeDefaultValues;
  external set includeDefaultValues(dynamic /*bool|dynamic*/ v);

  /// When `false`, the shadow will scale with the object.
  /// When `true`, the shadow's offsetX, offsetY, and blur will not be affected by the object's scale.
  /// default to false
  /// @default
  external dynamic /*bool|dynamic*/ get nonScaling;
  external set nonScaling(dynamic /*bool|dynamic*/ v);
  external factory IShadowOptions(
      {dynamic /*String|dynamic*/ color,
      dynamic /*num|dynamic*/ blur,
      dynamic /*num|dynamic*/ offsetX,
      dynamic /*num|dynamic*/ offsetY,
      dynamic /*bool|dynamic*/ affectStroke,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ nonScaling});
}

@anonymous
@JS()
abstract class Shadow implements IShadowOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Shadow([IShadowOptions|String options]);*/
  external Shadow initialize([dynamic /*IShadowOptions|String*/ options]);

  /// Returns a string representation of an instance
  /// @see http://www.w3.org/TR/css-text-decor-3/#text-shadow

  external String toString();

  /// Returns SVG representation of a shadow
  external String toSVG(FabricObject object);

  /// Returns object representation of a shadow
  external dynamic toObject();

  /// Regex matching shadow offsetX, offsetY and blur (ex: "2px 2px 10px rgba(0,0,0,0.2)", "rgb(0,255,0) 2px 2px")
  /// @static
  /// @field
  external static RegExp get reOffsetsAndBlur;
  external static set reOffsetsAndBlur(RegExp v);
}

/// ////////////////////////////////////////////////////////////////////////////
/// Canvas Interfaces
/// ///////////////////////////////////////////////////////////////////////////
@anonymous
@JS()
abstract class ICanvasDimensions {
  /// Width of canvas element
  external dynamic /*num|String*/ get width;
  external set width(dynamic /*num|String*/ v);

  /// Height of canvas element
  external dynamic /*num|String*/ get height;
  external set height(dynamic /*num|String*/ v);
  external factory ICanvasDimensions(
      {dynamic /*num|String*/ width, dynamic /*num|String*/ height});
}

@anonymous
@JS()
abstract class ICanvasDimensionsOptions {
  /// Set the given dimensions only as canvas backstore dimensions
  external dynamic /*bool|dynamic*/ get backstoreOnly;
  external set backstoreOnly(dynamic /*bool|dynamic*/ v);

  /// Set the given dimensions only as css dimensions
  external dynamic /*bool|dynamic*/ get cssOnly;
  external set cssOnly(dynamic /*bool|dynamic*/ v);
  external factory ICanvasDimensionsOptions(
      {dynamic /*bool|dynamic*/ backstoreOnly,
      dynamic /*bool|dynamic*/ cssOnly});
}

@anonymous
@JS()
abstract class IStaticCanvasOptions {
  /// Background color of canvas instance.
  /// Should be set via [fabric.StaticCanvas#setBackgroundColor].
  external dynamic /*String|Pattern|dynamic*/ get backgroundColor;
  external set backgroundColor(dynamic /*String|Pattern|dynamic*/ v);

  /// Background image of canvas instance.
  /// Should be set via [fabric.StaticCanvas#setBackgroundImage].
  /// <b>Backwards incompatibility note:</b> The "backgroundImageOpacity"
  /// and "backgroundImageStretch" properties are deprecated since 1.3.9.
  /// Use [fabric.Image#opacity], [fabric.Image#width] and [fabric.Image#height].
  /// since 2.4.0 image caching is active, please when putting an image as background, add to the
  /// canvas property a reference to the canvas it is on. Otherwise the image cannot detect the zoom
  /// vale. As an alternative you can disable image objectCaching
  external dynamic /*Image|String|dynamic*/ get backgroundImage;
  external set backgroundImage(dynamic /*Image|String|dynamic*/ v);

  /// Overlay color of canvas instance.
  /// Should be set via [fabric.StaticCanvas#setOverlayColor]
  /// @since 1.3.9
  external dynamic /*String|Pattern|dynamic*/ get overlayColor;
  external set overlayColor(dynamic /*String|Pattern|dynamic*/ v);

  /// Overlay image of canvas instance.
  /// Should be set via [fabric.StaticCanvas#setOverlayImage].
  /// <b>Backwards incompatibility note:</b> The "overlayImageLeft"
  /// and "overlayImageTop" properties are deprecated since 1.3.9.
  /// Use [fabric.Image#left] and [fabric.Image#top].
  /// since 2.4.0 image caching is active, please when putting an image as overlay, add to the
  /// canvas property a reference to the canvas it is on. Otherwise the image cannot detect the zoom
  /// vale. As an alternative you can disable image objectCaching
  external dynamic /*Image|dynamic*/ get overlayImage;
  external set overlayImage(dynamic /*Image|dynamic*/ v);

  /// Indicates whether toObject/toDatalessObject should include default values
  /// if set to false, takes precedence over the object value.
  external dynamic /*bool|dynamic*/ get includeDefaultValues;
  external set includeDefaultValues(dynamic /*bool|dynamic*/ v);

  /// Indicates whether objects' state should be saved
  external dynamic /*bool|dynamic*/ get stateful;
  external set stateful(dynamic /*bool|dynamic*/ v);

  /// Indicates whether [fabric.Collection.add], [fabric.Collection.insertAt] and [fabric.Collection.remove],
  /// [fabric.StaticCanvas.moveTo], [fabric.StaticCanvas.clear] and many more, should also re-render canvas.
  /// Disabling this option will not give a performance boost when adding/removing a lot of objects to/from canvas at once
  /// since the renders are quequed and executed one per frame.
  /// Disabling is suggested anyway and managing the renders of the app manually is not a big effort ( canvas.requestRenderAll() )
  /// Left default to true to do not break documentation and old app, fiddles.
  external dynamic /*bool|dynamic*/ get renderOnAddRemove;
  external set renderOnAddRemove(dynamic /*bool|dynamic*/ v);

  /// Indicates whether object controls (borders/controls) are rendered above overlay image
  external dynamic /*bool|dynamic*/ get controlsAboveOverlay;
  external set controlsAboveOverlay(dynamic /*bool|dynamic*/ v);

  /// Indicates whether the browser can be scrolled when using a touchscreen and dragging on the canvas
  external dynamic /*bool|dynamic*/ get allowTouchScrolling;
  external set allowTouchScrolling(dynamic /*bool|dynamic*/ v);

  /// Indicates whether this canvas will use image smoothing, this is on by default in browsers
  external dynamic /*bool|dynamic*/ get imageSmoothingEnabled;
  external set imageSmoothingEnabled(dynamic /*bool|dynamic*/ v);

  /// The transformation (in the format of Canvas transform) which focuses the viewport
  external dynamic /*List<num>|dynamic*/ get viewportTransform;
  external set viewportTransform(dynamic /*List<num>|dynamic*/ v);

  /// if set to false background image is not affected by viewport transform
  /// @since 1.6.3
  external dynamic /*bool|dynamic*/ get backgroundVpt;
  external set backgroundVpt(dynamic /*bool|dynamic*/ v);

  /// if set to false overlay image is not affected by viewport transform
  /// @since 1.6.3
  external dynamic /*bool|dynamic*/ get overlayVpt;
  external set overlayVpt(dynamic /*bool|dynamic*/ v);

  /// When true, canvas is scaled by devicePixelRatio for better rendering on retina screens
  external dynamic /*bool|dynamic*/ get enableRetinaScaling;
  external set enableRetinaScaling(dynamic /*bool|dynamic*/ v);

  /// Describe canvas element extension over design
  /// properties are tl,tr,bl,br.
  /// if canvas is not zoomed/panned those points are the four corner of canvas
  /// if canvas is viewportTransformed you those points indicate the extension
  /// of canvas element in plain untrasformed coordinates
  /// The coordinates get updated with @method calcViewportBoundaries.
  external dynamic
      /*{
        tl: { x: number; y: number };
        tr: { x: number; y: number };
        bl: { x: number; y: number };
        br: { x: number; y: number };
    }|dynamic*/
      get vptCoords;
  external set vptCoords(
      dynamic
          /*{
        tl: { x: number; y: number };
        tr: { x: number; y: number };
        bl: { x: number; y: number };
        br: { x: number; y: number };
    }|dynamic*/
          v);

  /// Based on vptCoords and object.aCoords, skip rendering of objects that
  /// are not included in current viewport.
  /// May greatly help in applications with crowded canvas and use of zoom/pan
  /// If One of the corner of the bounding box of the object is on the canvas
  /// the objects get rendered.
  external dynamic /*bool|dynamic*/ get skipOffscreen;
  external set skipOffscreen(dynamic /*bool|dynamic*/ v);

  /// a fabricObject that, without stroke define a clipping area with their shape. filled in black
  /// the clipPath object gets used when the canvas has rendered, and the context is placed in the
  /// top left corner of the canvas.
  /// clipPath will clip away controls, if you do not want this to happen use controlsAboveOverlay = true
  external dynamic /*Object|dynamic*/ get clipPath;
  external set clipPath(dynamic /*Object|dynamic*/ v);

  /// When true, getSvgTransform() will apply the StaticCanvas.viewportTransform to the SVG transformation. When true,
  /// a zoomed canvas will then produce zoomed SVG output.
  external dynamic /*bool|dynamic*/ get svgViewportTransformation;
  external set svgViewportTransformation(dynamic /*bool|dynamic*/ v);
  external factory IStaticCanvasOptions(
      {dynamic /*String|Pattern|dynamic*/ backgroundColor,
      dynamic /*Image|String|dynamic*/ backgroundImage,
      dynamic /*String|Pattern|dynamic*/ overlayColor,
      dynamic /*Image|dynamic*/ overlayImage,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ stateful,
      dynamic /*bool|dynamic*/ renderOnAddRemove,
      dynamic /*bool|dynamic*/ controlsAboveOverlay,
      dynamic /*bool|dynamic*/ allowTouchScrolling,
      dynamic /*bool|dynamic*/ imageSmoothingEnabled,
      dynamic /*List<num>|dynamic*/ viewportTransform,
      dynamic /*bool|dynamic*/ backgroundVpt,
      dynamic /*bool|dynamic*/ overlayVpt,
      dynamic /*bool|dynamic*/ enableRetinaScaling,
      dynamic
          /*{
        tl: { x: number; y: number };
        tr: { x: number; y: number };
        bl: { x: number; y: number };
        br: { x: number; y: number };
    }|dynamic*/
          vptCoords,
      dynamic /*bool|dynamic*/ skipOffscreen,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ svgViewportTransformation});
}

@anonymous
@JS()
abstract class StaticCanvas
    implements
        IObservable<StaticCanvas>,
        IStaticCanvasOptions,
        ICollection<StaticCanvas>,
        ICanvasAnimation<StaticCanvas> {
  /*external { version: string; objects: Object[] } toJSON([List<String> propertiesToInclude]);*/
  /// Returns JSON representation of canvas
  /*external { version: string; objects: Object[] } toJSON([List<String> propertiesToInclude]);*/
  /// Returns JSON representation of canvas
  /*external static { version: string; objects: Object[] } toJSON([List<String> propertiesToInclude]);*/
  external dynamic /*{ version: string; objects: Object[] }*/ toJSON(
      [List<String> propertiesToInclude]);
  /*external { version: string; objects: Object[] } toDatalessJSON([List<String> propertiesToInclude]);*/
  /*external { version: string; objects: Object[] } toDatalessJSON([List<String> propertiesToInclude]);*/
  external dynamic /*{ version: string; objects: Object[] }*/ toDatalessJSON(
      [List<String> propertiesToInclude]);
  /*external { version: string; objects: Object[] } toObject([List<String> propertiesToInclude]);*/
  /*external dynamic toObject([List<String> propertiesToInclude]);*/
  external dynamic /*{ version: string; objects: Object[] }|dynamic*/ toObject(
      [List<String> propertiesToInclude]);
  /*external { version: string; objects: Object[] } toDatalessObject([List<String> propertiesToInclude]);*/
  /*external dynamic toDatalessObject([List<String> propertiesToInclude]);*/
  external dynamic /*{ version: string; objects: Object[] }|dynamic*/
      toDatalessObject(
          [List<String>
              propertiesToInclude]); // Constructors on anonymous interfaces are not yet supported.
  /*external factory StaticCanvas(HTMLCanvasElement|String|Null element, [ICanvasOptions options]);*/
  external dynamic /*Object|Group|dynamic*/ get JS$_activeObject;
  external set JS$_activeObject(dynamic /*Object|Group|dynamic*/ v);
  external BaseBrush get freeDrawingBrush;
  external set freeDrawingBrush(BaseBrush v);
  external Canvas calcOffset();
  external Canvas setOverlayImage(
      dynamic /*Image|String*/ image, Function callback,
      [IImageOptions options]);
  external Canvas setBackgroundImage(
      dynamic /*Image|String*/ image, Function callback,
      [IImageOptions options]);
  external Canvas setOverlayColor(
      dynamic /*String|Pattern*/ overlayColor, Function callback);
  external Canvas setBackgroundColor(
      dynamic /*String|Pattern|Gradient*/ backgroundColor, Function callback);
  external num getWidth();
  external num getHeight();
  external Canvas setWidth(dynamic /*num|String*/ value,
      [ICanvasDimensionsOptions options]);
  external Canvas setHeight(dynamic /*num|String*/ value,
      [ICanvasDimensionsOptions options]);
  external Canvas setDimensions(ICanvasDimensions dimensions,
      [ICanvasDimensionsOptions options]);
  external num getZoom();
  external Canvas setViewportTransform(List<num> vpt);
  external Canvas zoomToPoint(IPoint point, num value);
  external Canvas setZoom(num value);
  external Canvas absolutePan(IPoint point);
  external Canvas relativePan(IPoint point);
  external HTMLCanvasElement getElement();
  external Canvas clearContext(CanvasRenderingContext2D ctx);
  external CanvasRenderingContext2D getContext();
  external Canvas clear();
  external Canvas renderAll();
  external Canvas renderAndReset();
  external Canvas requestRenderAll();
  external dynamic /*{ tl: Point; br: Point; tr: Point; bl: Point }*/
      calcViewportBoundaries();
  external Canvas renderCanvas(
      CanvasRenderingContext2D ctx, List<FabricObject> objects);
  external void drawClipPathOnCanvas(CanvasRenderingContext2D ctx);
  external dynamic /*{ top: number; left: number }*/ getCenter();
  external Canvas centerObjectH(FabricObject object);
  external Canvas centerObjectV(FabricObject object);
  external Canvas centerObject(FabricObject object);
  external Canvas viewportCenterObject(FabricObject object);
  external Canvas viewportCenterObjectH(FabricObject object);
  external Canvas viewportCenterObjectV(FabricObject object);
  external Point getVpCenter();
  external String toSVG([IToSVGOptions options, Function reviver]);
  external Canvas sendToBack(FabricObject object);
  external Canvas bringToFront(FabricObject object);
  external Canvas sendBackwards(FabricObject object, [bool intersecting]);
  external Canvas bringForward(FabricObject object, [bool intersecting]);
  external Canvas moveTo(FabricObject object, num index);
  external Canvas dispose();

  external String toString();
  external static String get EMPTY_JSON;
  external static set EMPTY_JSON(String v);
  external static bool supports(
      String /*'getImageData'|'toDataURL'|'toDataURLWithQuality'|'setLineDash'*/
          methodName);
  external String toDataURL([IDataURLOptions options]);

  /// Clones canvas instance
  external void clone([dynamic callback, List<String> properties]);

  /// Clones canvas instance without cloning existing data.
  /// This essentially copies canvas dimensions, clipping properties, etc.
  /// but leaves data empty (so that you can populate it with your own)
  external void cloneWithoutData([dynamic callback]);

  /// Create a new HTMLCanvas element painted with the current canvas content.
  /// No need to resize the actual one or repaint it.
  /// Will transfer object ownership to a new canvas, paint it, and set everything back.
  /// This is an intermediary step used to get to a dataUrl but also it is useful to
  /// create quick image copies of a canvas without passing for the dataUrl string
  external HTMLCanvasElement toCanvasElement(
      [num multiplier,
      dynamic
          /*Readonly<
    dynamic /*{
            left?: number;
            top?: number;
            width?: number;
            height?: number;
        }*/
    >*/
          cropping]);

  /// Populates canvas with data from the specified JSON.
  /// JSON format must conform to the one of [fabric.Canvas#toJSON]
  /// and corresponding objects (e.g: [fabric.Image])
  /// are initialized
  external Canvas loadFromJSON(dynamic json, Function callback,
      [Function reviver]);

  /// Creates markup containing SVG font faces,
  /// font URLs for font faces must be collected by developers
  /// and are not extracted from the DOM by fabricjs
  external String createSVGFontFacesMarkup(List<dynamic> objects);

  /// Creates markup containing SVG referenced elements like patterns, gradients etc.
  external String createSVGRefElementsMarkup();

  /// Straightens object, then rerenders canvas
  /// @chainable
  external Canvas straightenObject(FabricObject object);
}

@anonymous
@JS()
abstract class ICanvasOptions implements IStaticCanvasOptions {
  /// When true, objects can be transformed by one side (unproportionally)
  /// when dragged on the corners that normally would not do that.
  /// @default
  /// @since fabric 4.0 // changed name and default value
  external dynamic /*bool|dynamic*/ get uniformScaling;
  external set uniformScaling(dynamic /*bool|dynamic*/ v);

  /// Indicates which key enable unproportional scaling
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// If `null` or 'none' or any other string that is not a modifier key
  /// feature is disabled feature disabled.
  /// @since 1.6.2
  external dynamic /*String|dynamic*/ get uniScaleKey;
  external set uniScaleKey(dynamic /*String|dynamic*/ v);

  /// When true, objects use center point as the origin of scale transformation.
  /// <b>Backwards incompatibility note:</b> This property replaces "centerTransform" (Boolean).
  external dynamic /*bool|dynamic*/ get centeredScaling;
  external set centeredScaling(dynamic /*bool|dynamic*/ v);

  /// When true, objects use center point as the origin of rotate transformation.
  /// <b>Backwards incompatibility note:</b> This property replaces "centerTransform" (Boolean).
  external dynamic /*bool|dynamic*/ get centeredRotation;
  external set centeredRotation(dynamic /*bool|dynamic*/ v);

  /// Color of object's fill
  external dynamic /*String|Pattern|Gradient|dynamic*/ get fill;
  external set fill(dynamic /*String|Pattern|Gradient|dynamic*/ v);

  /// Indicates which key enable centered Transform
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// If `null` or 'none' or any other string that is not a modifier key
  /// feature is disabled feature disabled.
  /// @since 1.6.2
  /// @default
  external dynamic /*String|dynamic*/ get centeredKey;
  external set centeredKey(dynamic /*String|dynamic*/ v);

  /// Indicates which key enable alternate action on corner
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// If `null` or 'none' or any other string that is not a modifier key
  /// feature is disabled feature disabled.
  /// @since 1.6.2
  /// @default
  external dynamic /*String|dynamic*/ get altActionKey;
  external set altActionKey(dynamic /*String|dynamic*/ v);

  /// Indicates that canvas is interactive. This property should not be changed.
  external dynamic /*bool|dynamic*/ get interactive;
  external set interactive(dynamic /*bool|dynamic*/ v);

  /// Indicates whether group selection should be enabled
  external dynamic /*bool|dynamic*/ get selection;
  external set selection(dynamic /*bool|dynamic*/ v);

  /// Indicates which key or keys enable multiple click selection
  /// Pass value as a string or array of strings
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// If `null` or empty or containing any other string that is not a modifier key
  /// feature is disabled.
  /// @since 1.6.2
  /// @default
  external dynamic /*String|List<String>|dynamic*/ get selectionKey;
  external set selectionKey(dynamic /*String|List<String>|dynamic*/ v);

  /// Indicates which key enable alternative selection
  /// in case of target overlapping with active object
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// For a series of reason that come from the general expectations on how
  /// things should work, this feature works only for preserveObjectStacking true.
  /// If `null` or 'none' or any other string that is not a modifier key
  /// feature is disabled.
  /// @since 1.6.5
  /// @default
  external dynamic /*String|Null|dynamic*/ get altSelectionKey;
  external set altSelectionKey(dynamic /*String|Null|dynamic*/ v);

  /// Color of selection
  external dynamic /*String|dynamic*/ get selectionColor;
  external set selectionColor(dynamic /*String|dynamic*/ v);

  /// Default dash array pattern
  /// If not empty the selection border is dashed
  external dynamic /*List<num>|dynamic*/ get selectionDashArray;
  external set selectionDashArray(dynamic /*List<num>|dynamic*/ v);

  /// Color of the border of selection (usually slightly darker than color of selection itself)
  external dynamic /*String|dynamic*/ get selectionBorderColor;
  external set selectionBorderColor(dynamic /*String|dynamic*/ v);

  /// Width of a line used in object/group selection
  external dynamic /*num|dynamic*/ get selectionLineWidth;
  external set selectionLineWidth(dynamic /*num|dynamic*/ v);

  /// Select only shapes that are fully contained in the dragged selection rectangle.
  /// @default
  external dynamic /*bool|dynamic*/ get selectionFullyContained;
  external set selectionFullyContained(dynamic /*bool|dynamic*/ v);

  /// Default cursor value used when hovering over an object on canvas
  external dynamic /*String|dynamic*/ get hoverCursor;
  external set hoverCursor(dynamic /*String|dynamic*/ v);

  /// Default cursor value used when moving an object on canvas
  external dynamic /*String|dynamic*/ get moveCursor;
  external set moveCursor(dynamic /*String|dynamic*/ v);

  /// Default cursor value used for the entire canvas
  external dynamic /*String|dynamic*/ get defaultCursor;
  external set defaultCursor(dynamic /*String|dynamic*/ v);

  /// Cursor value used during free drawing
  external dynamic /*String|dynamic*/ get freeDrawingCursor;
  external set freeDrawingCursor(dynamic /*String|dynamic*/ v);

  /// Cursor value used for rotation point
  external dynamic /*String|dynamic*/ get rotationCursor;
  external set rotationCursor(dynamic /*String|dynamic*/ v);

  /// Cursor value used for disabled elements ( corners with disabled action )
  /// @since 2.0.0
  /// @default
  external dynamic /*String|dynamic*/ get notAllowedCursor;
  external set notAllowedCursor(dynamic /*String|dynamic*/ v);

  /// Default element class that's given to wrapper (div) element of canvas
  external dynamic /*String|dynamic*/ get containerClass;
  external set containerClass(dynamic /*String|dynamic*/ v);

  /// When true, object detection happens on per-pixel basis rather than on per-bounding-box
  external dynamic /*bool|dynamic*/ get perPixelTargetFind;
  external set perPixelTargetFind(dynamic /*bool|dynamic*/ v);

  /// Number of pixels around target pixel to tolerate (consider active) during object detection
  external dynamic /*num|dynamic*/ get targetFindTolerance;
  external set targetFindTolerance(dynamic /*num|dynamic*/ v);

  /// When true, target detection is skipped when hovering over canvas. This can be used to improve performance.
  external dynamic /*bool|dynamic*/ get skipTargetFind;
  external set skipTargetFind(dynamic /*bool|dynamic*/ v);

  /// When true, mouse events on canvas (mousedown/mousemove/mouseup) result in free drawing.
  /// After mousedown, mousemove creates a shape,
  /// and then mouseup finalizes it and adds an instance of `fabric.Path` onto canvas.
  external dynamic /*bool|dynamic*/ get isDrawingMode;
  external set isDrawingMode(dynamic /*bool|dynamic*/ v);

  /// Indicates whether objects should remain in current stack position when selected.
  /// When false objects are brought to top and rendered as part of the selection group
  external dynamic /*bool|dynamic*/ get preserveObjectStacking;
  external set preserveObjectStacking(dynamic /*bool|dynamic*/ v);

  /// Indicates the angle that an object will lock to while rotating.
  /// @since 1.6.7
  external dynamic /*num|dynamic*/ get snapAngle;
  external set snapAngle(dynamic /*num|dynamic*/ v);

  /// Indicates the distance from the snapAngle the rotation will lock to the snapAngle.
  /// When `null`, the snapThreshold will default to the snapAngle.
  /// @since 1.6.7
  /// @default
  external dynamic /*Null|num|dynamic*/ get snapThreshold;
  external set snapThreshold(dynamic /*Null|num|dynamic*/ v);

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

  /// Keep track of the subTargets for Mouse Events
  /// @since 3.6.0
  /// @default
  external dynamic /*List<Object>|dynamic*/ get targets;
  external set targets(dynamic /*List<Object>|dynamic*/ v);

  /// Canvas width
  /// @default
  external dynamic /*num|dynamic*/ get width;
  external set width(dynamic /*num|dynamic*/ v);

  /// Canvas height
  /// @default
  external dynamic /*num|dynamic*/ get height;
  external set height(dynamic /*num|dynamic*/ v);
  external factory ICanvasOptions(
      {dynamic /*bool|dynamic*/ uniformScaling,
      dynamic /*String|dynamic*/ uniScaleKey,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ centeredKey,
      dynamic /*String|dynamic*/ altActionKey,
      dynamic /*bool|dynamic*/ interactive,
      dynamic /*bool|dynamic*/ selection,
      dynamic /*String|List<String>|dynamic*/ selectionKey,
      dynamic /*String|Null|dynamic*/ altSelectionKey,
      dynamic /*String|dynamic*/ selectionColor,
      dynamic /*List<num>|dynamic*/ selectionDashArray,
      dynamic /*String|dynamic*/ selectionBorderColor,
      dynamic /*num|dynamic*/ selectionLineWidth,
      dynamic /*bool|dynamic*/ selectionFullyContained,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*String|dynamic*/ defaultCursor,
      dynamic /*String|dynamic*/ freeDrawingCursor,
      dynamic /*String|dynamic*/ rotationCursor,
      dynamic /*String|dynamic*/ notAllowedCursor,
      dynamic /*String|dynamic*/ containerClass,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*num|dynamic*/ targetFindTolerance,
      dynamic /*bool|dynamic*/ skipTargetFind,
      dynamic /*bool|dynamic*/ isDrawingMode,
      dynamic /*bool|dynamic*/ preserveObjectStacking,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*bool|dynamic*/ stopContextMenu,
      dynamic /*bool|dynamic*/ fireRightClick,
      dynamic /*bool|dynamic*/ fireMiddleClick,
      dynamic /*List<Object>|dynamic*/ targets,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*String|Pattern|dynamic*/ backgroundColor,
      dynamic /*Image|String|dynamic*/ backgroundImage,
      dynamic /*String|Pattern|dynamic*/ overlayColor,
      dynamic /*Image|dynamic*/ overlayImage,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ stateful,
      dynamic /*bool|dynamic*/ renderOnAddRemove,
      dynamic /*bool|dynamic*/ controlsAboveOverlay,
      dynamic /*bool|dynamic*/ allowTouchScrolling,
      dynamic /*bool|dynamic*/ imageSmoothingEnabled,
      dynamic /*List<num>|dynamic*/ viewportTransform,
      dynamic /*bool|dynamic*/ backgroundVpt,
      dynamic /*bool|dynamic*/ overlayVpt,
      dynamic /*bool|dynamic*/ enableRetinaScaling,
      dynamic
          /*{
        tl: { x: number; y: number };
        tr: { x: number; y: number };
        bl: { x: number; y: number };
        br: { x: number; y: number };
    }|dynamic*/
          vptCoords,
      dynamic /*bool|dynamic*/ skipOffscreen,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ svgViewportTransformation});
}

@anonymous
@JS()
abstract class Canvas implements StaticCanvas {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  external factory Canvas(
      {dynamic /*HTMLCanvasElement|String|Null*/ element,
      ICanvasOptions? options});

  /// Constructor
  external Canvas initialize(dynamic /*HTMLCanvasElement|String|Null*/ element,
      [ICanvasOptions? options]);

  /// When true, target detection is skipped when hovering over canvas. This can be used to improve performance.
  /// @default
  external bool get skipTargetFind;
  external set skipTargetFind(bool v);

  //
  // external Object get JS$_activeObject;

  //
  // external set JS$_activeObject(Object v);

  external List<FabricObject> get JS$_objects;

  external set JS$_objects(List<FabricObject> v);
  external List<FabricObject> get targets;
  external set targets(List<FabricObject> v);

  /// Indicates which key enable alternative selection
  /// in case of target overlapping with active object
  /// values: 'altKey', 'shiftKey', 'ctrlKey'.
  /// For a series of reason that come from the general expectations on how
  /// things should work, this feature works only for preserveObjectStacking true.
  /// If `null` or 'none' or any other string that is not a modifier key
  /// feature is disabled.
  /// @since 1.6.5
  /// @default
  external dynamic /*String|dynamic*/ get altSelectionKey;
  external set altSelectionKey(dynamic /*String|dynamic*/ v);

  /// Renders both the top canvas and the secondary container canvas.
  /// @chainable

  external Canvas renderAll();

  /// Method to render only the top canvas.
  /// Also used to render the group selection box.
  /// @chainable
  external Canvas renderTop();

  /// Checks if point is contained within an area of given object
  external bool containsPoint(Event e, FabricObject target,
      [dynamic /*{ x: number; y: number }*/ point]);

  /// Returns true if object is transparent at a certain location
  external bool isTargetTransparent(FabricObject target, num x, num y);

  /// Set the cursor type of the canvas element
  /// @see http://www.w3.org/TR/css3-ui/#cursor
  external void setCursor(String value);

  /// Method that determines what object we are clicking on
  /// the skipGroup parameter is for internal use, is needed for shift+click action
  /// 11/09/2018 TODO: would be cool if findTarget could discern between being a full target
  /// or the outside part of the corner.
  external dynamic /*Object|dynamic*/ findTarget(Event e, bool skipGroup);

  /// Returns pointer coordinates without the effect of the viewport
  external dynamic restorePointerVpt(IPoint pointer);

  /// Returns pointer coordinates relative to canvas.
  /// Can return coordinates with or without viewportTransform.
  /// ignoreZoom false gives back coordinates that represent
  /// the point clicked on canvas element.
  /// ignoreZoom true gives back coordinates after being processed
  /// by the viewportTransform ( sort of coordinates of what is displayed
  /// on the canvas where you are clicking.
  /// ignoreZoom true = HTMLElement coordinates relative to top,left
  /// ignoreZoom false, default = fabric space coordinates, the same used for shape position
  /// To interact with your shapes top and left you want to use ignoreZoom true
  /// most of the time, while ignoreZoom false will give you coordinates
  /// compatible with the object.oCoords system.
  /// of the time.
  /*external { x: number; y: number } getPointer(Event e, [bool ignoreZoom]);*/
  /// Returns pointer coordinates relative to canvas.
  /// Can return coordinates with or without viewportTransform.
  /// ignoreZoom false gives back coordinates that represent
  /// the point clicked on canvas element.
  /// ignoreZoom true gives back coordinates after being processed
  /// by the viewportTransform ( sort of coordinates of what is displayed
  /// on the canvas where you are clicking.
  /// ignoreZoom true = HTMLElement coordinates relative to top,left
  /// ignoreZoom false, default = fabric space coordinates, the same used for shape position
  /// To interact with your shapes top and left you want to use ignoreZoom true
  /// most of the time, while ignoreZoom false will give you coordinates
  /// compatible with the object.oCoords system.
  /// of the time.
  /*external { x: number; y: number } getPointer(Event e, bool ignoreZoom);*/
  external dynamic /*{ x: number; y: number }*/ getPointer(Event e,
      [bool ignoreZoom]);
  external CanvasRenderingContext2D getSelectionContext();
  external HTMLCanvasElement getSelectionElement();
  external FabricObject /*Object|Null*/ getActiveObject();
  external List<FabricObject> getActiveObjects();
  external Canvas setActiveObject(FabricObject object, [Event e]);
  external Canvas discardActiveObject([Event e]);

  external Canvas dispose();

  external Canvas clear();
  external void drawControls(CanvasRenderingContext2D ctx);
  external bool JS$_setObjectScale(
      Point localMouse,
      dynamic transform,
      bool lockScalingX,
      bool lockScalingY,
      dynamic /*'x'|'y'|'equally'|dynamic*/ by,
      bool lockScalingFlip,
      Point JS$_dim);
  external bool JS$_scaleObject(num x, num y,
      [String /*'x'|'y'|'equally'*/ by]);
  external void JS$_onObjectRemoved(FabricObject obj);
  external void JS$_onObjectAdded(FabricObject obj);
  external void JS$_resetCurrentTransform();
  external void JS$_fireSelectionEvents(List<FabricObject> oldObjects, [Event e]);
  external bool JS$_setActiveObject(FabricObject object, [Event e]);

  /// Function used to search inside objects an object that contains pointer in bounding box or that contains pointerOnCanvas when painted
  external FabricObject JS$_searchPossibleTargets(
      List<FabricObject> objects, dynamic /*{ x: number; y: number }*/ pointer);
  external static String get EMPTY_JSON;
  external static set EMPTY_JSON(String v);

  /// Provides a way to check support of some of the canvas methods
  /// (either those of HTMLCanvasElement itself, or rendering context)
  external static bool supports(
      String /*'getImageData'|'toDataURL'|'toDataURLWithQuality'|'setLineDash'*/
          methodName);

  /// Returns JSON representation of canvas
  external static dynamic /*{ version: string; objects: Object[] }*/ toJson(
      [List<String> propertiesToInclude]);

  /// Removes all event listeners
  external void removeListeners();
}

/// ////////////////////////////////////////////////////////////////////////////
/// Shape Interfaces
/// ///////////////////////////////////////////////////////////////////////////
@anonymous
@JS()
abstract class ICircleOptions implements IObjectOptions {
  /// Radius of this circle
  external dynamic /*num|dynamic*/ get radius;
  external set radius(dynamic /*num|dynamic*/ v);

  /// Start angle of the circle, moving clockwise
  external dynamic /*num|dynamic*/ get startAngle;
  external set startAngle(dynamic /*num|dynamic*/ v);

  /// End angle of the circle
  external dynamic /*num|dynamic*/ get endAngle;
  external set endAngle(dynamic /*num|dynamic*/ v);
  external factory ICircleOptions(
      {dynamic /*num|dynamic*/ radius,
      dynamic /*num|dynamic*/ startAngle,
      dynamic /*num|dynamic*/ endAngle,
      dynamic /*String|dynamic*/
          /// Type of an object (rect, circle, path, etc.).
          /// Note that this property is meant to be read-only and not meant to be modified.
          /// If you modify, certain parts of Fabric (such as JSON loading) won't work correctly.
          type,
      dynamic /*String|dynamic*/
          /// Horizontal origin of transformation of an object (one of "left", "right", "center")
          originX,
      dynamic /*String|dynamic*/
          /// Vertical origin of transformation of an object (one of "top", "bottom", "center")
          originY,
      dynamic /*num|dynamic*/
          /// Top position of an object. Note that by default it's relative to object center. You can change this by setting originY={top/center/bottom}
          top,
      dynamic /*num|dynamic*/
          /// Left position of an object. Note that by default it's relative to object center. You can change this by setting originX={left/center/right}
          left,
      dynamic /*num|dynamic*/
          /// Object width
          width,
      dynamic /*num|dynamic*/
          /// Object height
          height,
      dynamic /*num|dynamic*/
          /// Object scale factor (horizontal)
          scaleX,
      dynamic /*num|dynamic*/
          /// Object scale factor (vertical)
          scaleY,
      dynamic /*bool|dynamic*/
          /// When true, an object is rendered as flipped horizontally
          flipX,
      dynamic /*bool|dynamic*/
          /// When true, an object is rendered as flipped vertically
          flipY,
      dynamic /*num|dynamic*/
          /// Opacity of an object
          opacity,
      dynamic /*num|dynamic*/
          /// Angle of rotation of an object (in degrees)
          angle,
      dynamic /*num|dynamic*/
          /// Object skew factor (horizontal)
          skewX,
      dynamic /*num|dynamic*/
          /// Object skew factor (vertical)
          skewY,
      dynamic /*num|dynamic*/
          /// Size of object's controlling corners (in pixels)
          cornerSize,
      dynamic /*bool|dynamic*/
          /// When true, object's controlling corners are rendered as transparent inside (i.e. stroke instead of fill)
          transparentCorners,
      dynamic /*String|dynamic*/
          /// Default cursor value used when hovering over this object on canvas
          hoverCursor,
      dynamic /*String|dynamic*/
          /// Default cursor value used when moving an object on canvas
          moveCursor,
      dynamic /*num|dynamic*/
          /// Padding between object and its controlling borders (in pixels)
          padding,
      dynamic /*String|dynamic*/
          /// Color of controlling borders of an object (when it's active)
          borderColor,
      dynamic /*List<num>|dynamic*/
          /// Array specifying dash pattern of an object's border (hasBorder must be true)
          borderDashArray,
      dynamic /*String|dynamic*/
          /// Color of controlling corners of an object (when it's active)
          cornerColor,
      dynamic /*String|dynamic*/
          /// Color of controlling corners of an object (when it's active and transparentCorners false)
          cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/
          /// Specify style of control, 'rect' or 'circle'
          cornerStyle,
      dynamic /*List<num>|dynamic*/
          /// Array specifying dash pattern of an object's control (hasBorder must be true)
          cornerDashArray,
      dynamic /*bool|dynamic*/
          /// When true, this object will use center point as the origin of transformation
          /// when being scaled via the controls.
          /// <b>Backwards incompatibility note:</b> This property replaces "centerTransform" (Boolean).
          centeredScaling,
      dynamic /*bool|dynamic*/
          /// When true, this object will use center point as the origin of transformation
          /// when being rotated via the controls.
          /// <b>Backwards incompatibility note:</b> This property replaces "centerTransform" (Boolean).
          centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/
          /// Color of object's fill
          fill,
      dynamic /*String|dynamic*/
          /// Fill rule used to fill an object
          /// accepted values are nonzero, evenodd
          /// Backwards incompatibility note: This property was used for setting globalCompositeOperation until v1.4.12, use `globalCompositeOperation` instead
          fillRule,
      dynamic /*String|dynamic*/
          /// Composite rule used for canvas globalCompositeOperation
          globalCompositeOperation,
      dynamic /*String|dynamic*/
          /// Background color of an object. Only works with text objects at the moment.
          backgroundColor,
      dynamic /*String|dynamic*/
          /// Selection Background color of an object. colored layer behind the object when it is active.
          /// does not mix good with globalCompositeOperation methods.
          selectionBackgroundColor,
      dynamic /*String|dynamic*/
          /// When defined, an object is rendered via stroke and this property specifies its color
          stroke,
      dynamic /*num|dynamic*/
          /// Width of a stroke used to render this object
          strokeWidth,
      dynamic /*List<num>|dynamic*/
          /// Array specifying dash pattern of an object's stroke (stroke must be defined)
          strokeDashArray,
      dynamic /*num|dynamic*/
          /// Line offset of an object's stroke
          /// @default
          strokeDashOffset,
      dynamic /*String|dynamic*/
          /// Line endings style of an object's stroke (one of "butt", "round", "square")
          strokeLineCap,
      dynamic /*String|dynamic*/
          /// Corner style of an object's stroke (one of "bevil", "round", "miter")
          strokeLineJoin,
      dynamic /*num|dynamic*/
          /// Maximum miter length (used for strokeLineJoin = "miter") of an object's stroke
          strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/
          /// Shadow object representing shadow of this shape
          shadow,
      dynamic /*num|dynamic*/
          /// Opacity of object's controlling borders when object is active and moving
          borderOpacityWhenMoving,
      dynamic /*num|dynamic*/
          /// Scale factor of object's controlling borders
          borderScaleFactor,
      dynamic /*num|dynamic*/
          /// Minimum allowed scale value of an object
          minScaleLimit,
      dynamic /*bool|dynamic*/
          /// When set to `false`, an object can not be selected for modification (using either point-click-based or group-based selection).
          /// But events still fire on it.
          selectable,
      dynamic /*bool|dynamic*/
          /// When set to `false`, an object can not be a target of events. All events propagate through it. Introduced in v1.3.4
          evented,
      dynamic /*bool|dynamic*/
          /// When set to `false`, an object is not rendered on canvas
          visible,
      dynamic /*bool|dynamic*/
          /// When set to `false`, object's controls are not displayed and can not be used to manipulate object
          hasControls,
      dynamic /*bool|dynamic*/
          /// When set to `false`, object's controlling borders are not rendered
          hasBorders,
      dynamic /*bool|dynamic*/
          /// When set to `false`, object's controlling rotating point will not be visible or selectable
          hasRotatingPoint,
      dynamic /*num|dynamic*/
          /// Offset for object's controlling rotating point (when enabled via `hasRotatingPoint`)
          rotatingPointOffset,
      dynamic /*bool|dynamic*/
          /// When set to `true`, objects are "found" on canvas on per-pixel basis rather than according to bounding box
          perPixelTargetFind,
      dynamic /*bool|dynamic*/
          /// When `false`, default object's values are not included in its serialization
          includeDefaultValues,
      dynamic /*bool|dynamic*/
          /// When `true`, object horizontal movement is locked
          lockMovementX,
      dynamic /*bool|dynamic*/
          /// When `true`, object vertical movement is locked
          lockMovementY,
      dynamic /*bool|dynamic*/
          /// When `true`, object rotation is locked
          lockRotation,
      dynamic /*bool|dynamic*/
          /// When `true`, object horizontal scaling is locked
          lockScalingX,
      dynamic /*bool|dynamic*/
          /// When `true`, object vertical scaling is locked
          lockScalingY,
      dynamic /*bool|dynamic*/
          /// When `true`, object non-uniform scaling is locked
          lockUniScaling,
      dynamic /*bool|dynamic*/
          /// When `true`, object horizontal skewing is locked
          lockSkewingX,
      dynamic /*bool|dynamic*/
          /// When `true`, object vertical skewing is locked
          lockSkewingY,
      dynamic /*bool|dynamic*/
          /// When `true`, object cannot be flipped by scaling into negative values
          lockScalingFlip,
      dynamic /*bool|dynamic*/
          /// When `true`, object is not exported in OBJECT/JSON
          /// since 1.6.3
          /// @default
          excludeFromExport,
      dynamic /*bool|dynamic*/
          /// When `true`, object is cached on an additional canvas.
          objectCaching,
      dynamic /*bool|dynamic*/
          /// When `true`, object properties are checked for cache invalidation. In some particular
          /// situation you may want this to be disabled ( spray brush, very big, groups)
          /// or if your application does not allow you to modify properties for groups child you want
          /// to disable it for groups.
          /// default to false
          /// since 1.7.0
          /// @default false
          statefullCache,
      dynamic /*bool|dynamic*/
          /// When `true`, cache does not get updated during scaling. The picture will get blocky if scaled
          /// too much and will be redrawn with correct details at the end of scaling.
          /// this setting is performance and application dependant.
          /// default to true
          /// since 1.7.0
          noScaleCache,
      dynamic /*bool|dynamic*/
          /// When `false`, the stoke width will scale with the object.
          /// When `true`, the stroke will always match the exact pixel size entered for stroke width.
          /// default to false
          /// @since 2.6.0
          /// @default false
          strokeUniform,
      dynamic /*bool|dynamic*/
          /// When set to `true`, object's cache will be rerendered next render call.
          dirty,
      dynamic /*String|dynamic*/
          /// Determines if the fill or the stroke is drawn first (one of "fill" or "stroke")
          paintFirst,
      dynamic /*List<String>|dynamic*/
          /// List of properties to consider when checking if state
          /// of an object is changed (fabric.Object#hasStateChanged)
          /// as well as for history (undo/redo) purposes
          stateProperties,
      dynamic /*List<String>|dynamic*/
          /// List of properties to consider when checking if cache needs refresh
          /// Those properties are checked by statefullCache ON ( or lazy mode if we want ) or from single
          /// calls to Object.set(key, value). If the key is in this list, the object is marked as dirty
          /// and refreshed at the next render
          cacheProperties,
      dynamic /*Object|dynamic*/
          /// A fabricObject that, without stroke define a clipping area with their shape. filled in black
          /// the clipPath object gets used when the object has rendered, and the context is placed in the center
          /// of the object cacheCanvas.
          /// If you want 0,0 of a clipPath to align with an object center, use clipPath.originX/Y to 'center'
          clipPath,
      dynamic /*bool|dynamic*/
          /// Meaningful ONLY when the object is used as clipPath.
          /// if true, the clipPath will make the object clip to the outside of the clipPath
          /// since 2.4.0
          /// @default false
          inverted,
      dynamic /*bool|dynamic*/
          /// Meaningful ONLY when the object is used as clipPath.
          /// if true, the clipPath will have its top and left relative to canvas, and will
          /// not be influenced by the object transform. This will make the clipPath relative
          /// to the canvas, but clipping just a particular object.
          /// WARNING this is beta, this feature may change or be renamed.
          /// since 2.4.0
          /// @default false
          absolutePositioned,
      dynamic /*String|dynamic*/
          /// Not used by fabric, just for convenience
          name,
      dynamic

          /// Not used by fabric, just for convenience
          data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          /// Describe object's corner position in canvas element coordinates.
          /// properties are tl,mt,tr,ml,mr,bl,mb,br,mtr for the main controls.
          /// each property is an object with x, y and corner.
          /// The `corner` property contains in a similar manner the 4 points of the
          /// interactive area of the corner.
          /// The coordinates depends from this properties: width, height, scaleX, scaleY
          /// skewX, skewY, angle, strokeWidth, viewportTransform, top, left, padding.
          /// The coordinates get updated with @method setCoords.
          /// You can calculate them without updating with @method calcCoords;
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          /// Describe object's corner position in canvas object absolute coordinates
          /// properties are tl,tr,bl,br and describe the four main corner.
          /// each property is an object with x, y, instance of Fabric.Point.
          /// The coordinates depends from this properties: width, height, scaleX, scaleY
          /// skewX, skewY, angle, strokeWidth, top, left.
          /// Those coordinates are usefull to understand where an object is. They get updated
          /// with oCoords but they do not need to be updated when zoom or panning change.
          /// The coordinates get updated with @method setCoords.
          /// You can calculate them without updating with @method calcCoords(true);
          aCoords,
      dynamic

          /// storage for object full transform matrix
          matrixCache,
      dynamic

          /// storage for object transform matrix
          ownMatrixCache,
      dynamic /*num|dynamic*/
          /// Indicates the angle that an object will lock to while rotating. Can get from canvas.
          snapAngle,
      dynamic /*Null|num|dynamic*/
          /// Indicates the distance from the snapAngle the rotation will lock to the snapAngle. Can get from canvas.
          snapThreshold,
      dynamic /*Group|dynamic*/
          /// The group the object is part of
          group,
      dynamic /*Canvas|dynamic*/
          /// The canvas the object belongs to
          canvas});
}

@anonymous
@JS()
abstract class Circle implements FabricObject, ICircleOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Circle([ICircleOptions options]);*/
  external num getRadiusX();
  external num getRadiusY();
  external num setRadius(num value);
  external String JS$_toSVG();
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);
  external static Circle fromElement(
      SVGElement element, ICircleOptions options);
  external static Circle fromObject(dynamic object);
}

@anonymous
@JS()
abstract class IEllipseOptions implements IObjectOptions {
  external dynamic /*num|dynamic*/ get rx;
  external set rx(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get ry;
  external set ry(dynamic /*num|dynamic*/ v);
  external factory IEllipseOptions(
      {dynamic /*num|dynamic*/ rx,
      dynamic /*num|dynamic*/ ry,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Ellipse implements FabricObject, IEllipseOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Ellipse([IEllipseOptions options]);*/
  external num getRx();
  external num getRy();
  external String JS$_toSVG();
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);
  external static Ellipse fromElement(SVGElement element,
      [IEllipseOptions options]);
  external static Ellipse fromObject(dynamic object);
}

@anonymous
@JS()
abstract class IGroupOptions implements IObjectOptions {
  external dynamic /*bool|dynamic*/ get subTargetCheck;
  external set subTargetCheck(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get useSetOnGroup;
  external set useSetOnGroup(dynamic /*bool|dynamic*/ v);
  external factory IGroupOptions(
      {dynamic /*bool|dynamic*/ subTargetCheck,
      dynamic /*bool|dynamic*/ useSetOnGroup,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Group implements FabricObject, ICollection<Group>, IGroupOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Group([List<Object> objects, IGroupOptions options, bool isAlreadyGrouped]);*/
  /*external Group addWithUpdate([Object object]);*/
  /*external Group addWithUpdate(Object object);*/
  external Group addWithUpdate([FabricObject object]);
  external Group removeWithUpdate(FabricObject object);

  external void render(CanvasRenderingContext2D ctx);

  external bool shouldCache();

  external bool willDrawShadow();
  external bool isOnACache();

  external void drawObject(CanvasRenderingContext2D ctx);

  external bool isCacheDirty([bool skipCanvas]);
  external FabricObject realizeTransform(FabricObject object);
  external Group destroy();
  external ActiveSelection toActiveSelection();
  external Group ungroupOnCanvas();
  external Group setObjectsCoords();

  external String toSVG([Function reviver]);

  external String toClipPathSVG([Function reviver]);
  /*external Group JS$_restoreObjectsState();*/
  /*external Group JS$_restoreObjectsState();*/
  external Group JS$_restoreObjectsState();
  external void JS$_calcBounds([bool onlyWidthHeight]);
  external void JS$_updateObjectsCoords([Point center]);
  external void JS$_onObjectRemoved(FabricObject object);
  external static void fromObject(
      dynamic object, dynamic Function(Group group) callback);
}

@anonymous
@JS()
abstract class ActiveSelection implements Group, ICollection<Group> {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory ActiveSelection([List<Object> objects, IObjectOptions options]);*/

  external FabricObject initializE(ActiveSelection objects, [IObjectOptions options]);
  external Group toGroup();
  external static void fromObject(dynamic object, Function callback);
}

@anonymous
@JS()
abstract class IImageOptions implements IObjectOptions {
  external dynamic /*String|dynamic*/ get crossOrigin;
  external set crossOrigin(dynamic /*String|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get srcFromAttribute;
  external set srcFromAttribute(dynamic /*bool|dynamic*/ v);
  external dynamic /*num|dynamic*/ get minimumScaleTrigger;
  external set minimumScaleTrigger(dynamic /*num|dynamic*/ v);
  external dynamic /*String|dynamic*/ get cacheKey;
  external set cacheKey(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get cropX;
  external set cropX(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get cropY;
  external set cropY(dynamic /*num|dynamic*/ v);
  external dynamic /*List<IBaseFilter>|dynamic*/ get filters;
  external set filters(dynamic /*List<IBaseFilter>|dynamic*/ v);
  external factory IImageOptions(
      {dynamic /*String|dynamic*/ crossOrigin,
      dynamic /*bool|dynamic*/ srcFromAttribute,
      dynamic /*num|dynamic*/ minimumScaleTrigger,
      dynamic /*String|dynamic*/ cacheKey,
      dynamic /*num|dynamic*/ cropX,
      dynamic /*num|dynamic*/ cropY,
      dynamic /*List<IBaseFilter>|dynamic*/ filters,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Image implements FabricObject, IImageOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Image(String|HTMLImageElement|HTMLCanvasElement|HTMLVideoElement element, [IImageOptions options]);*/
  external dynamic /*HTMLImageElement|HTMLVideoElement*/ getElement();
  external Image setElement(
      dynamic /*HTMLImageElement|HTMLVideoElement*/ element,
      [IImageOptions options]);
  external void removeTexture(dynamic key);
  external void dispose();
  external dynamic /*{ width: number; height: number }*/ getOriginalSize();
  external bool hasCrop();
  external String JS$_toSVG();
  external String getSrc();
  external Image setSrc(String src, [Function callback, IImageOptions options]);
  external void applyResizeFilters();
  external Image applyFilters([List<IBaseFilter> filters]);
  external dynamic parsePreserveAspectRatioAttribute();
  external static Image fromURL(String url,
      [void Function(Image image) callback, IImageOptions imgOptions]);
  external static Image fromElement(SVGElement element, Function callback,
      [IImageOptions options]);
  external static String get CSS_CANVAS;
  external static set CSS_CANVAS(String v);
  external static IAllFilters get filterS;
  external static set filterS(IAllFilters v);
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);
}

@anonymous
@JS()
abstract class ILineOptions implements IObjectOptions {
  external dynamic /*num|dynamic*/ get x1;
  external set x1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get x2;
  external set x2(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y1;
  external set y1(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get y2;
  external set y2(dynamic /*num|dynamic*/ v);
  external factory ILineOptions(
      {dynamic /*num|dynamic*/ x1,
      dynamic /*num|dynamic*/ x2,
      dynamic /*num|dynamic*/ y1,
      dynamic /*num|dynamic*/ y2,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Line implements FabricObject, ILineOptions {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Line([List<num> points, ILineOptions objObjects]);*/
  external String JS$_toSVG();
  external static Line fromElement(SVGElement element,
      [Function callback, ILineOptions options]);
  external static Line fromObject(dynamic object);
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);
  external Function makeEdgeToOriginGetter(
      dynamic /*{ origin: number; axis1: any; axis2: any; dimension: any }*/
          propertyNames,
      dynamic /*{ nearest: any; center: any; farthest: any }*/ originValues);
  external dynamic /*{ x1: number; x2: number; y1: number; y2: number }*/
      calcLinePoints();
}

@anonymous
@JS()
abstract class IObjectOptions {
  external dynamic /*String|dynamic*/ get type;
  external set type(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get originX;
  external set originX(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get originY;
  external set originY(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get top;
  external set top(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get left;
  external set left(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get width;
  external set width(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get height;
  external set height(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get scaleX;
  external set scaleX(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get scaleY;
  external set scaleY(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get flipX;
  external set flipX(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get flipY;
  external set flipY(dynamic /*bool|dynamic*/ v);
  external dynamic /*num|dynamic*/ get opacity;
  external set opacity(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get angle;
  external set angle(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get skewX;
  external set skewX(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get skewY;
  external set skewY(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get cornerSize;
  external set cornerSize(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get transparentCorners;
  external set transparentCorners(dynamic /*bool|dynamic*/ v);
  external dynamic /*String|dynamic*/ get hoverCursor;
  external set hoverCursor(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get moveCursor;
  external set moveCursor(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get padding;
  external set padding(dynamic /*num|dynamic*/ v);
  external dynamic /*String|dynamic*/ get borderColor;
  external set borderColor(dynamic /*String|dynamic*/ v);
  external dynamic /*List<num>|dynamic*/ get borderDashArray;
  external set borderDashArray(dynamic /*List<num>|dynamic*/ v);
  external dynamic /*String|dynamic*/ get cornerColor;
  external set cornerColor(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get cornerStrokeColor;
  external set cornerStrokeColor(dynamic /*String|dynamic*/ v);
  external dynamic /*'rect'|'circle'|dynamic*/ get cornerStyle;
  external set cornerStyle(dynamic /*'rect'|'circle'|dynamic*/ v);
  external dynamic /*List<num>|dynamic*/ get cornerDashArray;
  external set cornerDashArray(dynamic /*List<num>|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get centeredScaling;
  external set centeredScaling(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get centeredRotation;
  external set centeredRotation(dynamic /*bool|dynamic*/ v);
  external dynamic /*String|Pattern|Gradient|dynamic*/ get fill;
  external set fill(dynamic /*String|Pattern|Gradient|dynamic*/ v);
  external dynamic /*String|dynamic*/ get fillRule;
  external set fillRule(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get globalCompositeOperation;
  external set globalCompositeOperation(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get backgroundColor;
  external set backgroundColor(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get selectionBackgroundColor;
  external set selectionBackgroundColor(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get stroke;
  external set stroke(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get strokeWidth;
  external set strokeWidth(dynamic /*num|dynamic*/ v);
  external dynamic /*List<num>|dynamic*/ get strokeDashArray;
  external set strokeDashArray(dynamic /*List<num>|dynamic*/ v);
  external dynamic /*num|dynamic*/ get strokeDashOffset;
  external set strokeDashOffset(dynamic /*num|dynamic*/ v);
  external dynamic /*String|dynamic*/ get strokeLineCap;
  external set strokeLineCap(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get strokeLineJoin;
  external set strokeLineJoin(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get strokeMiterLimit;
  external set strokeMiterLimit(dynamic /*num|dynamic*/ v);
  external dynamic /*Shadow|String|dynamic*/ get shadow;
  external set shadow(dynamic /*Shadow|String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get borderOpacityWhenMoving;
  external set borderOpacityWhenMoving(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get borderScaleFactor;
  external set borderScaleFactor(dynamic /*num|dynamic*/ v);
  external dynamic /*num|dynamic*/ get minScaleLimit;
  external set minScaleLimit(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get selectable;
  external set selectable(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get evented;
  external set evented(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get visible;
  external set visible(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get hasControls;
  external set hasControls(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get hasBorders;
  external set hasBorders(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get hasRotatingPoint;
  external set hasRotatingPoint(dynamic /*bool|dynamic*/ v);
  external dynamic /*num|dynamic*/ get rotatingPointOffset;
  external set rotatingPointOffset(dynamic /*num|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get perPixelTargetFind;
  external set perPixelTargetFind(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get includeDefaultValues;
  external set includeDefaultValues(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockMovementX;
  external set lockMovementX(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockMovementY;
  external set lockMovementY(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockRotation;
  external set lockRotation(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockScalingX;
  external set lockScalingX(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockScalingY;
  external set lockScalingY(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockUniScaling;
  external set lockUniScaling(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockSkewingX;
  external set lockSkewingX(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockSkewingY;
  external set lockSkewingY(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get lockScalingFlip;
  external set lockScalingFlip(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get excludeFromExport;
  external set excludeFromExport(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get objectCaching;
  external set objectCaching(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get statefullCache;
  external set statefullCache(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get noScaleCache;
  external set noScaleCache(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get strokeUniform;
  external set strokeUniform(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get dirty;
  external set dirty(dynamic /*bool|dynamic*/ v);
  external dynamic /*String|dynamic*/ get paintFirst;
  external set paintFirst(dynamic /*String|dynamic*/ v);
  external dynamic /*List<String>|dynamic*/ get stateProperties;
  external set stateProperties(dynamic /*List<String>|dynamic*/ v);
  external dynamic /*List<String>|dynamic*/ get cacheProperties;
  external set cacheProperties(dynamic /*List<String>|dynamic*/ v);
  external dynamic /*Object|dynamic*/ get clipPath;
  external set clipPath(dynamic /*Object|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get inverted;
  external set inverted(dynamic /*bool|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get absolutePositioned;
  external set absolutePositioned(dynamic /*bool|dynamic*/ v);
  external dynamic /*String|dynamic*/ get name;
  external set name(dynamic /*String|dynamic*/ v);
  external dynamic get data;
  external set data(dynamic v);
  external dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
      get oCoords;
  external set oCoords(
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          v);
  external dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
      get aCoords;
  external set aCoords(
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/ v);
  external dynamic get matrixCache;
  external set matrixCache(dynamic v);
  external dynamic get ownMatrixCache;
  external set ownMatrixCache(dynamic v);
  external dynamic /*num|dynamic*/ get snapAngle;
  external set snapAngle(dynamic /*num|dynamic*/ v);
  external dynamic /*Null|num|dynamic*/ get snapThreshold;
  external set snapThreshold(dynamic /*Null|num|dynamic*/ v);
  external dynamic /*Group|dynamic*/ get group;
  external set group(dynamic /*Group|dynamic*/ v);
  external dynamic /*Canvas|dynamic*/ get canvas;
  external set canvas(dynamic /*Canvas|dynamic*/ v);
  external factory IObjectOptions(
      {dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class FabricObject
    implements IObservable<FabricObject>, IObjectOptions, IObjectAnimation<FabricObject> {
  external dynamic
      /*{
        bl?: boolean | undefined;
        br?: boolean | undefined;
        mb?: boolean | undefined;
        ml?: boolean | undefined;
        mr?: boolean | undefined;
        mt?: boolean | undefined;
        tl?: boolean | undefined;
        tr?: boolean | undefined;
        mtr?: boolean | undefined;
    }*/
      get JS$_controlsVisibility;
  external set JS$_controlsVisibility(
      dynamic
          /*{
        bl?: boolean | undefined;
        br?: boolean | undefined;
        mb?: boolean | undefined;
        ml?: boolean | undefined;
        mr?: boolean | undefined;
        mt?: boolean | undefined;
        tl?: boolean | undefined;
        tr?: boolean | undefined;
        mtr?: boolean | undefined;
    }*/
          v);
  external dynamic /*JSMap of <String,Control>*/ get controls;
  external set controls(dynamic /*JSMap of <String,Control>*/ v);
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Object([IObjectOptions options]);*/
  external FabricObject initialize([IObjectOptions options]);

  /// Sets object's properties from options
  /*external void setOptions(IObjectOptions options);*/
  /// Sets object's properties from options
  /*external void setOptions([dynamic options]);*/
  external void setOptions([dynamic /*IObjectOptions|dynamic*/ options]);
  external void transform(CanvasRenderingContext2D ctx);
  external dynamic toObject([List<String> propertiesToInclude]);
  external dynamic toDatalessObject([List<String> propertiesToInclude]);

  external String toString();
  external dynamic /*{ scaleX: number; scaleY: number }*/ getObjectScaling();
  external dynamic /*{ scaleX: number; scaleY: number }*/
      getTotalObjectScaling();
  external num getObjectOpacity();
  external void setOnGroup();
  external List<dynamic> getViewportTransform();
  external void render(CanvasRenderingContext2D ctx);
  external bool needsItsOwnCache();
  external bool shouldCache();
  external bool willDrawShadow();
  external void drawClipPathOnCache(CanvasRenderingContext2D ctx);
  external void drawObject(CanvasRenderingContext2D ctx);
  external void drawCacheOnCanvas(CanvasRenderingContext2D ctx);
  external bool isCacheDirty([bool skipCanvas]);
  external void clone(Function callback, [List<String> propertiesToInclude]);
  external FabricObject cloneAsImage(Function callback, [IDataURLOptions options]);
  external HTMLCanvasElement toCanvasElement([IDataURLOptions options]);
  external String toDataURL(IDataURLOptions options);
  external bool isType(String type);
  external num complexity();
  external dynamic /*{ version: string; objects: Object[] }*/ toJSON(
      [List<String> propertiesToInclude]);
  external FabricObject rotate(num angle);
  external FabricObject centerH();
  external FabricObject viewportCenterH();
  external FabricObject centerV();
  external FabricObject viewportCenterV();
  external FabricObject center();
  external FabricObject viewportCenter();
  external dynamic /*{ x: number; y: number }*/ getLocalPointer(
      dynamic /*Event|dynamic*/ e,
      [dynamic /*{ x: number; y: number }*/ pointer]);
  external dynamic /*Object[K]*/ get/*<K extends keyof Object>*/(
      dynamic /*K*/ property);
  /*external Object set<K extends keyof Object>(K key, Object[K]|Object[K] Function(Object[K]) value);*/
  /*external Object set(Partial<Object> options);*/
  external FabricObject set/*<K extends keyof Object>*/(
      dynamic /*K|Partial*/ key_options,
      [dynamic /*Object[K]|Object[K] Function(Object[K])*/ value]);
  external FabricObject toggle(dynamic /*keyof Object*/ property);
  /*external Object setSourcePath(String value);*/
  /// Sets sourcePath of an object
  /*external Object setSourcePath(String value);*/
  external FabricObject setSourcePath(String value);
  external FabricObject setAngle(num angle);

  /// functions from object svg export mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Returns styles-string for svg-export
  external String getSvgStyles([bool skipShadow]);

  /// Returns transform-string for svg-export
  external String getSvgTransform([bool full, String additionalTransform]);

  /// Returns transform-string for svg-export from the transform matrix of single elements
  external String getSvgTransformMatrix();

  /// functions from stateful mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Returns true if object state (one of its state properties) was changed
  external bool hasStateChanged(String propertySet);

  /// Saves state of an object
  external FabricObject saveState(
      [dynamic /*{ stateProperties?: any[] | undefined; propertySet?: string | undefined }*/
          options]);

  /// Setups state of an object
  external FabricObject setupState([dynamic options]);

  /// functions from object straightening mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Straightens an object (rotating it from current angle to one of 0, 90, 180, 270, etc. depending on which is closer)
  external FabricObject straighten();

  /// Same as straighten but with animation
  external FabricObject fxStraighten(Callbacks callbacks);

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

  /// functions from interactivity mixin
  /// -----------------------------------------------------------------------------------------------------------------------------------
  /// Draws borders of an object's bounding box.
  /// Requires public properties: width, height
  /// Requires public options: padding, borderColor
  /// @chainable
  external FabricObject drawBorders(CanvasRenderingContext2D ctx,
      [dynamic styleOverride]);

  /// Draws borders of an object's bounding box when it is inside a group.
  /// Requires public properties: width, height
  /// Requires public options: padding, borderColor
  /// @chainable
  external FabricObject drawBordersInGroup(CanvasRenderingContext2D ctx,
      [dynamic options, dynamic styleOverride]);

  /// Draws corners of an object's bounding box.
  /// Requires public properties: width, height
  /// Requires public options: cornerSize, padding
  /// @chainable
  external FabricObject drawControls(CanvasRenderingContext2D ctx,
      [dynamic styleOverride]);

  /// Draws a colored layer behind the object, inside its selection borders.
  /// Requires public options: padding, selectionBackgroundColor
  /// this function is called when the context is transformed
  /// has checks to be skipped when the object is on a staticCanvas
  /// @chainable
  external FabricObject drawSelectionBackground(CanvasRenderingContext2D ctx);

  /// Draws corners of an object's bounding box.
  /// Requires public properties: width, height
  /// Requires public options: cornerSize, padding
  external FabricObject drawCorners(CanvasRenderingContext2D context);

  /// Returns true if the specified control is visible, false otherwise.
  external bool isControlVisible(String controlName);

  /// Sets the visibility of the specified control.
  external FabricObject setControlVisible(String controlName, bool visible);

  /// Sets the visibility state of object controls.
  external FabricObject setControlsVisibility(
      [dynamic
          /*{
        bl?: boolean | undefined;
        br?: boolean | undefined;
        mb?: boolean | undefined;
        ml?: boolean | undefined;
        mr?: boolean | undefined;
        mt?: boolean | undefined;
        tl?: boolean | undefined;
        tr?: boolean | undefined;
        mtr?: boolean | undefined;
    }*/
          options]);

  /// functions from geometry mixin
  /// -------------------------------------------------------------------------------------------------------------------------------
  /// Sets corner position coordinates based on current angle, width and height.
  /// oCoords are used to find the corners
  /// aCoords are used to quickly find an object on the canvas
  /// lineCoords are used to quickly find object during pointer events.
  /// See [https://github.com/kangax/fabric.js/wiki/When-to-call-setCoords|When-to-call-setCoords]
  /// @chainable
  external FabricObject setCoords([bool skipCorners]);

  /// Returns coordinates of object's bounding rectangle (left, top, width, height)
  /// the box is intented as aligned to axis of canvas.
  external dynamic /*{ left: number; top: number; width: number; height: number }*/
      getBoundingRect([bool absolute, bool calculate]);

  /// Checks if object is fully contained within area of another object
  external bool isContainedWithinObject(FabricObject other,
      [bool absolute, bool calculate]);

  /// Checks if object is fully contained within area formed by 2 points
  external bool isContainedWithinRect(dynamic pointTL, dynamic pointBR,
      [bool absolute, bool calculate]);

  /// Checks if point is inside the object
  external bool containsPoint(Point point,
      [dynamic lines, bool absolute, bool calculate]);

  /// Scales an object (equally by x and y)
  external FabricObject scale(num value);

  /// Scales an object to a given height, with respect to bounding box (scaling by x/y equally)
  external FabricObject scaleToHeight(num value, [bool absolute]);

  /// Scales an object to a given width, with respect to bounding box (scaling by x/y equally)
  external FabricObject scaleToWidth(num value, [bool absolute]);

  /// Checks if object intersects with another object
  external bool intersectsWithObject(FabricObject other,
      [bool absolute, bool calculate]);

  /// Checks if object intersects with an area formed by 2 points
  external bool intersectsWithRect(dynamic pointTL, dynamic pointBR,
      [bool absolute, bool calculate]);

  /// Animates object's properties
  /// object.animate('left', ..., {duration: ...});
  /*external Object animate(String property, num|String value, [IAnimationOptions options]);*/
  /// Animates object's properties
  /// object.animate({ left: ..., top: ... }, { duration: ... });
  /*external Object animate(JSMap of <String,num|String> properties, [IAnimationOptions options]);*/

  external FabricObject animate(
      dynamic /*String|JSMap of <String,num|String>*/ property_properties,
      [dynamic /*num|String|IAnimationOptions*/ value_options,
      IAnimationOptions options]);

  /// Calculate and returns the .coords of an object.
  /// @chainable
  external dynamic calcCoords([bool absolute]);

  /// calculate trasform Matrix that represent current transformation from
  /// object properties.
  external List<dynamic> calcTransformMatrix([bool skipGroup]);

  /// calculate transform matrix that represents the current transformations from the
  /// object's properties, this matrix does not include the group transformation
  external List<dynamic> calcOwnMatrix();

  /// return correct set of coordinates for intersection
  external List<Point> /*Tuple of <Point,Point,Point,Point>*/ getCoords(
      [bool absolute, bool calculate]);

  /// Returns height of an object bounding box counting transformations
  /// before 2.0 it was named getHeight();
  external num getScaledHeight();

  /// Returns width of an object bounding box counting transformations
  /// before 2.0 it was named getWidth();
  external num getScaledWidth();

  /// Returns id attribute for svg output
  external String getSvgCommons();

  /// Returns filter for svg shadow
  external String getSvgFilter();

  /// Returns styles-string for svg-export
  external String getSvgSpanStyles(dynamic style, [bool useWhiteSpace]);

  /// Returns text-decoration property for svg-export
  external String getSvgTextDecoration(dynamic style);

  /// Checks if object is contained within the canvas with current viewportTransform
  /// the check is done stopping at first point that appears on screen
  external bool isOnScreen([bool calculate]);

  /// Checks if object is partially contained within the canvas with current viewportTransform
  external bool isPartiallyOnScreen([bool calculate]);

  /// This callback function is called every time _discardActiveObject or _setActiveObject
  /// try to to deselect this object. If the function returns true, the process is cancelled
  /*external bool onDeselect({ e?: Event | undefined; object?: Object | undefined } options);*/
  /// This callback function is called every time _discardActiveObject or _setActiveObject
  /// try to to deselect this object. If the function returns true, the process is cancelled
  /*external bool onDeselect({ e?: Event | undefined; object?: fabric.Object | undefined } options);*/
  external bool onDeselect(
      dynamic /*{ e?: Event | undefined; object?: Object | undefined }|{ e?: Event | undefined; object?: fabric.Object | undefined }*/
          options);

  /// This callback function is called every time _discardActiveObject or _setActiveObject
  /// try to to select this object. If the function returns true, the process is cancelled
  external bool onSelect(dynamic /*{ e?: Event | undefined }*/ options);

  /// Returns svg clipPath representation of an instance
  external String toClipPathSVG([Function reviver]);

  /// Returns svg representation of an instance
  external String toSVG([Function reviver]);

  /// Translates the coordinates from a set of origin to another (based on the object's dimensions)
  external Point translateToGivenOrigin(Point pointL, String fromOriginX,
      String fromOriginY, String toOriginX, String toOriginY);

  /// Calculate object dimensions from its properties
  /// @private
  external dynamic /*{ x: number; y: number }*/
      JS$_getNonTransformedDimensions();

  /// Returns the top, left coordinates
  external Point JS$_getLeftTopCoords();

  /// Calculate object bounding box dimensions from its properties scale, skew.
  /// @private
  external dynamic /*{ x: number; y: number }*/ JS$_getTransformedDimensions(
      [num skewX, num skewY]);
  external void JS$_renderFill(CanvasRenderingContext2D ctx);
  external void JS$_renderStroke(CanvasRenderingContext2D ctx);
  external void JS$_removeShadow(CanvasRenderingContext2D ctx);

  /// Sets line dash
  external void JS$_setLineDash(
      CanvasRenderingContext2D ctx, List<num> dashArray,
      [void Function(CanvasRenderingContext2D ctx) alternative]);
  external void JS$_applyPatternGradientTransform(
      CanvasRenderingContext2D ctx, dynamic /*String|Pattern|Gradient*/ filler);
  external void JS$_render(CanvasRenderingContext2D ctx);
  external void JS$_renderPaintInOrder(CanvasRenderingContext2D ctx);

  /// Returns the instance of the control visibility set for this object.
  external dynamic
      /*{
        tl: boolean;
        tr: boolean;
        br: boolean;
        bl: boolean;
        ml: boolean;
        mt: boolean;
        mr: boolean;
        mb: boolean;
        mtr: boolean;
    }*/
      JS$_getControlsVisibility();

  /// Determines which corner has been clicked
  external dynamic /*bool|'bl'|'br'|'mb'|'ml'|'mr'|'mt'|'tl'|'tr'|'mtr'*/
      JS$_findTargetCorner(
          dynamic
              /*{
        x: number;
        y: number;
    }*/
              pointer);
  external FabricObject JS$_set(String key, dynamic value);

  /// Creates fabric Object instance
  external static FabricObject JS$_fromObject(String className, FabricObject object,
      [Function callback, dynamic extraParam]);

  /// Defines the number of fraction digits to use when serializing object values.
  external static dynamic /*num|dynamic*/ get NUM_FRACTION_DIGITS;
  external static set NUM_FRACTION_DIGITS(dynamic /*num|dynamic*/ v);
}

@anonymous
@JS()
abstract class IPathOptions implements IObjectOptions {
  /// Array of path points
  external dynamic /*List<Point>|dynamic*/ get path;
  external set path(dynamic /*List<Point>|dynamic*/ v);
  external factory IPathOptions(
      {dynamic /*List<Point>|dynamic*/ path,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Path implements FabricObject, IPathOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Path([String|List<Point> path, IPathOptions options]);*/
  external Point get pathOffset;
  external set pathOffset(Point v);

  /// Returns svg clipPath representation of an instance

  external String toClipPathSVG([Function reviver]);

  /// Returns svg representation of an instance

  external String toSVG([Function reviver]);

  /// Creates an instance of fabric.Path from an SVG <path> element
  external static Path fromElement(SVGElement element, Function callback,
      [IPathOptions options]);

  /// Creates an instance of fabric.Path from an object
  external static Path fromObject(dynamic object, Function callback);

  /// List of attribute names to account for when parsing SVG element (used by `fabric.Polygon.fromElement`)
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);
}

@anonymous
@JS()
abstract class Polygon implements IPolylineOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Polygon(Array<{ x: number; y: number }> points, [IPolylineOptions options]);*/
  /// Returns Polygon instance from an SVG element
  external static Polygon fromElement(SVGElement element,
      [IPolylineOptions options]);

  /// Returns fabric.Polygon instance from an object representation
  external static Polygon fromObject(dynamic object);
}

@anonymous
@JS()
abstract class IPolylineOptions implements IObjectOptions {
  /// Points array
  external dynamic /*List<Point>|dynamic*/ get points;
  external set points(dynamic /*List<Point>|dynamic*/ v);
  external factory IPolylineOptions(
      {dynamic /*List<Point>|dynamic*/ points,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Polyline implements IPolylineOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Polyline(Array<{ x: number; y: number }> points, [IPolylineOptions options]);*/
  external Point get pathOffset;
  external set pathOffset(Point v);

  /// Calculate the polygon min and max point from points array,
  /// returning an object with left, top, width, height to measure the polygon size
  external dynamic /*{ left: number; top: number; width: number; height: number }*/
      JS$_calcDimensions();

  /// List of attribute names to account for when parsing SVG element (used by `fabric.Polygon.fromElement`)
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);

  /// Returns Polyline  instance from an SVG element
  external static Polyline fromElement(SVGElement element,
      [IPolylineOptions options]);

  /// Returns fabric.Polyline instance from an object representation
  external static Polyline fromObject(dynamic object);
}

@anonymous
@JS()
abstract class IRectOptions implements IObjectOptions {
  /// Horizontal border radius
  external dynamic /*num|dynamic*/ get rx;
  external set rx(dynamic /*num|dynamic*/ v);

  /// Vertical border radius
  external dynamic /*num|dynamic*/ get ry;
  external set ry(dynamic /*num|dynamic*/ v);
  external factory IRectOptions(
      {dynamic /*num|dynamic*/ rx,
      dynamic /*num|dynamic*/ ry,
      dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Rect implements IRectOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  external factory Rect({required IRectOptions options});

  /// List of attribute names to account for when parsing SVG element (used by `fabric.Rect.fromElement`)
  external static List<String> get ATTRIBUTE_NAMES;
  external static set ATTRIBUTE_NAMES(List<String> v);

  /// Returns Rect instance from an SVG element
  external static Rect fromElement(SVGElement element, [IRectOptions options]);

  /// Returns Rect instance from an object representation
  external static Rect fromObject(dynamic object);
}

@anonymous
@JS()
abstract class TextOptions implements IObjectOptions {
  external dynamic /*String|dynamic*/ get type;

  external set type(dynamic /*String|dynamic*/ v);

  /// Font size (in pixels)
  external dynamic /*num|dynamic*/ get fontSize;
  external set fontSize(dynamic /*num|dynamic*/ v);

  /// Font weight (e.g. bold, normal, 400, 600, 800)
  external dynamic /*String|num|dynamic*/ get fontWeight;
  external set fontWeight(dynamic /*String|num|dynamic*/ v);

  /// Font family
  external dynamic /*String|dynamic*/ get fontFamily;
  external set fontFamily(dynamic /*String|dynamic*/ v);

  /// Text decoration underline.
  external dynamic /*bool|dynamic*/ get underline;
  external set underline(dynamic /*bool|dynamic*/ v);

  /// Text decoration overline.
  external dynamic /*bool|dynamic*/ get overline;
  external set overline(dynamic /*bool|dynamic*/ v);

  /// Text decoration linethrough.
  external dynamic /*bool|dynamic*/ get linethrough;
  external set linethrough(dynamic /*bool|dynamic*/ v);

  /// Text alignment. Possible values: "left", "center", "right", "justify",
  /// "justify-left", "justify-center" or "justify-right".
  external dynamic /*String|dynamic*/ get textAlign;
  external set textAlign(dynamic /*String|dynamic*/ v);

  /// Font style . Possible values: "", "normal", "italic" or "oblique".
  external dynamic /*''|'normal'|'italic'|'oblique'|dynamic*/ get fontStyle;
  external set fontStyle(dynamic /*''|'normal'|'italic'|'oblique'|dynamic*/ v);

  /// Line height
  external dynamic /*num|dynamic*/ get lineHeight;
  external set lineHeight(dynamic /*num|dynamic*/ v);

  /// Superscript schema object (minimum overlap)
  external dynamic /*{ size: number; baseline: number }|dynamic*/
      get superscript;
  external set superscript(
      dynamic /*{ size: number; baseline: number }|dynamic*/ v);

  /// Subscript schema object (minimum overlap)
  external dynamic /*{ size: number; baseline: number }|dynamic*/ get subscript;
  external set subscript(
      dynamic /*{ size: number; baseline: number }|dynamic*/ v);

  /// Background color of text lines
  external dynamic /*String|dynamic*/ get textBackgroundColor;
  external set textBackgroundColor(dynamic /*String|dynamic*/ v);

  /// When defined, an object is rendered via stroke and this property specifies its color.
  /// <b>Backwards incompatibility note:</b> This property was named "strokeStyle" until v1.1.6

  external dynamic /*String|dynamic*/ get stroke;

  external set stroke(dynamic /*String|dynamic*/ v);

  /// Shadow object representing shadow of this shape.
  /// <b>Backwards incompatibility note:</b> This property was named "textShadow" (String) until v1.2.11

  external dynamic /*Shadow|String|dynamic*/ get shadow;

  external set shadow(dynamic /*Shadow|String|dynamic*/ v);

  /// additional space between characters
  /// expressed in thousands of em unit
  external dynamic /*num|dynamic*/ get charSpacing;
  external set charSpacing(dynamic /*num|dynamic*/ v);

  /// Object containing character styles - top-level properties -> line numbers,
  /// 2nd-level properties - charater numbers
  external dynamic get styles;
  external set styles(dynamic v);

  /// Baseline shift, stlyes only, keep at 0 for the main text object
  external dynamic /*num|dynamic*/ get deltaY;
  external set deltaY(dynamic /*num|dynamic*/ v);

  /// Text input direction. supporting RTL languages.
  external dynamic /*'ltr'|'rtl'|dynamic*/ get direction;
  external set direction(dynamic /*'ltr'|'rtl'|dynamic*/ v);
  external dynamic /*String|dynamic*/ get text;
  external set text(dynamic /*String|dynamic*/ v);

  /// List of properties to consider when checking if cache needs refresh

  external dynamic /*List<String>|dynamic*/ get cacheProperties;

  external set cacheProperties(dynamic /*List<String>|dynamic*/ v);

  /// List of properties to consider when checking if
  /// state of an object is changed ([fabric.Object#hasStateChanged])
  /// as well as for history (undo/redo) purposes

  external dynamic /*List<String>|dynamic*/ get stateProperties;

  external set stateProperties(dynamic /*List<String>|dynamic*/ v);
  external factory TextOptions(
      {dynamic /*String|dynamic*/ type,
      dynamic /*num|dynamic*/ fontSize,
      dynamic /*String|num|dynamic*/ fontWeight,
      dynamic /*String|dynamic*/ fontFamily,
      dynamic /*bool|dynamic*/ underline,
      dynamic /*bool|dynamic*/ overline,
      dynamic /*bool|dynamic*/ linethrough,
      dynamic /*String|dynamic*/ textAlign,
      dynamic /*''|'normal'|'italic'|'oblique'|dynamic*/ fontStyle,
      dynamic /*num|dynamic*/ lineHeight,
      dynamic /*{ size: number; baseline: number }|dynamic*/ superscript,
      dynamic /*{ size: number; baseline: number }|dynamic*/ subscript,
      dynamic /*String|dynamic*/ textBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ charSpacing,
      dynamic styles,
      dynamic /*num|dynamic*/ deltaY,
      dynamic /*'ltr'|'rtl'|dynamic*/ direction,
      dynamic /*String|dynamic*/ text,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Text implements TextOptions {
  external List<String> get JS$_text;
  external set JS$_text(List<String> v);
  external dynamic /*{ top: number; left: number }*/ get cursorOffsetCache;
  external set cursorOffsetCache(dynamic /*{ top: number; left: number }*/ v);

  /// Properties which when set cause object to change dimensions
  external List<String> get JS$_dimensionAffectingProps;
  external set JS$_dimensionAffectingProps(List<String> v);

  /// List of lines in text object
  external List<String> get textLines;
  external set textLines(List<String> v);

  /// List of grapheme lines in text object
  external List<List<String>> get JS$_textLines;
  external set JS$_textLines(List<List<String>> v);

  /// List of unwrapped grapheme lines in text object
  external List<List<String>> get JS$_unwrappedTextLines;
  external set JS$_unwrappedTextLines(List<List<String>> v);

  /// Use this regular expression to filter for whitespaces that is not a new line.
  /// Mostly used when text is 'justify' aligned.
  external RegExp get JS$_reSpacesAndTabs;
  external set JS$_reSpacesAndTabs(RegExp v);

  /// Use this regular expression to filter for whitespace that is not a new line.
  /// Mostly used when text is 'justify' aligned.
  external RegExp get JS$_reSpaceAndTab;
  external set JS$_reSpaceAndTab(RegExp v);

  /// List of line widths
  external List<num> get JS$__lineWidths;
  external set JS$__lineWidths(List<num> v);

  /// List of line heights
  external List<num> get JS$__lineHeights;
  external set JS$__lineHeights(List<num> v);

  /// Contains characters bounding boxes for each line and char
  /// Array of char grapheme bounding boxes
  external dynamic
      /*Array<Array<{
                    width: number;
                    left: number;
                    height?: number | undefined;
                    kernedWidth?: number | undefined;
                    deltaY?: number | undefined;
                }>>|dynamic*/
      get JS$__charBounds;
  external set JS$__charBounds(
      dynamic
          /*Array<Array<{
                    width: number;
                    left: number;
                    height?: number | undefined;
                    kernedWidth?: number | undefined;
                    deltaY?: number | undefined;
                }>>|dynamic*/
          v);

  /// Text Line proportion to font Size (in pixels)
  external num get JS$_fontSizeMult;
  external set JS$_fontSizeMult(num v);
  external num get JS$_fontSizeFraction;
  external set JS$_fontSizeFraction(num v);
  external bool get JS$__skipDimension;
  external set JS$__skipDimension(bool v);

  /// use this size when measuring text. To avoid IE11 rounding errors
  /// @default
  external num get CACHE_FONT_SIZE;
  external set CACHE_FONT_SIZE(num v);

  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Text(String text, [TextOptions options]);*/
  /// Return a context for measurement of text string.
  /// if created it gets stored for reuse
  external CanvasRenderingContext2D getMeasuringContext();

  /// Initialize or update text dimensions.
  /// Updates this.width and this.height with the proper values.
  /// Does not return dimensions.
  external void initDimensions();

  /// Enlarge space boxes and shift the others
  external void enlargeSpaces();

  /// Detect if the text line is ended with an hard break
  /// text and itext do not have wrapping, return false
  external bool isEndOfWrapping(num lineIndex);

  /// Returns string representation of an instance

  external String toString();

  /// Computes height of character at given position
  external num getHeightOfChar(num line, num char);

  /// measure a text line measuring all characters.
  external dynamic /*{ width: number; numOfSpaces: number }*/ measureLine(
      num lineIndex);

  /// Calculate height of line at 'lineIndex'
  external num getHeightOfLine(num lineIndex);

  /// Calculate text box height
  external num calcTextHeight();

  /// Turns the character into a 'superior figure' (i.e. 'superscript')
  /// @chainable
  external Text setSuperscript(num start, num end);

  /// Turns the character into an 'inferior figure' (i.e. 'subscript')
  /// @chainable
  external Text setSubscript(num start, num end);

  /// Retrieves the value of property at given character position
  external dynamic getValueOfPropertyAt(
      num lineIndex, num charIndex, String property);
  external static num get DEFAULT_SVG_FONT_SIZE;
  external static set DEFAULT_SVG_FONT_SIZE(num v);

  /// Returns fabric.Text instance from an SVG element (<b>not yet implemented</b>)
  /// @static
  external static Text fromElement(SVGElement element,
      [Function callback, TextOptions options]);

  /// Returns fabric.Text instance from an object representation
  /// @static
  external static Text fromObject(dynamic object, [Function callback]);

  /// Check if characters in a text have a value for a property
  /// whose value matches the textbox's value for that property.  If so,
  /// the character-level property is deleted.  If the character
  /// has no other properties, then it is also deleted.  Finally,
  /// if the line containing that character has no other characters
  /// then it also is deleted.
  external void cleanStyle(String property);

  /// Returns 2d representation (lineIndex and charIndex) of cursor (or selection start)
  external dynamic /*{ lineIndex: number; charIndex: number }*/
      get2DCursorLocation([num selectionStart, bool skipWrapping]);

  /// return a new object that contains all the style property for a character
  /// the object returned is newly created
  external dynamic getCompleteStyleDeclaration(num lineIndex, num charIndex);

  /// Gets style of a current selection/cursor (at the start position)
  /// if startIndex or endIndex are not provided, slectionStart or selectionEnd will be used.
  external List<dynamic> getSelectionStyles(
      [num startIndex, num endIndex, bool complete]);

  /// Returns styles-string for svg-export
  external String getSvgStyles([bool skipShadow]);

  /// Returns true if object has no styling or no styling in a line
  external bool isEmptyStyles(num lineIndex);

  /// Remove a style property or properties from all individual character styles
  /// in a text object.  Deletes the character style object if it contains no other style
  /// props.  Deletes a line style object if it contains no other character styles.
  external void removeStyle(String property);

  /// Sets style of a current selection, if no selection exist, do not set anything.
  /// @chainable
  external Text setSelectionStyles(dynamic styles,
      [num startIndex, num endIndex]);

  /// Returns true if object has a style property or has it ina specified line
  external bool styleHas(String property, [num lineIndex]);

  /// Measure a single line given its index. Used to calculate the initial
  /// text bounding box. The values are calculated and stored in __lineWidths cache.
  external num getLineWidth(num lineIndex);
  external num JS$_getLineLeftOffset(num lineIndex);

  /// apply all the character style to canvas for rendering
  external void JS$_applyCharStyles(String method, CanvasRenderingContext2D ctx,
      num lineIndex, num charIndex, dynamic styleDeclaration);

  /// get the reference, not a clone, of the style object for a given character
  external dynamic JS$_getStyleDeclaration(num lineIndex, num charIndex);

  /// Generate an object that translates the style object so that it is
  /// broken up by visual lines (new lines and automatic wrapping).
  /// The original text styles object is broken up by actual lines (new lines only),
  /// which is only sufficient for Text / IText
  external dynamic /*JSMap of <num,{ line: number; offset: number }>*/
      JS$_generateStyleMap(
          dynamic
              /*{
        _unwrappedLines: string[];
        lines: string[];
        graphemeText: string[];
        graphemeLines: string[];
    }*/
              textInfo);

  /// Gets the width of character spacing
  external num JS$_getWidthOfCharSpacing();

  /// measure and return the width of a single character.
  /// possibly overridden to accommodate different measure logic or
  /// to hook some external lib for character measurement
  external dynamic /*{ width: number; kernedWidth: number }*/ JS$_measureChar(
      String JS$_char,
      dynamic charStyle,
      String previousChar,
      dynamic prevCharStyle);
  external void JS$_renderChars(String method, CanvasRenderingContext2D ctx,
      String line, num left, num top, num lineIndex);
  external void JS$_renderChar(String method, CanvasRenderingContext2D ctx,
      num lineIndex, num charIndex, String JS$_char, num left, num top);
  /*external void JS$_renderTextLine(String method, CanvasRenderingContext2D ctx,
    List<String> line, num left, num top, num lineIndex);
*/
  /*external void JS$_renderTextLine(String method, CanvasRenderingContext2D ctx,
    String line, num left, num top, num lineIndex);
*/
  external void JS$_renderTextLine(String method, CanvasRenderingContext2D ctx,
      dynamic /*List<String>|String*/ line, num left, num top, num lineIndex);
  external void JS$_renderText(CanvasRenderingContext2D ctx);
  external void JS$_clearCache();
  external dynamic /*{ _unwrappedLines: string[]; lines: string[]; graphemeText: string[]; graphemeLines: string[] }*/
      JS$_splitText();
  external bool JS$_hasStyleChanged(dynamic prevStyle, dynamic thisStyle);
  external void JS$_setTextStyles(CanvasRenderingContext2D ctx,
      [dynamic /*{ fontFamily: string; fontSize: number; fontWieght: string; fontStyle: string }*/
          charStyle,
      bool forMeasuring]);
  external bool JS$_shouldClearDimensionCache();
}

@anonymous
@JS()
abstract class ITextOptions implements TextOptions {
  /// Index where text selection starts (or where cursor is when there is no selection)
  external dynamic /*num|dynamic*/ get selectionStart;
  external set selectionStart(dynamic /*num|dynamic*/ v);

  /// Index where text selection ends
  external dynamic /*num|dynamic*/ get selectionEnd;
  external set selectionEnd(dynamic /*num|dynamic*/ v);

  /// Color of text selection
  external dynamic /*String|dynamic*/ get selectionColor;
  external set selectionColor(dynamic /*String|dynamic*/ v);

  /// Indicates whether text is selected
  external dynamic /*bool|dynamic*/ get selected;
  external set selected(dynamic /*bool|dynamic*/ v);

  /// Indicates whether text is in editing mode
  external dynamic /*bool|dynamic*/ get isEditing;
  external set isEditing(dynamic /*bool|dynamic*/ v);

  /// Indicates whether a text can be edited
  external dynamic /*bool|dynamic*/ get editable;
  external set editable(dynamic /*bool|dynamic*/ v);

  /// Border color of text object while it's in editing mode
  external dynamic /*String|dynamic*/ get editingBorderColor;
  external set editingBorderColor(dynamic /*String|dynamic*/ v);

  /// Width of cursor (in px)
  external dynamic /*num|dynamic*/ get cursorWidth;
  external set cursorWidth(dynamic /*num|dynamic*/ v);

  /// Color of default cursor (when not overwritten by character style)
  external dynamic /*String|dynamic*/ get cursorColor;
  external set cursorColor(dynamic /*String|dynamic*/ v);

  /// Delay between cursor blink (in ms)
  external dynamic /*num|dynamic*/ get cursorDelay;
  external set cursorDelay(dynamic /*num|dynamic*/ v);

  /// Duration of cursor fadein (in ms)
  external dynamic /*num|dynamic*/ get cursorDuration;
  external set cursorDuration(dynamic /*num|dynamic*/ v);

  /// Indicates whether internal text char widths can be cached
  external dynamic /*bool|dynamic*/ get caching;
  external set caching(dynamic /*bool|dynamic*/ v);

  /// Helps determining when the text is in composition, so that the cursor
  /// rendering is altered.
  external dynamic /*bool|dynamic*/ get inCompositionMode;
  external set inCompositionMode(dynamic /*bool|dynamic*/ v);
  external dynamic /*String|dynamic*/ get path;
  external set path(dynamic /*String|dynamic*/ v);
  external dynamic /*bool|dynamic*/ get useNative;
  external set useNative(dynamic /*bool|dynamic*/ v);

  /// For functionalities on keyDown + ctrl || cmd
  external dynamic get ctrlKeysMapDown;
  external set ctrlKeysMapDown(dynamic v);

  /// For functionalities on keyUp + ctrl || cmd
  external dynamic get ctrlKeysMapUp;
  external set ctrlKeysMapUp(dynamic v);

  /// For functionalities on keyDown
  /// Map a special key to a function of the instance/prototype
  /// If you need different behaviour for ESC or TAB or arrows, you have to change
  /// this map setting the name of a function that you build on the fabric.Itext or
  /// your prototype.
  /// the map change will affect all Instances unless you need for only some text Instances
  /// in that case you have to clone this object and assign your Instance.
  /// this.keysMap = fabric.util.object.clone(this.keysMap);
  /// The function must be in fabric.Itext.prototype.myFunction And will receive event as args[0]
  external dynamic get keysMap;
  external set keysMap(dynamic v);

  /// Exposes underlying hidden text area
  external dynamic /*HTMLTextAreaElement|dynamic*/ get hiddenTextarea;
  external set hiddenTextarea(dynamic /*HTMLTextAreaElement|dynamic*/ v);
  external factory ITextOptions(
      {dynamic /*num|dynamic*/ selectionStart,
      dynamic /*num|dynamic*/ selectionEnd,
      dynamic /*String|dynamic*/ selectionColor,
      dynamic /*bool|dynamic*/ selected,
      dynamic /*bool|dynamic*/ isEditing,
      dynamic /*bool|dynamic*/ editable,
      dynamic /*String|dynamic*/ editingBorderColor,
      dynamic /*num|dynamic*/ cursorWidth,
      dynamic /*String|dynamic*/ cursorColor,
      dynamic /*num|dynamic*/ cursorDelay,
      dynamic /*num|dynamic*/ cursorDuration,
      dynamic /*bool|dynamic*/ caching,
      dynamic /*bool|dynamic*/ inCompositionMode,
      dynamic /*String|dynamic*/ path,
      dynamic /*bool|dynamic*/ useNative,
      dynamic ctrlKeysMapDown,
      dynamic ctrlKeysMapUp,
      dynamic keysMap,
      dynamic /*HTMLTextAreaElement|dynamic*/ hiddenTextarea,
      dynamic /*String|dynamic*/ type,
      dynamic /*num|dynamic*/ fontSize,
      dynamic /*String|num|dynamic*/ fontWeight,
      dynamic /*String|dynamic*/ fontFamily,
      dynamic /*bool|dynamic*/ underline,
      dynamic /*bool|dynamic*/ overline,
      dynamic /*bool|dynamic*/ linethrough,
      dynamic /*String|dynamic*/ textAlign,
      dynamic /*''|'normal'|'italic'|'oblique'|dynamic*/ fontStyle,
      dynamic /*num|dynamic*/ lineHeight,
      dynamic /*{ size: number; baseline: number }|dynamic*/ superscript,
      dynamic /*{ size: number; baseline: number }|dynamic*/ subscript,
      dynamic /*String|dynamic*/ textBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ charSpacing,
      dynamic styles,
      dynamic /*num|dynamic*/ deltaY,
      dynamic /*'ltr'|'rtl'|dynamic*/ direction,
      dynamic /*String|dynamic*/ text,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class IText implements ITextOptions {
  external bool get fromPaste;
  external set fromPaste(bool v);
  external num get JS$_currentCursorOpacity;
  external set JS$_currentCursorOpacity(num v);
  external RegExp get JS$_reSpace;
  external set JS$_reSpace(RegExp v);

  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory IText(String text, [ITextOptions options]);*/
  /// Sets selection start (left boundary of a selection)
  external void setSelectionStart(num index);

  /// Sets selection end (right boundary of a selection)
  external void setSelectionEnd(num index);

  /// Prepare and clean the contextTop
  external void clearContextTop([bool skipRestore]);

  /// Renders cursor or selection (depending on what exists)
  external void renderCursorOrSelection();

  /// Renders cursor
  external void renderCursor(dynamic boundaries, CanvasRenderingContext2D ctx);

  /// Renders text selection
  external void renderSelection(
      dynamic boundaries, CanvasRenderingContext2D ctx);

  /// High level function to know the height of the cursor.
  /// the currentChar is the one that precedes the cursor
  /// Returns fontSize of char at the current cursor
  external num getCurrentCharFontSize();

  /// High level function to know the color of the cursor.
  /// the currentChar is the one that precedes the cursor
  /// Returns color (fill) of char at the current cursor
  external String getCurrentCharColor();

  /// Returns fabric.IText instance from an object representation
  /// @static
  external static IText fromObject(dynamic object, [Function callback]);

  /// Initializes all the interactive behavior of IText
  external void initBehavior();

  /// Initializes "added" event handler
  external void initAddedHandler();

  /// Initializes delayed cursor
  external void initDelayedCursor();

  /// Aborts cursor animation and clears all timeouts
  external void abortCursorAnimation();

  /// Selects entire text
  /// @chainable
  external IText selectAll();

  /// Returns selected text
  external String getSelectedText();

  /// Find new selection index representing start of current word according to current selection index
  external num findWordBoundaryLeft(num startFrom);

  /// Find new selection index representing end of current word according to current selection index
  external num findWordBoundaryRight(num startFrom);

  /// Find new selection index representing start of current line according to current selection index
  external num findLineBoundaryLeft(num startFrom);

  /// Find new selection index representing end of current line according to current selection index
  external num findLineBoundaryRight(num startFrom);

  /// Finds index corresponding to beginning or end of a word
  external num searchWordBoundary(num selectionStart, num direction);

  /// Selects a word based on the index
  external void selectWord(num selectionStart);

  /// Selects a line based on the index
  /// @chainable
  external IText selectLine(num selectionStart);

  /// Enters editing state
  /// @chainable
  external IText enterEditing([MouseEvent e]);

  /// Initializes "mousemove" event handler
  external void initMouseMoveHandler();

  /// Exits from editing state
  /// @chainable
  external IText exitEditing();

  /// remove and reflow a style block from start to end.
  external void removeStyleFromTo(num start, num end);

  /// Shifts line styles up or down
  external void shiftLineStyles(num lineIndex, num offset);

  /// Inserts new style object
  external void insertNewlineStyleObject(
      num lineIndex, num charIndex, num qty, List<dynamic> copiedStyle);

  /// Inserts style object for a given line/char index
  external void insertCharStyleObject(
      num lineIndex, num charIndex, num quantity, List<dynamic> copiedStyle);

  /// Inserts style object(s)
  external void insertNewStyleBlock(List<dynamic> insertedText, num start,
      [List<dynamic> copiedStyle]);

  /// Set the selectionStart and selectionEnd according to the ne postion of cursor
  /// mimic the key - mouse navigation when shift is pressed.
  external void setSelectionStartEndWithShift(
      num start, num end, num newSelection);

  /// Copies selected text
  external void copy();

  /// convert from fabric to textarea values
  external dynamic /*{ selectionStart: number; selectionEnd: number }*/
      fromGraphemeToStringSelection(num start, num end, String JS$_text);

  /// convert from textarea to grapheme indexes
  external dynamic /*{ selectionStart: number; selectionEnd: number }*/
      fromStringToGraphemeSelection(num start, num end, String text);

  /// Gets start offset of a selection
  external num getDownCursorOffset(Event e, [bool isRight]);

  /// Returns index of a character corresponding to where an object was clicked
  external num getSelectionStartFromPointer(Event e);
  external num getUpCursorOffset(Event e, [bool isRight]);

  /// Initializes double and triple click event handlers
  external void initClicks();

  /// Initializes event handlers related to cursor or selection
  external void initCursorSelectionHandlers();

  /// Initializes "dbclick" event handler
  external void initDoubleClickSimulation();

  /// Initializes hidden textarea (needed to bring up keyboard in iOS)
  external void initHiddenTextarea();

  /// Initializes "mousedown" event handler
  external void initMousedownHandler();

  /// Initializes "mouseup" event handler
  external void initMouseupHandler();

  /// insert characters at start position, before start position.
  /// start  equal 1 it means the text get inserted between actual grapheme 0 and 1
  /// if style array is provided, it must be as the same length of text in graphemes
  /// if end is provided and is bigger than start, old text is replaced.
  /// start/end ar per grapheme position in _text array.
  external void insertChars(
      String text, List<dynamic> style, num start, num end);

  /// Moves cursor down
  external void moveCursorDown(Event e);

  /// Moves cursor left
  external void moveCursorLeft(Event e);

  /// Moves cursor left without keeping selection
  external void moveCursorLeftWithoutShift(Event e);

  /// Moves cursor left while keeping selection
  external void moveCursorLeftWithShift(Event e);

  /// Moves cursor right
  external void moveCursorRight(Event e);

  /// Moves cursor right without keeping selection
  external void moveCursorRightWithoutShift(Event e);

  /// Moves cursor right while keeping selection
  external void moveCursorRightWithShift(Event e);

  /// Moves cursor up
  external void moveCursorUp(Event e);

  /// Moves cursor up without shift
  external void moveCursorWithoutShift(num offset);

  /// Moves cursor with shift
  external void moveCursorWithShift(num offset);

  /// Composition end
  external void onCompositionEnd();

  /// Composition start
  external void onCompositionStart();

  /// Handles onInput event
  external void onInput(Event e);

  /// Handles keyup event
  external void onKeyDown(Event e);

  /// Handles keyup event
  /// We handle KeyUp because ie11 and edge have difficulties copy/pasting
  /// if a copy/cut event fired, keyup is dismissed
  external void onKeyUp(Event e);

  /// Pastes text
  external void paste();

  /// Removes characters from start/end
  /// start/end ar per grapheme position in _text array.
  external void removeChars(num start, num end);

  /// Changes cursor location in a text depending on passed pointer (x/y) object
  external void setCursorByClick(Event e);
  external num JS$_getNewSelectionStartFromOffset(
      dynamic /*{ x: number; y: number }*/ mouseOffset,
      num prevWidth,
      num width,
      num index,
      num jlen);
  external void JS$_render(CanvasRenderingContext2D ctx);
  external void JS$_updateTextarea();
  external void updateFromTextArea();

  /// Default event handler for the basic functionalities needed on _mouseDown
  /// can be overridden to do something different.
  /// Scope of this implementation is: find the click position, set selectionStart
  /// find selectionEnd, initialize the drawing of either cursor or selection area
  external void JS$_mouseDownHandler(dynamic options);
  external dynamic /*{ left: string; top: string; fontSize: string; charHeight: number }*/
      JS$_calcTextareaPosition();
}

@anonymous
@JS()
abstract class ITextboxOptions implements ITextOptions {
  /// Minimum width of textbox, in pixels.
  external dynamic /*num|dynamic*/ get minWidth;
  external set minWidth(dynamic /*num|dynamic*/ v);

  /// Minimum calculated width of a textbox, in pixels.
  /// fixed to 2 so that an empty textbox cannot go to 0
  /// and is still selectable without text.
  external dynamic /*num|dynamic*/ get dynamicMinWidth;
  external set dynamicMinWidth(dynamic /*num|dynamic*/ v);

  /// Override standard Object class values

  external dynamic /*bool|dynamic*/ get lockScalingFlip;

  external set lockScalingFlip(dynamic /*bool|dynamic*/ v);

  /// Override standard Object class values
  /// Textbox needs this on false

  external dynamic /*bool|dynamic*/ get noScaleCache;

  external set noScaleCache(dynamic /*bool|dynamic*/ v);

  /// Use this boolean property in order to split strings that have no white space concept.
  /// this is a cheap way to help with chinese/japaense
  /// @since 2.6.0
  external dynamic /*bool|dynamic*/ get splitByGrapheme;
  external set splitByGrapheme(dynamic /*bool|dynamic*/ v);

  /// Is the text wrapping
  external dynamic /*bool|dynamic*/ get isWrapping;
  external set isWrapping(dynamic /*bool|dynamic*/ v);
  external factory ITextboxOptions(
      {dynamic /*num|dynamic*/ minWidth,
      dynamic /*num|dynamic*/ dynamicMinWidth,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ splitByGrapheme,
      dynamic /*bool|dynamic*/ isWrapping,
      dynamic /*num|dynamic*/ selectionStart,
      dynamic /*num|dynamic*/ selectionEnd,
      dynamic /*String|dynamic*/ selectionColor,
      dynamic /*bool|dynamic*/ selected,
      dynamic /*bool|dynamic*/ isEditing,
      dynamic /*bool|dynamic*/ editable,
      dynamic /*String|dynamic*/ editingBorderColor,
      dynamic /*num|dynamic*/ cursorWidth,
      dynamic /*String|dynamic*/ cursorColor,
      dynamic /*num|dynamic*/ cursorDelay,
      dynamic /*num|dynamic*/ cursorDuration,
      dynamic /*bool|dynamic*/ caching,
      dynamic /*bool|dynamic*/ inCompositionMode,
      dynamic /*String|dynamic*/ path,
      dynamic /*bool|dynamic*/ useNative,
      dynamic ctrlKeysMapDown,
      dynamic ctrlKeysMapUp,
      dynamic keysMap,
      dynamic /*HTMLTextAreaElement|dynamic*/ hiddenTextarea,
      dynamic /*String|dynamic*/ type,
      dynamic /*num|dynamic*/ fontSize,
      dynamic /*String|num|dynamic*/ fontWeight,
      dynamic /*String|dynamic*/ fontFamily,
      dynamic /*bool|dynamic*/ underline,
      dynamic /*bool|dynamic*/ overline,
      dynamic /*bool|dynamic*/ linethrough,
      dynamic /*String|dynamic*/ textAlign,
      dynamic /*''|'normal'|'italic'|'oblique'|dynamic*/ fontStyle,
      dynamic /*num|dynamic*/ lineHeight,
      dynamic /*{ size: number; baseline: number }|dynamic*/ superscript,
      dynamic /*{ size: number; baseline: number }|dynamic*/ subscript,
      dynamic /*String|dynamic*/ textBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ charSpacing,
      dynamic styles,
      dynamic /*num|dynamic*/ deltaY,
      dynamic /*'ltr'|'rtl'|dynamic*/ direction,
      dynamic /*String|dynamic*/ text,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@anonymous
@JS()
abstract class Textbox implements ITextboxOptions {
  /// Constructor
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Textbox(String text, [ITextboxOptions options]);*/
  /// Returns true if object has a style property or has it ina specified line
  external bool styleHas(String property, num lineIndex);

  /// Returns true if object has no styling or no styling in a line
  external bool isEmptyStyles(num lineIndex);

  /// Detect if the text line is ended with an hard break
  /// text and itext do not have wrapping, return false
  external bool isEndOfWrapping(num lineIndex);

  /// Returns larger of min width and dynamic min width
  external num getMinWidth();

  /// Use this regular expression to split strings in breakable lines
  external RegExp get JS$_wordJoiners;
  external set JS$_wordJoiners(RegExp v);

  /// Helper function to measure a string of text, given its lineIndex and charIndex offset
  /// it gets called when charBounds are not available yet.
  external num JS$_measureWord(
      List<String> word, num lineIndex, num charOffset);

  /// Wraps text using the 'width' property of Textbox. First this function
  /// splits text on newlines, so we preserve newlines entered by the user.
  /// Then it wraps each line using the width of the Textbox by calling
  /// _wrapLine().
  external List<List<String>> JS$_wrapText(
      List<String> lines, num desiredWidth);

  /// Style objects for each line
  /// Generate an object that translates the style object so that it is
  /// broken up by visual lines (new lines and automatic wrapping).
  /// The original text styles object is broken up by actual lines (new lines only),
  /// which is only sufficient for Text / IText
  /// Line style { line: number, offset: number }
  external dynamic /*JSMap of <num,{ line: number; offset: number }>|dynamic*/
      get JS$_styleMap;
  external set JS$_styleMap(
      dynamic /*JSMap of <num,{ line: number; offset: number }>|dynamic*/ v);

  /// Returns fabric.Textbox instance from an object representation
  /// @static
  external static Textbox fromObject(dynamic object, [Function callback]);
}

@anonymous
@JS()
abstract class ITriangleOptions implements IObjectOptions {
  external factory ITriangleOptions(
      {dynamic /*String|dynamic*/ type,
      dynamic /*String|dynamic*/ originX,
      dynamic /*String|dynamic*/ originY,
      dynamic /*num|dynamic*/ top,
      dynamic /*num|dynamic*/ left,
      dynamic /*num|dynamic*/ width,
      dynamic /*num|dynamic*/ height,
      dynamic /*num|dynamic*/ scaleX,
      dynamic /*num|dynamic*/ scaleY,
      dynamic /*bool|dynamic*/ flipX,
      dynamic /*bool|dynamic*/ flipY,
      dynamic /*num|dynamic*/ opacity,
      dynamic /*num|dynamic*/ angle,
      dynamic /*num|dynamic*/ skewX,
      dynamic /*num|dynamic*/ skewY,
      dynamic /*num|dynamic*/ cornerSize,
      dynamic /*bool|dynamic*/ transparentCorners,
      dynamic /*String|dynamic*/ hoverCursor,
      dynamic /*String|dynamic*/ moveCursor,
      dynamic /*num|dynamic*/ padding,
      dynamic /*String|dynamic*/ borderColor,
      dynamic /*List<num>|dynamic*/ borderDashArray,
      dynamic /*String|dynamic*/ cornerColor,
      dynamic /*String|dynamic*/ cornerStrokeColor,
      dynamic /*'rect'|'circle'|dynamic*/ cornerStyle,
      dynamic /*List<num>|dynamic*/ cornerDashArray,
      dynamic /*bool|dynamic*/ centeredScaling,
      dynamic /*bool|dynamic*/ centeredRotation,
      dynamic /*String|Pattern|Gradient|dynamic*/ fill,
      dynamic /*String|dynamic*/ fillRule,
      dynamic /*String|dynamic*/ globalCompositeOperation,
      dynamic /*String|dynamic*/ backgroundColor,
      dynamic /*String|dynamic*/ selectionBackgroundColor,
      dynamic /*String|dynamic*/ stroke,
      dynamic /*num|dynamic*/ strokeWidth,
      dynamic /*List<num>|dynamic*/ strokeDashArray,
      dynamic /*num|dynamic*/ strokeDashOffset,
      dynamic /*String|dynamic*/ strokeLineCap,
      dynamic /*String|dynamic*/ strokeLineJoin,
      dynamic /*num|dynamic*/ strokeMiterLimit,
      dynamic /*Shadow|String|dynamic*/ shadow,
      dynamic /*num|dynamic*/ borderOpacityWhenMoving,
      dynamic /*num|dynamic*/ borderScaleFactor,
      dynamic /*num|dynamic*/ minScaleLimit,
      dynamic /*bool|dynamic*/ selectable,
      dynamic /*bool|dynamic*/ evented,
      dynamic /*bool|dynamic*/ visible,
      dynamic /*bool|dynamic*/ hasControls,
      dynamic /*bool|dynamic*/ hasBorders,
      dynamic /*bool|dynamic*/ hasRotatingPoint,
      dynamic /*num|dynamic*/ rotatingPointOffset,
      dynamic /*bool|dynamic*/ perPixelTargetFind,
      dynamic /*bool|dynamic*/ includeDefaultValues,
      dynamic /*bool|dynamic*/ lockMovementX,
      dynamic /*bool|dynamic*/ lockMovementY,
      dynamic /*bool|dynamic*/ lockRotation,
      dynamic /*bool|dynamic*/ lockScalingX,
      dynamic /*bool|dynamic*/ lockScalingY,
      dynamic /*bool|dynamic*/ lockUniScaling,
      dynamic /*bool|dynamic*/ lockSkewingX,
      dynamic /*bool|dynamic*/ lockSkewingY,
      dynamic /*bool|dynamic*/ lockScalingFlip,
      dynamic /*bool|dynamic*/ excludeFromExport,
      dynamic /*bool|dynamic*/ objectCaching,
      dynamic /*bool|dynamic*/ statefullCache,
      dynamic /*bool|dynamic*/ noScaleCache,
      dynamic /*bool|dynamic*/ strokeUniform,
      dynamic /*bool|dynamic*/ dirty,
      dynamic /*String|dynamic*/ paintFirst,
      dynamic /*List<String>|dynamic*/ stateProperties,
      dynamic /*List<String>|dynamic*/ cacheProperties,
      dynamic /*Object|dynamic*/ clipPath,
      dynamic /*bool|dynamic*/ inverted,
      dynamic /*bool|dynamic*/ absolutePositioned,
      dynamic /*String|dynamic*/ name,
      dynamic data,
      dynamic /*{ tl: Point; mt: Point; tr: Point; ml: Point; mr: Point; bl: Point; mb: Point; br: Point; mtr: Point }|dynamic*/
          oCoords,
      dynamic /*{ bl: Point; br: Point; tl: Point; tr: Point }|dynamic*/
          aCoords,
      dynamic matrixCache,
      dynamic ownMatrixCache,
      dynamic /*num|dynamic*/ snapAngle,
      dynamic /*Null|num|dynamic*/ snapThreshold,
      dynamic /*Group|dynamic*/ group,
      dynamic /*Canvas|dynamic*/ canvas});
}

@JS()
abstract class Triangle extends FabricObject {
  // @Ignore
  //Triangle.fakeConstructor$() : super.fakeConstructor$();

  /// Constructor
  external factory Triangle([ITriangleOptions options]);

  /// Returns SVG representation of an instance

  external String toSVG([Function reviver]);

  /// Returns Triangle instance from an object representation
  external static Triangle fromObject(dynamic object);
}

/// /////////////////////////////////////////////////////////
/// Filters
/// /////////////////////////////////////////////////////////
@anonymous
@JS()
abstract class IAllFilters {
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IBaseFilter;
    }*/
      get BaseFilter;
  external set BaseFilter(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IBaseFilter;
    }*/
          v);
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { color?: string | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendColorFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendColorFilter;
    }*/
      get BlendColor;
  external set BlendColor(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { color?: string | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendColorFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendColorFilter;
    }*/
          v);
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { image?: Image | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendImageFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendImageFilter;
    }*/
      get BlendImage;
  external set BlendImage(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { image?: Image | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendImageFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendImageFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: { blur?: number | undefined }): IBlurFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlurFilter;
    }*/
      get Blur;
  external set Blur(
      dynamic
          /*{
        new(options?: { blur?: number | undefined }): IBlurFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlurFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /**
             * Value to brighten the image up (0..255)
             * @default 0
             */
            brightness: number;
        }): IBrightnessFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBrightnessFilter;
    }*/
      get Brightness;
  external set Brightness(
      dynamic
          /*{
        new(options?: {
            /**
             * Value to brighten the image up (0..255)
             * @default 0
             */
            brightness: number;
        }): IBrightnessFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBrightnessFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IColorMatrix;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IColorMatrix;
    }*/
      get ColorMatrix;
  external set ColorMatrix(
      dynamic
          /*{
        new(options?: {
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IColorMatrix;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IColorMatrix;
    }*/
          v);
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { contrast?: number | undefined }): IContrastFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IContrastFilter;
    }*/
      get Contrast;
  external set Contrast(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { contrast?: number | undefined }): IContrastFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IContrastFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            opaque?: boolean | undefined;
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IConvoluteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IConvoluteFilter;
    }*/
      get Convolute;
  external set Convolute(
      dynamic
          /*{
        new(options?: {
            opaque?: boolean | undefined;
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IConvoluteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IConvoluteFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /** @default 100 */
            threshold?: number | undefined;
        }): IGradientTransparencyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGradientTransparencyFilter;
    }*/
      get GradientTransparency;
  external set GradientTransparency(
      dynamic
          /*{
        new(options?: {
            /** @default 100 */
            threshold?: number | undefined;
        }): IGradientTransparencyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGradientTransparencyFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: any): IGrayscaleFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGrayscaleFilter;
    }*/
      get Grayscale;
  external set Grayscale(
      dynamic
          /*{
        new(options?: any): IGrayscaleFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGrayscaleFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: { rotation?: number | undefined }): IHueRotationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IHueRotationFilter;
    }*/
      get HueRotation;
  external set HueRotation(
      dynamic
          /*{
        new(options?: { rotation?: number | undefined }): IHueRotationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IHueRotationFilter;
    }*/
          v);
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IInvertFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IInvertFilter;
    }*/
      get Invert;
  external set Invert(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IInvertFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IInvertFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /** Mask image object */
            mask?: Image | undefined;
            /**
             * Rgb channel (0, 1, 2 or 3)
             * @default 0
             */
            channel: number;
        }): IMaskFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMaskFilter;
    }*/
      get Mask;
  external set Mask(
      dynamic
          /*{
        new(options?: {
            /** Mask image object */
            mask?: Image | undefined;
            /**
             * Rgb channel (0, 1, 2 or 3)
             * @default 0
             */
            channel: number;
        }): IMaskFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMaskFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /**
             * Color to multiply the image pixels with
             * @default #000000
             */
            color: string;
        }): IMultiplyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMultiplyFilter;
    }*/
      get Multiply;
  external set Multiply(
      dynamic
          /*{
        new(options?: {
            /**
             * Color to multiply the image pixels with
             * @default #000000
             */
            color: string;
        }): IMultiplyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMultiplyFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /** @default 0 */
            noise: number;
        }): INoiseFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): INoiseFilter;
    }*/
      get Noise;
  external set Noise(
      dynamic
          /*{
        new(options?: {
            /** @default 0 */
            noise: number;
        }): INoiseFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): INoiseFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /**
             * Blocksize for pixelate
             * @default 4
             */
            blocksize?: number | undefined;
        }): IPixelateFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IPixelateFilter;
    }*/
      get Pixelate;
  external set Pixelate(
      dynamic
          /*{
        new(options?: {
            /**
             * Blocksize for pixelate
             * @default 4
             */
            blocksize?: number | undefined;
        }): IPixelateFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IPixelateFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /** @default 30 */
            threshold?: number | undefined;
            /** @default 20 */
            distance?: number | undefined;
        }): IRemoveWhiteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IRemoveWhiteFilter;
    }*/
      get RemoveWhite;
  external set RemoveWhite(
      dynamic
          /*{
        new(options?: {
            /** @default 30 */
            threshold?: number | undefined;
            /** @default 20 */
            distance?: number | undefined;
        }): IRemoveWhiteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IRemoveWhiteFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: any): IResizeFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IResizeFilter;
    }*/
      get Resize;
  external set Resize(
      dynamic
          /*{
        new(options?: any): IResizeFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IResizeFilter;
    }*/
          v);
  external dynamic
      /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { saturation?: number | undefined }): ISaturationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISaturationFilter;
    }*/
      get Saturation;
  external set Saturation(
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { saturation?: number | undefined }): ISaturationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISaturationFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: any): ISepia2Filter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepia2Filter;
    }*/
      get Sepia2;
  external set Sepia2(
      dynamic
          /*{
        new(options?: any): ISepia2Filter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepia2Filter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: any): ISepiaFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepiaFilter;
    }*/
      get Sepia;
  external set Sepia(
      dynamic
          /*{
        new(options?: any): ISepiaFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepiaFilter;
    }*/
          v);
  external dynamic
      /*{
        new(options?: {
            /**
             * Color to tint the image with
             * @default #000000
             */
            color?: string | undefined;
            /** Opacity value that controls the tint effect's transparency (0..1) */
            opacity?: number | undefined;
        }): ITintFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ITintFilter;
    }*/
      get Tint;
  external set Tint(
      dynamic
          /*{
        new(options?: {
            /**
             * Color to tint the image with
             * @default #000000
             */
            color?: string | undefined;
            /** Opacity value that controls the tint effect's transparency (0..1) */
            opacity?: number | undefined;
        }): ITintFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ITintFilter;
    }*/
          v);
  external factory IAllFilters(
      {dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IBaseFilter;
    }*/
          BaseFilter,
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { color?: string | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendColorFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendColorFilter;
    }*/
          BlendColor,
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(
            options?: { image?: Image | undefined; mode?: string | undefined; alpha?: number | undefined },
        ): IBlendImageFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlendImageFilter;
    }*/
          BlendImage,
      dynamic
          /*{
        new(options?: { blur?: number | undefined }): IBlurFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBlurFilter;
    }*/
          Blur,
      dynamic
          /*{
        new(options?: {
            /**
             * Value to brighten the image up (0..255)
             * @default 0
             */
            brightness: number;
        }): IBrightnessFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IBrightnessFilter;
    }*/
          Brightness,
      dynamic
          /*{
        new(options?: {
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IColorMatrix;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IColorMatrix;
    }*/
          ColorMatrix,
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { contrast?: number | undefined }): IContrastFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IContrastFilter;
    }*/
          Contrast,
      dynamic
          /*{
        new(options?: {
            opaque?: boolean | undefined;
            /** Filter matrix */
            matrix?: number[] | undefined;
        }): IConvoluteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IConvoluteFilter;
    }*/
          Convolute,
      dynamic
          /*{
        new(options?: {
            /** @default 100 */
            threshold?: number | undefined;
        }): IGradientTransparencyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGradientTransparencyFilter;
    }*/
          GradientTransparency,
      dynamic
          /*{
        new(options?: any): IGrayscaleFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IGrayscaleFilter;
    }*/
          Grayscale,
      dynamic
          /*{
        new(options?: { rotation?: number | undefined }): IHueRotationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IHueRotationFilter;
    }*/
          HueRotation,
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: any): IInvertFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IInvertFilter;
    }*/
          Invert,
      dynamic
          /*{
        new(options?: {
            /** Mask image object */
            mask?: Image | undefined;
            /**
             * Rgb channel (0, 1, 2 or 3)
             * @default 0
             */
            channel: number;
        }): IMaskFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMaskFilter;
    }*/
          Mask,
      dynamic
          /*{
        new(options?: {
            /**
             * Color to multiply the image pixels with
             * @default #000000
             */
            color: string;
        }): IMultiplyFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IMultiplyFilter;
    }*/
          Multiply,
      dynamic
          /*{
        new(options?: {
            /** @default 0 */
            noise: number;
        }): INoiseFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): INoiseFilter;
    }*/
          Noise,
      dynamic
          /*{
        new(options?: {
            /**
             * Blocksize for pixelate
             * @default 4
             */
            blocksize?: number | undefined;
        }): IPixelateFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IPixelateFilter;
    }*/
          Pixelate,
      dynamic
          /*{
        new(options?: {
            /** @default 30 */
            threshold?: number | undefined;
            /** @default 20 */
            distance?: number | undefined;
        }): IRemoveWhiteFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IRemoveWhiteFilter;
    }*/
          RemoveWhite,
      dynamic
          /*{
        new(options?: any): IResizeFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): IResizeFilter;
    }*/
          Resize,
      dynamic
          /*{
        /**
         * Constructor
         * @param [options] Options object
         */
        new(options?: { saturation?: number | undefined }): ISaturationFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISaturationFilter;
    }*/
          Saturation,
      dynamic
          /*{
        new(options?: any): ISepia2Filter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepia2Filter;
    }*/
          Sepia2,
      dynamic
          /*{
        new(options?: any): ISepiaFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ISepiaFilter;
    }*/
          Sepia,
      dynamic
          /*{
        new(options?: {
            /**
             * Color to tint the image with
             * @default #000000
             */
            color?: string | undefined;
            /** Opacity value that controls the tint effect's transparency (0..1) */
            opacity?: number | undefined;
        }): ITintFilter;
        /**
         * Returns filter instance from an object representation
         * @param object Object to create an instance from
         */
        fromObject(object: any): ITintFilter;
    }*/
          Tint});
}

@anonymous
@JS()
abstract class IBaseFilter {
  /// Sets filter's properties from options
  external void setOptions([dynamic options]);

  /// Returns object representation of an instance
  external dynamic toObject();

  /// Returns a JSON representation of an instance
  external dynamic /*{ version: string; objects: Object[] }*/ toJSON();

  /// Apply the operation to a Uint8Array representing the pixels of an image.
  external void applyTo2d(dynamic options);
}

@anonymous
@JS()
abstract class IBlendColorFilter implements IBaseFilter {
  external dynamic /*String|dynamic*/ get color;
  external set color(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get mode;
  external set mode(dynamic /*String|dynamic*/ v);
  external dynamic /*num|dynamic*/ get alpha;
  external set alpha(dynamic /*num|dynamic*/ v);

  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IBlendImageFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IBlurFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IBrightnessFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IColorMatrix implements IBaseFilter {
  external dynamic /*List<num>|dynamic*/ get matrix;
  external set matrix(dynamic /*List<num>|dynamic*/ v);

  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IContrastFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IConvoluteFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IGradientTransparencyFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IGrayscaleFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IHueRotationFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IInvertFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IMaskFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IMultiplyFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class INoiseFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IPixelateFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IRemoveWhiteFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class IResizeFilter implements IBaseFilter {
  /// Resize type
  external String get resizeType;
  external set resizeType(String v);

  /// Scale factor for resizing, x axis
  external num get scaleX;
  external set scaleX(num v);

  /// Scale factor for resizing, y axis
  external num get scaleY;
  external set scaleY(num v);

  /// LanczosLobes parameter for lanczos filter
  external num get lanczosLobes;
  external set lanczosLobes(num v);

  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class ISaturationFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class ISepiaFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class ISepia2Filter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

@anonymous
@JS()
abstract class ITintFilter implements IBaseFilter {
  /// Applies filter to canvas element
  external void applyTo(HTMLCanvasElement canvasEl);
}

/// /////////////////////////////////////////////////////////
/// Brushes
/// /////////////////////////////////////////////////////////
@JS()
class BaseBrush {
  // @Ignore
  //BaseBrush.fakeConstructor$();

  /// Color of a brush
  external String get color;
  external set color(String v);

  /// Width of a brush
  external num get width;
  external set width(num v);

  /// Discard points that are less than `decimate` pixel distant from each other
  external num get decimate;
  external set decimate(num v);

  /// Shadow object representing shadow of this shape.
  /// <b>Backwards incompatibility note:</b> This property replaces "shadowColor" (String), "shadowOffsetX" (Number),
  /// "shadowOffsetY" (Number) and "shadowBlur" (Number) since v1.2.12
  external dynamic /*Shadow|String*/ get shadow;
  external set shadow(dynamic /*Shadow|String*/ v);

  /// Line endings style of a brush (one of "butt", "round", "square")
  external String get strokeLineCap;
  external set strokeLineCap(String v);

  /// Corner style of a brush (one of "bevil", "round", "miter")
  external String get strokeLineJoin;
  external set strokeLineJoin(String v);

  /// Stroke Dash Array.
  external List<dynamic> get strokeDashArray;
  external set strokeDashArray(List<dynamic> v);
}

@JS()
class CircleBrush extends BaseBrush {
  // @Ignore
// CircleBrush.fakeConstructor$() : super.fakeConstructor$();

  /// Width of a brush

  external num get width;

  external set width(num v);

  /// Invoked inside on mouse down and mouse move
  external void drawDot(dynamic pointer);
  external Point addPoint(dynamic pointer);
}

@JS()
class SprayBrush extends BaseBrush {
  // @Ignore
  // SprayBrush.fakeConstructor$() : super.fakeConstructor$();

  /// Width of a brush

  external num get width;

  external set width(num v);

  /// Density of a spray (number of dots per chunk)
  external num get density;
  external set density(num v);

  /// Width of spray dots
  external num get dotWidth;
  external set dotWidth(num v);

  /// Width variance of spray dots
  external num get dotWidthVariance;
  external set dotWidthVariance(num v);

  /// Whether opacity of a dot should be random
  external bool get randomOpacity;
  external set randomOpacity(bool v);

  /// Whether overlapping dots (rectangles) should be removed (for performance reasons)
  external bool get optimizeOverlapping;
  external set optimizeOverlapping(bool v);
  external void addSprayChunk(dynamic pointer);
}

@JS()
class PatternBrush extends PencilBrush {
  // @Ignore
  //PatternBrush.fakeConstructor$() : super.fakeConstructor$();
  external factory PatternBrush(Canvas canvas);

  external HTMLCanvasElement getPatternSrc();
  external String getPatternSrcFunction();

  /// Creates "pattern" instance property
  external dynamic getPattern();

  /// Creates path

  external Path createPath(String pathData);
}

@JS()
class PencilBrush extends BaseBrush {
  // @Ignore
  //PencilBrush.fakeConstructor$() : super.fakeConstructor$();

  /// Constructor
  external factory PencilBrush(Canvas canvas);

  /// Constructor
  external PencilBrush initialize(Canvas canvas);

  /// Converts points to SVG path
  external List<String> convertPointsToSVGPath(
      List<dynamic /*{ x: number; y: number }*/ > points,
      [num minX,
      num minY]);

  /// Creates fabric.Path object to add on canvas
  external Path createPath(String pathData);
}

/// ////////////////////////////////////////////////////////////////////////////
/// Fabric util Interface
/// ///////////////////////////////////////////////////////////////////////////
@anonymous
@JS()
abstract class IUtilAnimationOptions {
  /// Starting value
  external dynamic /*num|dynamic*/ get startValue;
  external set startValue(dynamic /*num|dynamic*/ v);

  /// Ending value
  external dynamic /*num|dynamic*/ get endValue;
  external set endValue(dynamic /*num|dynamic*/ v);

  /// Value to modify the property by
  external dynamic /*num|dynamic*/ get byValue;
  external set byValue(dynamic /*num|dynamic*/ v);

  /// Duration of change (in ms)
  external dynamic /*num|dynamic*/ get duration;
  external set duration(dynamic /*num|dynamic*/ v);

  /// Callback; invoked on every value change
  external dynamic /*void Function(num)|dynamic*/ get onChange;
  external set onChange(dynamic /*void Function(num)|dynamic*/ v);

  /// Callback; invoked when value change is completed
  external dynamic /*Function|dynamic*/ get onComplete;
  external set onComplete(dynamic /*Function|dynamic*/ v);

  /// Easing function
  external dynamic /*Function|dynamic*/ get easing;
  external set easing(dynamic /*Function|dynamic*/ v);
  external factory IUtilAnimationOptions(
      {dynamic /*num|dynamic*/ startValue,
      dynamic /*num|dynamic*/ endValue,
      dynamic /*num|dynamic*/ byValue,
      dynamic /*num|dynamic*/ duration,
      dynamic /*void Function(num)|dynamic*/ onChange,
      dynamic /*Function|dynamic*/ onComplete,
      dynamic /*Function|dynamic*/ easing});
}

@anonymous
@JS()
abstract class IUtilAnimation {
  /// Changes value from one to another within certain period of time, invoking callbacks as value is being changed.
  external void animate([IUtilAnimationOptions options]);

  /// requestAnimationFrame polyfill based on http://paulirish.com/2011/requestanimationframe-for-smart-animating/
  /// In order to get a precise start time, `requestAnimFrame` should be called as an entry into the method
  external num requestAnimFrame(Function callback);
  external void cancelAnimFrame(num id);
}

typedef IUtilAminEaseFunction = num Function(num t, num b, num c, num d);

@anonymous
@JS()
abstract class IUtilAnimEase {
  external IUtilAminEaseFunction get easeInBack;
  external set easeInBack(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInBounce;
  external set easeInBounce(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInCirc;
  external set easeInCirc(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInCubic;
  external set easeInCubic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInElastic;
  external set easeInElastic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInExpo;
  external set easeInExpo(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutBack;
  external set easeInOutBack(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutBounce;
  external set easeInOutBounce(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutCirc;
  external set easeInOutCirc(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutCubic;
  external set easeInOutCubic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutElastic;
  external set easeInOutElastic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutExpo;
  external set easeInOutExpo(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutQuad;
  external set easeInOutQuad(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutQuart;
  external set easeInOutQuart(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutQuint;
  external set easeInOutQuint(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInOutSine;
  external set easeInOutSine(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInQuad;
  external set easeInQuad(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInQuart;
  external set easeInQuart(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInQuint;
  external set easeInQuint(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeInSine;
  external set easeInSine(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutBack;
  external set easeOutBack(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutBounce;
  external set easeOutBounce(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutCirc;
  external set easeOutCirc(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutCubic;
  external set easeOutCubic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutElastic;
  external set easeOutElastic(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutExpo;
  external set easeOutExpo(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutQuad;
  external set easeOutQuad(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutQuart;
  external set easeOutQuart(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutQuint;
  external set easeOutQuint(IUtilAminEaseFunction v);
  external IUtilAminEaseFunction get easeOutSine;
  external set easeOutSine(IUtilAminEaseFunction v);
  external factory IUtilAnimEase(
      {IUtilAminEaseFunction easeInBack,
      IUtilAminEaseFunction easeInBounce,
      IUtilAminEaseFunction easeInCirc,
      IUtilAminEaseFunction easeInCubic,
      IUtilAminEaseFunction easeInElastic,
      IUtilAminEaseFunction easeInExpo,
      IUtilAminEaseFunction easeInOutBack,
      IUtilAminEaseFunction easeInOutBounce,
      IUtilAminEaseFunction easeInOutCirc,
      IUtilAminEaseFunction easeInOutCubic,
      IUtilAminEaseFunction easeInOutElastic,
      IUtilAminEaseFunction easeInOutExpo,
      IUtilAminEaseFunction easeInOutQuad,
      IUtilAminEaseFunction easeInOutQuart,
      IUtilAminEaseFunction easeInOutQuint,
      IUtilAminEaseFunction easeInOutSine,
      IUtilAminEaseFunction easeInQuad,
      IUtilAminEaseFunction easeInQuart,
      IUtilAminEaseFunction easeInQuint,
      IUtilAminEaseFunction easeInSine,
      IUtilAminEaseFunction easeOutBack,
      IUtilAminEaseFunction easeOutBounce,
      IUtilAminEaseFunction easeOutCirc,
      IUtilAminEaseFunction easeOutCubic,
      IUtilAminEaseFunction easeOutElastic,
      IUtilAminEaseFunction easeOutExpo,
      IUtilAminEaseFunction easeOutQuad,
      IUtilAminEaseFunction easeOutQuart,
      IUtilAminEaseFunction easeOutQuint,
      IUtilAminEaseFunction easeOutSine});
}

@anonymous
@JS()
abstract class IUtilImage {
  external void setImageSmoothing(CanvasRenderingContext2D ctx, dynamic value);
}

@anonymous
@JS()
abstract class IUtilArc {
  /// Draws arc
  external void drawArc(
      CanvasRenderingContext2D ctx, num fx, num fy, List<num> coords);

  /// Calculate bounding box of a elliptic-arc
  external List<Point> getBoundsOfArc(num fx, num fy, num rx, num ry, num rot,
      num large, num sweep, num tx, num ty);

  /// Calculate bounding box of a beziercurve
  external List<Point> getBoundsOfCurve(
      num x0, num y0, num x1, num y1, num x2, num y2, num x3, num y3);
}

@anonymous
@JS()
abstract class IUtilDomEvent {
  /// Cross-browser wrapper for getting event's coordinates
  external Point getPointer(Event event, HTMLCanvasElement upperCanvasEl);

  /// Adds an event listener to an element
  external void addListener(
      HTMLElement element, String eventName, Function handler);

  /// Removes an event listener from an element
  external void removeListener(
      HTMLElement element, String eventName, Function handler);
}

@anonymous
@JS()
abstract class IUtilDomMisc {
  /// Takes id and returns an element with that id (if one exists in a document)
  external HTMLElement getById(dynamic /*String|HTMLElement*/ id);

  /// Converts an array-like object (e.g. arguments or NodeList) to an array
  external List<dynamic> toArray(dynamic arrayLike);

  /// Creates specified element with specified attributes
  external HTMLElement makeElement(String tagName, [dynamic attributes]);

  /// Adds class to an element
  external void addClass(HTMLElement element, String classname);

  /// Wraps element with another element
  external HTMLElement wrapElement(
      HTMLElement element, dynamic /*HTMLElement|String*/ wrapper,
      [dynamic attributes]);

  /// Returns element scroll offsets
  external dynamic /*{ left: number; top: number }*/ getScrollLeftTop(
      HTMLElement element);

  /// Returns offset for a given element
  external dynamic /*{ left: number; top: number }*/ getElementOffset(
      HTMLElement element);

  /// Returns style attribute value of a given element
  external String getElementStyle(HTMLElement elment, String attr);

  /// Inserts a script element with a given url into a document; invokes callback, when that script is finished loading
  external void getScript(String url, Function callback);

  /// Makes element unselectable
  external HTMLElement makeElementUnselectable(HTMLElement element);

  /// Makes element selectable
  external HTMLElement makeElementSelectable(HTMLElement element);
}

@anonymous
@JS()
abstract class IUtilDomRequest {
  /// Cross-browser abstraction for sending XMLHttpRequest
  external XMLHttpRequest request(String url,
      [dynamic
          /*{
            /** @default "GET" */
            method?: string | undefined;
            /** Callback to invoke when request is completed */
            onComplete: Function;
        }*/
          options]);
}

@anonymous
@JS()
abstract class IUtilDomStyle {
  /// Cross-browser wrapper for setting element's style
  external HTMLElement setStyle(HTMLElement element, dynamic styles);
}

@anonymous
@JS()
abstract class IUtilArray {
  /// Invokes method on all items in a given array
  external List<dynamic> invoke(List<dynamic> array, String method);

  /// Finds minimum value in array (not necessarily "first" one)
  external dynamic min(List<dynamic> array, String byProperty);

  /// Finds maximum value in array (not necessarily "first" one)
  external dynamic max(List<dynamic> array, String byProperty);
}

@anonymous
@JS()
abstract class IUtilClass {
  /// Helper for creation of "classes".
  /// (be careful modifying objects defined here as this would affect all instances)
  /*external dynamic createClass(Function parent, [dynamic properties]);*/
  /// Helper for creation of "classes".
  /// (be careful modifying objects defined here as this would affect all instances)
  /*external dynamic createClass([dynamic properties]);*/
  external dynamic createClass(
      [dynamic /*Function|dynamic*/ parent_properties, dynamic properties]);
}

@anonymous
@JS()
abstract class IUtilObject {
  /// Copies all enumerable properties of one object to another
  external dynamic extend(dynamic destination, dynamic source);

  /// Creates an empty object and copies all enumerable properties of another object to it
  external dynamic clone(dynamic object);
}

@anonymous
@JS()
abstract class IUtilString {
  /// Camelizes a string
  external String camelize(String string);

  /// Capitalizes a string
  /// and other letters stay untouched, if false first letter is capitalized
  /// and other letters are converted to lowercase.
  external String capitalize(String string, bool firstLetterOnly);

  /// Escapes XML in a string
  external String escapeXml(String string);

  /// Divide a string in the user perceived single units
  external List<String> graphemeSplit(String string);
}

@anonymous
@JS()
abstract class IUtilMisc {
  /// Removes value from an array.
  /// Presence of value (and its position in an array) is determined via `Array.prototype.indexOf`
  external List<dynamic> removeFromArray(List<dynamic> array, dynamic value);

  /// Returns random number between 2 specified ones.
  external num getRandomInt(num min, num max);

  /// Transforms degrees to radians.
  external num degreesToRadians(num degrees);

  /// Transforms radians to degrees.
  external num radiansToDegrees(num radians);

  /// Rotates `point` around `origin` with `radians`
  external Point rotatePoint(Point point, Point origin, num radians);

  /// Rotates `vector` with `radians`
  external dynamic /*{ x: number; y: number }*/ rotateVector(
      dynamic /*{ x: number; y: number }*/ vector, num radians);

  /// Apply transform t to point p
  external Point transformPoint(Point p, List<dynamic> t, [bool ignoreOffset]);

  /// Invert transformation t
  external List<dynamic> invertTransform(List<dynamic> t);

  /// A wrapper around Number#toFixed, which contrary to native method returns number, not string.
  external num toFixed(num number, num fractionDigits);

  /// Converts from attribute value to pixel value if applicable.
  /// Returns converted pixels or original value not converted.
  external dynamic /*num|String*/ parseUnit(dynamic /*num|String*/ value,
      [num fontSize]);

  /// Function which always returns `false`.
  external bool falseFunction();

  /// Returns klass "Class" object of given namespace
  external dynamic getKlass(String type, String namespace);

  /// Returns object of given namespace
  external dynamic resolveNamespace(String namespace);

  /// Loads image element from given url and passes it to a callback
  external void loadImage(
      String url, void Function(HTMLImageElement image) callback,
      [dynamic context, String crossOrigin]);

  /// Creates corresponding fabric instances from their object representations
  external void enlivenObjects(
      List<dynamic> objects, Function callback, String namespace,
      [Function reviver]);

  /// Groups SVG elements (usually those retrieved from SVG document)
  external dynamic /*Object|Group*/ groupSVGElements(List<dynamic> elements,
      [dynamic options, String path]);

  /// Clear char widths cache for the given font family or all the cache if no
  /// fontFamily is specified.
  /// Use it if you know you are loading fonts in a lazy way and you are not waiting
  /// for custom fonts to load properly when adding text objects to the canvas.
  /// If a text object is added when its own font is not loaded yet, you will get wrong
  /// measurement and so wrong bounding boxes.
  /// After the font cache is cleared, either change the textObject text content or call
  /// initDimensions() to trigger a recalculation
  external void clearFabricFontCache([String fontFamily]);

  /// Populates an object with properties of another object
  external void populateWithProperties(
      dynamic source, dynamic destination, dynamic properties);

  /// Draws a dashed line between two points
  /// This method is used to draw dashed line around selection area.
  external void drawDashedLine(CanvasRenderingContext2D ctx, num x, num y,
      num x2, num y2, List<dynamic> da);

  /// Creates canvas element and initializes it via excanvas if necessary
  /// when not given, element is created implicitly
  external HTMLCanvasElement createCanvasElement([HTMLCanvasElement canvasEl]);

  /// Creates image element (works on client and node)
  external HTMLImageElement createImage();

  /// Creates accessors (getXXX, setXXX) for a "class", based on "stateProperties" array
  external dynamic createAccessors(dynamic klass);
  external void clipContext(FabricObject receiver, CanvasRenderingContext2D ctx);

  /// Multiply matrix A by matrix B to nest transformations
  external List<num> multiplyTransformMatrices(List<num> a, List<num> b);

  /// Decomposes standard 2x2 matrix into transform componentes
  external dynamic
      /*{
        angle: number;
        scaleX: number;
        scaleY: number;
        skewX: number;
        skewY: number;
        translateX: number;
        translateY: number;
    }*/
      qrDecompose(List<num> a);

  /// Extract Object transform values
  external dynamic
      /*{
        scaleX: number;
        scaleY: number;
        skewX: number;
        skewY: number;
        angle: number;
        left: number;
        flipX: boolean;
        flipY: boolean;
        top: number;
    }*/
      saveObjectTransform(FabricObject target);

  /// Returns a transform matrix starting from an object of the same kind of
  /// the one returned from qrDecompose, useful also if you want to calculate some
  /// transformations from an object that is not enlived yet
  /// @static
  external List<num> composeMatrix(
      dynamic
          /*{
        angle: number;
        scaleX: number;
        scaleY: number;
        flipX: boolean;
        flipY: boolean;
        skewX: number;
        skewY: number;
        translateX: number;
        translateY: number;
    }*/
          options);

  /// Returns string representation of function body
  external String getFunctionBody(Function fn);

  /// Returns true if context has transparent pixel
  /// at specified location (taking tolerance into account)
  external bool isTransparent(
      CanvasRenderingContext2D ctx, num x, num y, num tolerance);

  /// reset an object transform state to neutral. Top and left are not accounted for
  /// @static
  external void resetObjectTransform(FabricObject target);
}

@JS()
external IUtil get util;

@anonymous
@JS()
abstract class IUtil
    implements
        IUtilImage,
        IUtilAnimation,
        IUtilArc,
        IObservable<IUtil>,
        IUtilDomEvent,
        IUtilDomMisc,
        IUtilDomRequest,
        IUtilDomStyle,
        IUtilClass,
        IUtilMisc {
  external IUtilAnimEase get ease;
  external set ease(IUtilAnimEase v);
  external IUtilArray get array;
  external set array(IUtilArray v);
  external IUtilObject get object;
  external set object(IUtilObject v);
  external IUtilString get string;
  external set string(IUtilString v);
}

@anonymous
@JS()
abstract class Resources {
  /* Index signature is not yet supported by JavaScript interop. */
}

@anonymous
@JS()
abstract class FilterBackend {
  external Resources get resources;
  external set resources(Resources v);
  external dynamic applyFilters(
      List<IBaseFilter> filters,
      dynamic /*HTMLImageElement|HTMLCanvasElement*/ sourceElement,
      num sourceWidth,
      num sourceHeight,
      HTMLCanvasElement targetCanvas,
      [String cacheKey]);
  external void evictCachesForKey(String cacheKey);
  external void dispose();
  external void clearWebGLCaches();
}

@JS()
external dynamic /*FilterBackend|dynamic*/ get filterBackend;
@JS()
external set filterBackend(dynamic /*FilterBackend|dynamic*/ v);

@anonymous
@JS()
abstract class Canvas2dFilterBackend implements FilterBackend {
  // Constructors on anonymous interfaces are not yet supported.
  /*external factory Canvas2dFilterBackend();*/
}

@anonymous
@JS()
abstract class GPUInfo {
  external String get renderer;
  external set renderer(String v);
  external String get vendor;
  external set vendor(String v);
  external factory GPUInfo({String renderer, String vendor});
}

@anonymous
@JS()
abstract class WebglFilterBackendOptions {
  external num get tileSize;
  external set tileSize(num v);
  external factory WebglFilterBackendOptions({num tileSize});
}

// @anonymous
// @JS()
// abstract class WebglFilterBackend
//     implements FilterBackend, WebglFilterBackendOptions {
//   external void setupGLContext(num width, num height);
//   external void chooseFastestCopyGLTo2DMethod(num width, num height);
//   external void createWebGLCanvas(num width, num height);
//   external dynamic applyFiltersDebug(
//       List<IBaseFilter> filters,
//       dynamic /*HTMLImageElement|HTMLCanvasElement*/ sourceElement,
//       num sourceWidth,
//       num sourceHeight,
//       HTMLCanvasElement targetCanvas,
//       [String cacheKey]);
//   external String glErrorToString(dynamic context, dynamic errorCode);
//   external WebGLTexture createTexture(
//       WebGLRenderingContext gl, num width, num height,
//       [dynamic /*HTMLImageElement|HTMLCanvasElement*/ textureImageSource]);
//   external WebGLTexture getCachedTexture(String uniqueId,
//       dynamic /*HTMLImageElement|HTMLCanvasElement*/ textureImageSource);
//   external void copyGLTo2D(WebGLRenderingContext gl, dynamic pipelineState);
//   external GPUInfo
//       captureGPUInfo(); // Constructors on anonymous interfaces are not yet supported.
//   /*external factory WebglFilterBackend([WebglFilterBackendOptions options]);*/
// }

@JS()
class Control {
  // @Ignore
  //Control.fakeConstructor$();
  external factory Control([Control /*Partial<Control>*/ options]);

  /// keep track of control visibility.
  /// mainly for backward compatibility.
  /// if you do not want to see a control, you can remove it
  /// from the controlset.
  /// @default true
  external bool get visible;
  external set visible(bool v);

  /// Name of the action that the control will likely execute.
  /// This is optional. FabricJS uses to identify what the user is doing for some
  /// extra optimizations. If you are writing a custom control and you want to know
  /// somewhere else in the code what is going on, you can use this string here.
  /// you can also provide a custom getActionName if your control run multiple actions
  /// depending on some external state.
  /// default to scale since is the most common, used on 4 corners by default
  /// @default 'scale'
  external String get actionName;
  external set actionName(String v);

  /// Drawing angle of the control.
  /// NOT used for now, but name marked as needed for internal logic
  /// example: to reuse the same drawing function for different rotated controls
  /// @default 0
  external num get angle;
  external set angle(num v);

  /// Relative position of the control. X
  /// 0,0 is the center of the Object, while -0.5 (left) or 0.5 (right) are the extremities
  /// of the bounding box.
  /// @default 0
  external num get x;
  external set x(num v);

  /// Relative position of the control. Y
  /// 0,0 is the center of the Object, while -0.5 (top) or 0.5 (bottom) are the extremities
  /// of the bounding box.
  /// @default 0
  external num get y;
  external set y(num v);

  /// Horizontal offset of the control from the defined position. In pixels
  /// Positive offset moves the control to the right, negative to the left.
  /// It used when you want to have position of control that does not scale with
  /// the bounding box. Example: rotation control is placed at x:0, y: 0.5 on
  /// the boundindbox, with an offset of 30 pixels vertically. Those 30 pixels will
  /// stay 30 pixels no matter how the object is big. Another example is having 2
  /// controls in the corner, that stay in the same position when the object scale.
  /// of the bounding box.
  /// @default 0
  external num get offsetX;
  external set offsetX(num v);

  /// Vertical offset of the control from the defined position. In pixels
  /// Positive offset moves the control to the bottom, negative to the top.
  /// @default 0
  external num get offsetY;
  external set offsetY(num v);

  /// Sets the length of the control. If null, defaults to object's cornerSize.
  /// Expects both sizeX and sizeY to be set when set.
  external dynamic /*num|dynamic*/ get sizeX;
  external set sizeX(dynamic /*num|dynamic*/ v);

  /// Sets the height of the control. If null, defaults to object's cornerSize.
  /// Expects both sizeX and sizeY to be set when set.
  external dynamic /*num|dynamic*/ get sizeY;
  external set sizeY(dynamic /*num|dynamic*/ v);

  /// Sets the length of the touch area of the control. If null, defaults to object's touchCornerSize.
  /// Expects both touchSizeX and touchSizeY to be set when set.
  /// @default null
  external dynamic /*num|dynamic*/ get touchSizeX;
  external set touchSizeX(dynamic /*num|dynamic*/ v);

  /// Sets the height of the touch area of the control. If null, defaults to object's touchCornerSize.
  /// Expects both touchSizeX and touchSizeY to be set when set.
  /// @default null
  external dynamic /*num|dynamic*/ get touchSizeY;
  external set touchSizeY(dynamic /*num|dynamic*/ v);

  /// Css cursor style to display when the control is hovered.
  /// if the method `cursorStyleHandler` is provided, this property is ignored.
  /// @default 'crosshair'
  external String get cursorStyle;
  external set cursorStyle(String v);

  /// If controls has an offsetY or offsetX, draw a line that connects
  /// the control to the bounding box
  /// @default false
  external bool get withConnection;
  external set withConnection(bool v);

  /// The control actionHandler, provide one to handle action ( control being moved )
  external bool actionHandler(
      MouseEvent eventData, Transform transformData, num x, num y);

  /// The control handler for mouse down, provide one to handle mouse down on control
  external bool mouseDownHandler(
      MouseEvent eventData, Transform transformData, num x, num y);

  /// The control mouseUpHandler, provide one to handle an effect on mouse up.
  external bool mouseUpHandler(
      MouseEvent eventData, Transform transformData, num x, num y);

  /// Returns control actionHandler
  external ControlMouseEventHandler getActionHandler(
      MouseEvent eventData, FabricObject fabricObject, Control control);

  /// Returns control mouseDown handler
  external ControlMouseEventHandler getMouseDownHandler(
      MouseEvent eventData, FabricObject fabricObject, Control control);

  /// Returns control mouseUp handler
  external ControlMouseEventHandler getMouseUpHandler(
      MouseEvent eventData, FabricObject fabricObject, Control control);

  /// Returns control cursorStyle for css using cursorStyle. If you need a more elaborate
  /// function you can pass one in the constructor
  /// the cursorStyle property
  external String cursorStyleHandler(
      MouseEvent eventData, Control control, FabricObject fabricObject);

  /// Returns the action name. The basic implementation just return the actionName property.
  external String getActionName(
      MouseEvent eventData, Control control, FabricObject fabricObject);

  /// Returns controls visibility
  external bool getVisibility(FabricObject fabricObject, String controlKey);

  /// Sets controls visibility
  external void setVisibility(bool visibility);
  external Point positionHandler(dynamic /*{ x: number; y: number }*/ dim,
      dynamic finalMatrix, FabricObject fabricObject, Control currentControl);

  /// Returns the coords for this control based on object values.
  external void calcCornerCoords(num objectAngle, num objectCornerSize,
      num centerX, num centerY, bool isTouch);

  /// Render function for the control.
  /// When this function runs the context is unscaled. unrotate. Just retina scaled.
  /// all the functions will have to translate to the point left,top before starting Drawing
  /// if they want to draw a control where the position is detected.
  /// left and top are the result of the positionHandler function
  external void render(CanvasRenderingContext2D ctx, num left, num top,
      dynamic styleOverride, FabricObject fabricObject);
}

typedef ControlMouseEventHandler = bool Function(
    MouseEvent eventData, Transform transformData, num x, num y);

@anonymous
@JS()
abstract class Transform {
  external FabricObject get target;
  external set target(FabricObject v);
  external String get action;
  external set action(String v);
  external ControlMouseEventHandler get actionHandler;
  external set actionHandler(ControlMouseEventHandler v);
  external bool get altKey;
  external set altKey(bool v);
  external String get corner;
  external set corner(String v);
  external num get ex;
  external set ex(num v);
  external num get ey;
  external set ey(num v);
  external num get lastX;
  external set lastX(num v);
  external num get lastY;
  external set lastY(num v);
  external num get offsetX;
  external set offsetX(num v);
  external num get offsetY;
  external set offsetY(num v);
  external String /*'left'|'right'*/ get originX;
  external set originX(String /*'left'|'right'*/ v);
  external String /*'top'|'bottom'*/ get originY;
  external set originY(String /*'top'|'bottom'*/ v);
  external dynamic
      /*{
        angle: number;
        fill: string;
        flipX: boolean;
        flipY: boolean;
        height: number;
        left: number;
        originX: "left" | "right";
        originY: "top" | "bottom";
        scaleX: number;
        scaleY: number;
        skewX: number;
        skewY: number;
        top: number;
        width: number;
    }*/
      get original;
  external set original(
      dynamic
          /*{
        angle: number;
        fill: string;
        flipX: boolean;
        flipY: boolean;
        height: number;
        left: number;
        originX: "left" | "right";
        originY: "top" | "bottom";
        scaleX: number;
        scaleY: number;
        skewX: number;
        skewY: number;
        top: number;
        width: number;
    }*/
          v);
  external num get scaleX;
  external set scaleX(num v);
  external num get scaleY;
  external set scaleY(num v);
  external bool get shiftKey;
  external set shiftKey(bool v);
  external num get skewX;
  external set skewX(num v);
  external num get skewY;
  external set skewY(num v);
  external num get theta;
  external set theta(num v);
  external num get width;
  external set width(num v);
  external factory Transform(
      {FabricObject target,
      String action,
      ControlMouseEventHandler actionHandler,
      bool altKey,
      String corner,
      num ex,
      num ey,
      num lastX,
      num lastY,
      num offsetX,
      num offsetY,
      String /*'left'|'right'*/ originX,
      String /*'top'|'bottom'*/ originY,
      dynamic
          /*{
        angle: number;
        fill: string;
        flipX: boolean;
        flipY: boolean;
        height: number;
        left: number;
        originX: "left" | "right";
        originY: "top" | "bottom";
        scaleX: number;
        scaleY: number;
        skewX: number;
        skewY: number;
        top: number;
        width: number;
    }*/
          original,
      num scaleX,
      num scaleY,
      bool shiftKey,
      num skewX,
      num skewY,
      num theta,
      num width});
}
