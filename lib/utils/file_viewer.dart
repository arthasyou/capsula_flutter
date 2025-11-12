import 'package:flutter/widgets.dart';
import 'package:flutter_filereader/flutter_filereader.dart';

/// Supported document categories for the universal file reader.
enum DocumentKind { pdf, word, excel, ppt, text, image, other }

/// Utilities for previewing files with the `flutter_filereader` plugin.
class FileViewerUtils {
  const FileViewerUtils._();

  /// Returns a [FileReaderView] widget that can render local documents.
  ///
  /// The plugin expects an absolute local path (e.g. a cached download).
  /// Use [loadingWidget] and [unsupportedWidget] to override the default UI,
  /// and [onOpen] to observe whether the engine opened the file successfully.
  static Widget viewer({
    required String filePath,
    Function(bool success)? onOpen,
    Widget? loadingWidget,
    Widget? unsupportedWidget,
  }) {
    return FileReaderView(
      filePath: filePath,
      openSuccess: onOpen,
      loadingWidget: loadingWidget,
      unSupportFileWidget: unsupportedWidget,
    );
  }

  /// Determines the [DocumentKind] based on the file extension.
  static DocumentKind inferKind(String path) {
    final ext = _extension(path);
    if (ext == null) return DocumentKind.other;
    if (_wordExtensions.contains(ext)) return DocumentKind.word;
    if (_excelExtensions.contains(ext)) return DocumentKind.excel;
    if (_pptExtensions.contains(ext)) return DocumentKind.ppt;
    if (_pdfExtensions.contains(ext)) return DocumentKind.pdf;
    if (_textExtensions.contains(ext)) return DocumentKind.text;
    if (_imageExtensions.contains(ext)) return DocumentKind.image;
    return DocumentKind.other;
  }

  /// Whether the plugin can generally render files with the given extension.
  static bool isSupported(String path) {
    final ext = _extension(path);
    if (ext == null) return false;
    return _supportedExtensions.contains(ext);
  }

  static String? _extension(String path) {
    final parts = path.split('.');
    if (parts.length < 2) return null;
    return parts.last.toLowerCase();
  }

  static const Set<String> _pdfExtensions = {'pdf'};
  static const Set<String> _wordExtensions = {'doc', 'docx'};
  static const Set<String> _excelExtensions = {'xls', 'xlsx', 'xlsm'};
  static const Set<String> _pptExtensions = {'ppt', 'pptx'};
  static const Set<String> _textExtensions = {'txt', 'rtf'};
  static const Set<String> _imageExtensions = {
    'png',
    'jpg',
    'jpeg',
    'bmp',
    'gif',
  };

  static const Set<String> _supportedExtensions = {
    ..._pdfExtensions,
    ..._wordExtensions,
    ..._excelExtensions,
    ..._pptExtensions,
    ..._textExtensions,
    ..._imageExtensions,
  };
}
