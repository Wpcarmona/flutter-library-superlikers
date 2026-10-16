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
