class CrTienda {
  final String plaza;
  final String q;
  final num total;
  final num count;
  final num? nextCursor;
  final List<ItemTienda> items;

  CrTienda({
    required this.plaza,
    required this.q,
    required this.total,
    required this.count,
    required this.nextCursor,
    required this.items,
  });
}

class ItemTienda {
  final String crTienda;
  final String? nombreTienda;
  final String plaza;

  ItemTienda({
    required this.crTienda,
    required this.nombreTienda,
    required this.plaza,
  });
}
