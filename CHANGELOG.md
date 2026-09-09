## 0.2.0

* **Breaking**: `ParticipantPublicInfo` (returned by `getParticipantPublicInfo`, the
  `/microsite/participants/info` endpoint) no longer hardcodes campaign-specific fields
  (`name`, `lastName`, `cellphoneNumber`, `idEmployed`, `region`, `tienda`, `plaza`,
  `nombreTienda`, `terms`, `rol`, `cargo`, `nivel`, `fcmToken`, `autorizationNumber`,
  `isPublisher`). Real payloads from different campaigns showed this endpoint's schema varies
  as much as `login`/`register`'s — some campaigns don't send `nombres`/`apellidos`/
  `id_empleado` at all (using `nombre_completo`/`numero_de_documento` instead, or `name` with
  a completely different extra-fields set), which crashed parsing (`null` into a non-nullable
  `String`). Only fields confirmed stable across every observed campaign stay typed (`uid`,
  `uidType`, `email`, `points`, `totalPoints`, `coins`, `totalCoins`, `state`, `badEmail`,
  `emailVerified`, `cellphoneVerified`, `unconfirmedEmail`, `unconfirmedCellphone`, `avatar`,
  `lastActivityAt`, `tags`); everything else now lands in a new `properties: Map<String,
  dynamic>` bag, same pattern already used by `Participant`.

* `FieldEntityField`/`FieldEntityModel` (external form field definitions, returned by
  `/external_forms/actions/fields_info`) gain a `properties` bag too. `format`/`choices` stay
  typed since they're common and useful, but a `field_type` not seen yet could bring its own
  extra metadata key beyond those two — it now lands in `properties` instead of being silently
  dropped. Non-breaking (purely additive).

## 0.1.1

* Fix `createPinnedDio`/`applyCertificatePinning`: also trust ISRG Root X1 (Let's Encrypt),
  in addition to Amazon Root CA 1. The dev/labs host (`api.superlikerslabs.com`) serves a
  Let's Encrypt certificate, different from prod's (`*.superlikers.com`, Amazon-issued) —
  every network call against dev was failing the TLS handshake before this fix. Verified
  against both real hosts.

## 0.1.0

* Add `package:superlikers_core/inputs.dart`: configurable Formz inputs shared across
  Superlikers apps (email, password, confirm password, phone number, username, OTP code,
  ID/document numbers, country code, terms and conditions, generic required text). Each
  input exposes its rules (min/max length, password complexity requirements, custom
  patterns, etc) as constructor parameters instead of hardcoding them.

## 0.0.1

* Initial release: shared Superlikers backend services for Flutter client apps — auth
  (login, 2FA email/SMS/TOTP, phone verification, password change), participant (search,
  points, redemption), ranking, goals, achievements, blog, external forms, prizes,
  referrals, documents, and comments.
