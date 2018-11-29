/// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
library angular_barcode;

import 'dart:async';

import 'package:angular/angular.dart';

import 'src/angular_barcode.dart';
import 'src/angular_qrcode.dart';

export 'src/angular_barcode.dart';
export 'src/angular_qrcode.dart';

const List ANGULAR_BARCODE_DIRECTIVES = [AngularBarcode, AngularQrCode];

@Component(
  selector: "app",
  template: '''
    <angular-barcode #barcode value="1234567890128" [displayValue]="true" format="ean13" [width]="width"></angular-barcode>
    <angular-qrcode data="1234567890128" size="200" color="0000ff"></angular-qrcode>
  ''',
  directives: [ANGULAR_BARCODE_DIRECTIVES],
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
