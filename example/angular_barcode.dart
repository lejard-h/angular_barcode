// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dart_barcode.example;

import 'dart:async';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular_barcode/angular_barcode.dart';

main() {
  bootstrap(App);
}

@Component(
  selector: "app",
  template: '''
    <angular-barcode #barcode value="1234567890128" [displayValue]="true" format="ean13" [width]="width"></angular-barcode>
  ''',
  directives: const [AngularBarcode],
)
class App implements OnInit {
  num width = 2;

  @ViewChild("barcode")
  AngularBarcode barcode;

  @override
  ngOnInit() {
    new Timer(const Duration(seconds: 2), () {
      width = 5;
      barcode.height = 200;
    });
  }
}
