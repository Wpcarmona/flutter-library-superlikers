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
