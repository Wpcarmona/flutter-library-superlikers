import 'dart:io';

import '../../entities/entities.dart';

/// `POST /photos`. Sube una imagen y genera una actividad UploadPhoto del
/// participante. Se envía [photo] (multipart, `upload_photo`) o [imageUrl]
/// (`image_url`); son excluyentes y si llegan ambos solo se manda [photo].
/// [photo] solo acepta [UploadPhoto.allowedExtensions]; si no, lanza
/// `ArgumentError` sin llamar a la API. [imageName] solo aplica con
/// [imageUrl] (la API lo trunca a 200 caracteres). [title] y [category] son
/// de la actividad. Si la imagen ya fue subida, la API responde con el error
/// "Sha1 is already taken".
abstract class UploadPhotoRepository {
  Future<UploadPhoto> uploadPhoto({
    required String distinctId,
    File? photo,
    String? imageUrl,
    String? imageName,
    String? title,
    String? category,
  });
}
