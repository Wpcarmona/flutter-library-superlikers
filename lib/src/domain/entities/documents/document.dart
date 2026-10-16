class UploadDocument {
  /// Formatos que acepta `POST /microsite/documents` (`upload_document`).
  /// Úsalo también para filtrar el selector de archivos de la app.
  static const allowedExtensions = [
    // Imágenes
    'jpg', 'jpeg', 'gif', 'png', 'swf',
    // Videos
    'mp4', 'mov', 'avi', 'wmv', 'webm', 'mkv', 'flv',
    // Audio
    'mp3', 'wav', 'ogg',
    // Documentos de texto (la doc de la API dice "rft"; se aceptan ambos)
    'doc', 'docx', 'odt', 'txt', 'rtf', 'rft', 'pdf',
    // Hojas de cálculo
    'xlsx', 'xls', 'csv', 'ods',
    // Presentaciones
    'ppt', 'pptx', 'odp',
    // Otros
    'css',
  ];

  /// Si [path] tiene una extensión de [allowedExtensions] (sin distinguir
  /// mayúsculas).
  static bool isAllowed(String path) {
    final name = path.split(RegExp(r'[/\\]')).last;
    final dot = name.lastIndexOf('.');
    return dot != -1 && allowedExtensions.contains(name.substring(dot + 1).toLowerCase());
  }

  final String ok;
  final String message;

  UploadDocument({required this.ok, required this.message});
}
