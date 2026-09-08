class TiendaResponse {
  String plaza;
  String q;
  int total;
  int count;
  int? nextCursor;
  List<Item> items;

  TiendaResponse({
    required this.plaza,
    required this.q,
    required this.total,
    required this.count,
    required this.nextCursor,
    required this.items,
  });

  factory TiendaResponse.fromJson(Map<String, dynamic> json) => TiendaResponse(
        plaza: json["plaza"],
        q: json["q"],
        total: json["total"],
        count: json["count"],
        nextCursor: json["nextCursor"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plaza": plaza,
        "q": q,
        "total": total,
        "count": count,
        "nextCursor": nextCursor,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String crTienda;
  String? nombreTienda;
  String plaza;

  Item({
    required this.crTienda,
    required this.nombreTienda,
    required this.plaza,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        crTienda: json["cr_tienda"],
        nombreTienda: json["nombre_tienda"],
        plaza: json["plaza"],
      );

  Map<String, dynamic> toJson() => {
        "cr_tienda": crTienda,
        "nombre_tienda": nombreTienda,
        "plaza": plaza,
      };
}
