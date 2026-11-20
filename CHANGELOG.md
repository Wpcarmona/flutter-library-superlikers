## 0.6.0

* New `raw` map (the item's original JSON) on `GoalsParticipant`, `IndexGoals`, `Achievements`,
  `ListEntriesResponse`, `Reward`, `CouponRedemption` and `BlogPost`. Their content depends on
  each campaign (goal configuration, entry invoices, the prize provider's metadata such as
  brands/zones/sites, coupon download URLs, `voted`…), so apps can read their own fields without
  the library having to model every campaign. Typed fields are unchanged.
* New `SuperlikersHttp.interceptors`: interceptors the app registers once at startup are added to
  every client `createPinnedDio` creates (the SDK's and the app's own), e.g. for logging or
  app-specific access rules.
* `MetricsRepositoryimpl` renamed to `MetricsRepositoryImpl` like every other repository; the old
  name stays as a deprecated alias.
* `GoalRepository.getGoalsParticipant` gets an optional `includeEnded` (`include_ended`).
* New `ExternalRepository.getExternalFormFieldBySlug` (`fields_info` by the action's `slug`).
* `PrizesRepository.redeemCoupon` gets optional `opts`, sent as-is to the coupon provider (e.g.
  the brand/site chosen with `getCouponExternalData`).
* Tolerant parsing (new `readString`/`readInt`/`readBool`/`readDate`/… helpers) in rewards,
  coupons, achievements, entries and blogs: missing fields, numbers/booleans sent as strings or
  `0/1`, invalid dates and missing lists/objects no longer throw. Notably `metadata.localizable`
  sent as a number used to throw a `TypeError` while listing rewards.
* Callers are unaffected; custom `GoalDatasource`/`GoalRepository`/`ExternalDatasource`/
  `ExternalRepository`/`PrizesDatasource`/`PrizesRepository` implementations must update their
  overrides and implement `getExternalFormFieldBySlug`.

## 0.5.0

* Response decoding is now shared and tolerant: every datasource uses the new public
  `decodeJsonBody(response)` (exported from `superlikers_core.dart`). It accepts a body that
  Dio already decoded (`application/json`) or a JSON string, and turns anything else (an HTML
  502 page, an empty body, a JSON array) into a `DioException` of type `badResponse` with the
  response attached, instead of a `TypeError`/`FormatException` that apps' `on DioException`
  handlers never caught. Apps can use it in their own datasources built on `createPinnedDio`.
* More tolerant models: `LoginResponse` (null `participant`/`message`/`token`) and
  `ParticipantPublicInfoResponse` (missing `object`, numbers or booleans sent as strings,
  invalid `last_activity_at`, non-string tags) no longer throw while parsing.
* `ParticipantRepository.updateUser` gets an optional `properties` map to update any field of
  the campaign's participant schema (tags, avatar, campaign-specific fields). Named params
  still win over the same keys in `properties`.
* `ParticipantRepository.searchParticipants` gets optional `withAdmins` (`with_admins`) and
  `exactTags` (`exact_tags`).
* `RankingRepository.getPointsInPeriod` gets an optional `pointTypeId` (`point_type_id`).
* New `PrizesRepository.getCouponExternalData` (`POST /coupons/{id}/external/{key}`, optional
  `opts`) returns the coupon provider's raw `data` in a `CouponExternalData`, since its shape
  depends on each provider.
* Advanced ranking is no longer tied to one campaign's schema:
  * `AdvancedRanking.data` now keeps every field the backend sends for the participant (on
    top of the typed ones and their defaults), and `pointsByPtype` is actually filled (it was
    always empty).
  * `getParticipantRanking` uses `name`/`last_name` when the campaign has no `nombres`/
    `apellidos`, and returns the participant's `data` (it was always `{}`).
  * Both ranking models parse tolerantly (numbers as strings/decimals, missing fields,
    non-string tags): a campaign without the OXXO-specific fields used to throw.
* Callers are unaffected; custom `ParticipantDatasource`/`ParticipantRepository`/
  `RankingDatasource`/`RankingRepository`/`PrizesDatasource`/`PrizesRepository`
  implementations must update their overrides and implement `getCouponExternalData`.

## 0.4.0

* `UploadPhotoRepository.uploadPhoto` (`POST /photos`) now covers every documented param:
  * `photo` is now optional; new `imageUrl` (`image_url`) lets you register an image by URL
    instead of uploading it. One of the two is required (throws `ArgumentError` otherwise).
  * New optional `title` and `category` for the activity being recorded.
  * `image_url` and `upload_photo` are mutually exclusive: when both are given, only `photo`
    is sent (the API gives it priority anyway).
  * `imageName` is still sent as-is, but per the API docs it only takes effect with `imageUrl`
    (truncated to 200 chars server-side).
  * `photo` is validated against the new `UploadPhoto.allowedExtensions` (jpg, jpeg, gif, png,
    swf, css); other formats throw `ArgumentError` before any request is made. Re-uploading an
    image the API already has fails server-side with "Sha1 is already taken".
* `DocumentRepository.uploadDocument` (`POST /microsite/documents`):
  * New optional `title` and `category` for the activity being recorded.
  * `document` is validated against the new `UploadDocument.allowedExtensions` (images, video,
    audio, text documents, spreadsheets, presentations, css — see the constant); other formats
    throw `ArgumentError` before any request is made.
* `UploadPhoto.isAllowed(path)` / `UploadDocument.isAllowed(path)` helpers, and the
  `allowedExtensions` lists to configure file pickers in the apps.
* Referrals module: you can now set who referred a participant (`referrals_code`):
  * `AuthRepository.register` gets an optional `referralsCode`, sent as
    `participation.referrals_code` (as the API docs require for sign-up).
  * `ParticipantRepository.updateUser` gets an optional `referralsCode`, sent as
    `properties.referrals_code`, to set it later if it wasn't given at sign-up.
  * `ReferralRepository.getOrUpdateReferralCode` / `getParticipantReferrals` were already
    implemented; only their docs were expanded.
* Callers are unaffected (except that disallowed formats now fail fast); custom
  `UploadPhotoDatasource`/`UploadPhotoRepository`/`DocumentDatasource`/`DocumentRepository`/
  `AuthDatasource`/`AuthRepository`/`ParticipantDatasource`/`ParticipantRepository` implementations must update their override signature.

## 0.3.0

* Add coupon services to `PrizeRepository`/`PrizesDatasource`:
  * `redeemCoupon({couponId, distinctId})` — `POST /coupons/{id}/create`, generates a coupon
    redemption and returns `CouponRedeemResult` (the redeemed `coupon` as a `Reward`, the
    `redemption` details, and the redemption `message`). The redemption code to hand off is
    `CouponRedeemResult.code`.
  * `getCouponInfo({code})` — `GET /coupons/info?campaign=...&code=...` (with
    `Authorization: Bearer <apiKey>`), returns `CouponInfo` with the current state of a
    previously redeemed coupon.
  * New entities `CouponRedeemResult`, `CouponRedemption`, `CouponInfo`. Non-breaking (purely
    additive).

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

* Add `ExternalRepository.getExternalFormFieldByCategory({token, category})`: a convenience
  that composes `getExternalFormListByCategory` (to resolve `category` -> `external_action_id`)
  + `getExternalFormField` into one call, for callers who only need the first external action
  matching a category. Throws if none exist for that category. The two original methods are
  unchanged and still independently callable. Non-breaking (purely additive).

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
