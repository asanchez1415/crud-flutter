// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'dart:convert';

Proveedor proveedorFromJson(String str) => Proveedor.fromJson(json.decode(str));

String proveedorToJson(Proveedor data) => json.encode(data.toJson());

class Proveedor {
  int providerid;
  String providerName;
  String providerLastName;
  String providerMail;
  String providerState;

  Proveedor({
    required this.providerid,
    required this.providerName,
    required this.providerLastName,
    required this.providerMail,
    required this.providerState,
  });

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        providerid: json["providerid"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        providerState: json["provider_state"],
      );

  Map<String, dynamic> toJson() => {
        "providerid": providerid,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        "provider_state": providerState,
      };
}
