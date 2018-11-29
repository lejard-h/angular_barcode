/// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
library angular_barcode_barcode;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:dart_barcode/dart_barcode.dart';

const List<String> _inputs = [
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

@Component(selector: "angular-barcode", template: '''
<svg #barcode></svg>
''')
class AngularBarcode implements OnChanges {
  @Input()
  String value;

  @Input()
  String format;

  @Input()
  String fontOptions;

  @Input()
  String font;

  @Input()
  String textAlign;

  @Input()
  String lineColor;

  @Input()
  String background;

  @Input()
  String text;

  @Input()
  String textPosition;

  @Input()
  num width;

  @Input()
  num height;

  @Input()
  num fontSize;

  @Input()
  num textMargin;

  @Input()
  num margin;

  @Input()
  num marginTop;

  @Input()
  num marginBottom;

  @Input()
  num marginRight;

  @Input()
  num marginLeft;

  @Input()
  bool displayValue;

  Options _options;

  @ViewChild("barcode")
  Element barcodeElement;

  Element get svg => barcodeElement;

  _refresh() {
    _options = Options(
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
    DartBarcode(svg, value, _options);
  }

  @override
  ngOnChanges(Map<String, SimpleChange> changes) {
    if (changes.keys.any((String k) => _inputs.contains(k))) {
      _refresh();
    }
  }
}
