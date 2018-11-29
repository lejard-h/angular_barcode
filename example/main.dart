/// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
library angular_barcode_main;

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_barcode/angular_barcode.dart';

import 'main.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
}

@Component(
  selector: "app",
  template: '''
    <angular-barcode #barcode value="1234567890128" [displayValue]="true" format="ean13" [width]="width"></angular-barcode>
    <angular-qrcode data="1234567890128" size="200" color="0000ff"></angular-qrcode>
  ''',
  directives: [angularBarcodeDirectives],
)
class AppComponent implements OnInit {
  num width = 2;

  @ViewChild("barcode")
  AngularBarcode barcode;

  @override
  ngOnInit() {
    Timer(const Duration(seconds: 2), () {
      width = 5;
      barcode.height = 200;
    });
  }
}
