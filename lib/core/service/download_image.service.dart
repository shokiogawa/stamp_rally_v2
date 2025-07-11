import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:stamp_rally_v2_fvm/core/utility/logger.dart';

class DownloadService {
  /// Downloads an image from the given [url] and saves it to the device's local storage.
  static Future<File?> saveImage(
      Uint8List imageBytes, String historicSpotId) async {
    try {
      // Get the temporary directory of the device
      final directory = await getApplicationDocumentsDirectory();

      // Create the directory path
      final dirPath = '${directory.path}/$historicSpotId';
      final dir = Directory(dirPath);

      // Ensure the directory exists
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      // Create the file path
      final filePath = '$dirPath/${DateTime.now()}_worship_card.png';

      // Write the image bytes to the file
      final file = File(filePath);
      await file.writeAsBytes(imageBytes);
      return file;
    } catch (e) {
      logger.e('Error saving image: $e');
      return null;
    }
  }

  /// Retrieves a saved image from the device's local storage using the [fileName].
  static Future<File?> getImage(String historicSpotId) async {
    try {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();

      // Create the file path
      final filePath =
          '${directory.path}/$historicSpotId/${DateTime.now()}_worship_card.png';

      // Check if the file exists
      final file = File(filePath);
      if (await file.exists()) {
        return file;
      } else {
        print('File not found: $filePath');
        return null;
      }
    } catch (e) {
      print('Error retrieving image: $e');
      return null;
    }
  }

  /// Retrieves a list of all files in the application's documents directory.
  static Future<List<File>> getFiles(String historicSpotId) async {
    try {
      logger.i('Retrieving files for historic spot ID: $historicSpotId');
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final historicSpotDirectory =
          Directory('${directory.path}/$historicSpotId');
      if (!await historicSpotDirectory.exists()) {
        logger.i('not exist');
        return [];
      }

      // List all files in the directory
      final files = historicSpotDirectory.listSync().whereType<File>().toList();
      print('Files found: ${files.length}');
      return files;
    } catch (e) {
      logger.e('Error retrieving files: $e');
      return [];
    }
  }
}
