// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';

const _api = "https://api.qrserver.com/v1/create-qr-code/";

@Component(
    selector: "angular-qrcode",
    template: '''
    <img [attr.src]="url"/>
''',
    inputs: const [
      "size",
      "data",
      "charsetSource",
      "charsetTarget",
      "ecc",
      "color",
      "bgcolor",
      "margin",
      "qzone",
      "format"
    ],
    providers: const [
      AngularQrCodeService
    ])
class AngularQrCode {
  var size;
  var qzone;
  var margin;
  String data;
  String charsetSource;
  String charsetTarget;
  String ecc;
  String color;
  String bgcolor;
  String format;

  AngularQrCodeService _service;

  AngularQrCode(this._service);

  String get url => _service.generateQrCodeUrl(data,
      size: size,
      charsetSource: charsetSource,
      charsetTarget: charsetTarget,
      color: color,
      ecc: ecc,
      bgcolor: bgcolor,
      format: format,
      qzone: qzone,
      margin: margin);
}

@Injectable()
class AngularQrCodeService {
  String _mapToQuery(Map<String, dynamic> map) {
    var pairs = <List<String>>[];
    map.forEach((key, value) {
      if (value != null) {
        pairs.add([Uri.encodeQueryComponent(key), "$value"]);
      }
    });
    return pairs.map((pair) => "${pair[0]}=${pair[1]}").join("&");
  }

  String generateQrCodeUrl(String data,
      {var size,
      String charsetSource,
      String charsetTarget,
      String ecc,
      String color,
      String bgcolor,
      var margin,
      var qzone,
      String format}) {
    Map<String, dynamic> query = {
      "size": size != null ? "${size}x${size}" : null,
      "charset-source": charsetSource,
      "charset-target": charsetTarget,
      "ecc": ecc,
      "color": color,
      "bgcolor": bgcolor,
      "margin": margin,
      "qzone": qzone,
      "format": format,
      "data": data
    };
    return "$_api?${_mapToQuery(query)}";
  }
}
