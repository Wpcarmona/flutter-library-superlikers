import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class LocalizationMapper {
  static domain.Zona zonaToEntity(infra.ZonaResponse zona) => domain.Zona(
        zona: zona.zona,
        regiones: zona.regiones,
      );

  static domain.Region regionToEntity(infra.RegionResponse region) => domain.Region(
        region: region.region,
        plazas: region.plazas,
      );

  static domain.CrTienda crTiendaToEntity(infra.TiendaResponse crTienda) =>
      domain.CrTienda(
        plaza: crTienda.plaza,
        q: crTienda.q,
        total: crTienda.total,
        count: crTienda.count,
        nextCursor: crTienda.nextCursor,
        items: crTienda.items
            .map((item) => domain.ItemTienda(
                  crTienda: item.crTienda,
                  nombreTienda: item.nombreTienda,
                  plaza: item.plaza,
                ))
            .toList(),
      );
}
