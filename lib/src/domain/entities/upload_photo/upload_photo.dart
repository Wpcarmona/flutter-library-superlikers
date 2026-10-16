class UploadPhoto {
  /// Formatos que acepta `POST /photos` (`upload_photo`). Úsalo también para
  /// filtrar el selector de archivos de la app.
  static const allowedExtensions = ['jpg', 'jpeg', 'gif', 'png', 'swf', 'css'];

  /// Si [path] tiene una extensión de [allowedExtensions] (sin distinguir
  /// mayúsculas).
  static bool isAllowed(String path) {
    final name = path.split(RegExp(r'[/\\]')).last;
    final dot = name.lastIndexOf('.');
    return dot != -1 && allowedExtensions.contains(name.substring(dot + 1).toLowerCase());
  }

  final String ok;
  final String imageUrl;
  final String message;

  UploadPhoto({
    required this.ok,
    required this.imageUrl,
    required this.message,
  });
}
