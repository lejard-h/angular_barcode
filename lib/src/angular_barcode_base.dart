// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:angular2/core.dart';
import 'package:dart_barcode/dart_barcode.dart';

const List<String> _inputs = const [
  "value",
  "format",
  "displayValue",
  "fontOptions",
  "width",
  "height",
  "fontSize",
  "font",
  "textAlign",
  "lineColor",
  "background",
  "text",
  "textPosition",
  "textMargin",
  "margin",
  "marginTop",
  "marginRight",
  "marginLeft",
];

@Component(
    selector: "angular-barcode",
    template: '''
<svg #barcode></svg>
''',
    inputs: const [
      "value",
      "format",
      "displayValue",
      "fontOptions",
      "width",
      "height",
      "fontSize",
      "font",
      "textAlign",
      "lineColor",
      "background",
      "text",
      "textPosition",
      "textMargin",
      "margin",
      "marginTop",
      "marginRight",
      "marginLeft",
    ])
class AngularBarcode implements OnChanges {
  String value;
  String format;
  String fontOptions;
  String font;
  String textAlign;
  String lineColor;
  String background;
  String text;
  String textPosition;
  num width;
  num height;
  num fontSize;
  num textMargin;
  num margin;
  num marginTop;
  num marginBottom;
  num marginRight;
  num marginLeft;
  bool displayValue;

  Options _options;

  @ViewChild("barcode")
  ElementRef barcodeElement;

  Element get svg => barcodeElement.nativeElement;

  _refresh() {
    _options = new Options(
        format: format,
        displayValue: displayValue,
        textMargin: textMargin is num ? textMargin : 2,
        fontOptions: fontOptions,
        font: font,
        fontSize: fontSize is num ? fontSize : 20,
        margin: margin is num ? margin : 10,
        marginBottom: marginBottom is num ? marginBottom : null,
        marginLeft: marginLeft is num ? marginLeft : null,
        marginRight: marginRight is num ? marginRight : null,
        marginTop: marginTop is num ? marginTop : null,
        width: width is num ? width : 2,
        height: height is num ? height : 100,
        text: text,
        textAlign: textAlign,
        textPosition: textPosition,
        lineColor: lineColor,
        background: background);
    new DartBarcode(svg, value, _options);
  }

  @override
  ngOnChanges(Map<String, SimpleChange> changes) {
    if (changes.keys.any((String k) => _inputs.contains(k))) {
      _refresh();
    }
  }
}
