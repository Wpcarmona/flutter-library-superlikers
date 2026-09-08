# superlikers_core

Servicios, entidades, repositorios, datasources, modelos y mappers
compartidos entre las apps Flutter de Superlikers. Todas las apps hablan
con el mismo backend y los mismos ambientes (dev/prod); lo único que
cambia por cliente es la `campaign` y el `apiKey`.

## Estructura

- `package:superlikers_core/superlikers_core.dart` — config, entidades de
  dominio y contratos abstractos (`AuthDatasource`, `AuthRepository`, etc.).
  Es lo que usa la capa de presentación/estado de cada app.
- `package:superlikers_core/infraestructure.dart` — implementaciones
  concretas: modelos JSON, mappers, datasource (Dio) y repository. Se
  importa aparte (normalmente con alias `as data`) porque sus modelos
  comparten nombre con las entidades de dominio (ej. `Participant`).

## Uso

En el `main_dev.dart` / `main_prod.dart` de cada app cliente:

```dart
import 'package:superlikers_core/superlikers_core.dart';

void main() {
  SuperlikersConfig.setupDev(
    campaign: 'uo',
    apiKey: 'aaa138b17fe628900805dba5650c0b98',
  );
  app.bootstrap();
}
```

```dart
// main_prod.dart
SuperlikersConfig.setupProd(
  campaign: 'uo',
  apiKey: 'aaa138b17fe628900805dba5650c0b98',
);
```

Al armar el repository de un módulo:

```dart
import 'package:superlikers_core/superlikers_core.dart';
import 'package:superlikers_core/infraestructure.dart' as data;

final AuthRepository authRepository = data.AuthRepositoryImpl();

// `login`/`register` son genéricos: cada app arma el mapa de campos que
// su campaign necesite (login puede ser id_empleado, email, cédula, etc.;
// register puede pedir plaza/región/tienda o un set totalmente distinto).
final login = await authRepository.login(
  participation: {'id_empleado': '123', 'password': 'secret'},
  // en otro cliente: {'email': 'x@y.com', 'password': 'secret'}
);

final register = await authRepository.register(
  properties: {
    'nombres': 'Juan',
    'apellidos': 'Pérez',
    'email': 'juan@ejemplo.com',
    'password': 'secret',
    'password_confirm': 'secret',
    'terms': true,
    // + lo que pida esa campaign (plaza/región/tienda, cédula, etc.)
  },
);

// `Participant.properties` trae cualquier campo del participante que el
// backend devuelva y no sea parte del set fijo (id/email/name/avatar/uid/
// uidType/state) — varía según el schema de cada campaign.
final plaza = login.participant.properties['plaza'];
```

Para cerrar sesión automáticamente ante un 401 de una llamada autenticada:

```dart
import 'package:superlikers_core/superlikers_core.dart';

onSessionExpired = () {
  // limpiar el storage local y navegar al login
};
```

## Módulos incluidos

- Config / Environment (`SuperlikersConfig`, `Environment`)
- Network (`createPinnedDio`, `SessionExpiredInterceptor`)
- `KeyValueStorageService` (token/uid cifrados, resto en shared_preferences)
- Achievement, Auth (login/registro/passwords + verificación de teléfono,
  2FA por email/SMS y por TOTP, cambio de contraseña autenticado, login
  form y requisitos de login), Blog, Comments (comentarios de blog),
  Documents (subida de documentos), Entries, External (+ External Forms:
  info/list/fillup/update), Goal (+ goal status), Localization, Metrics,
  Participant (+ ranking, ranking por segmento, puntos por periodo, public
  info, update avatar/user, búsqueda por tags, extracto y redención de
  puntos), Prizes, Redeemed prizes, Referrals, Upload photo, Votes

Todos siguen el mismo patrón: entidad de dominio -> datasource/repository
abstractos -> modelo JSON -> mapper -> datasource/repository impl.

**Qué se dejó fuera a propósito** (no tienen datasource/repository en
heroesoxxo, es decir no son servicios de API sino entidades derivadas o
de UI/local, o son específicos de una sola app):
- `Badges` y `PushMessage` (notificaciones locales/FCM)
- `deleteAccountUrl` (URL estática específica de una app, no un servicio)
- `football` (proveedor externo ajeno al backend de Superlikers, específico
  del evento Mundial 2026 de heroesoxxo — no es un servicio compartido)

Si algún cliente los necesita como parte del SDK, se agregan después
siguiendo el mismo patrón.

## Seguridad de red

Todo lo que sale por `createPinnedDio()` (usado por todos los datasource)
aplica:

- **Certificate pinning** a la CA raíz de `*.superlikers.com` (Amazon Root
  CA 1) — rechaza cualquier certificado que no encadene a esa CA, aunque
  el sistema operativo confíe en él.
- **Solo HTTPS**: `createPinnedDio` lanza `ArgumentError` si `baseUrl` no
  empieza con `https://` (defensa en profundidad ante un typo o un
  ambiente mal configurado).
- **Sin redirects automáticos** (`followRedirects: false`): evita que una
  respuesta 3xx baje de https a http sin que el caller se entere.
- **Timeouts** de conexión/envío/recepción (15s/30s/30s) para no dejar
  conexiones — y credenciales en memoria — colgadas indefinidamente.
- **`SessionExpiredInterceptor`**: cierra sesión ante un 401 solo si la
  request llevaba `Authorization` (evita cerrar sesión por un 401 de
  login/credenciales).

`KeyValueStorageServiceImpl` guarda `token`/`uid` con `flutter_secure_storage`
usando `EncryptedSharedPreferences` en Android y `first_unlock` en iOS
(no se incluye en backups de iCloud/iTunes).

Ninguno de estos controles estaba explícito en `heroesoxxo` salvo el
certificate pinning (que sí se portó tal cual); el resto se agregó al
consolidar la librería porque ahora la comparten varios clientes.

## Consumir el paquete desde una app

Mientras el paquete no viva en un servidor pub privado, cada app lo
referencia como dependencia de path (útil mientras se itera en paralelo)
o de git:

```yaml
dependencies:
  superlikers_core:
    path: ../superlikers-library-flutter
    # o, apuntando a un repo git:
    # git:
    #   url: https://github.com/<org>/superlikers-library-flutter.git
    #   ref: main
```
