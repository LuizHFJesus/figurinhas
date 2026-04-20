import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sticker_manager_wc22/common/utils/constants.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class UpdateCatalogIfNeededUseCase {
  final CatalogRepository _catalogRepository;

  UpdateCatalogIfNeededUseCase(this._catalogRepository);

  Future<void> call() async {
    final album = await _catalogRepository.getAlbum(AppConstants.defaultAlbumId);
    
    if (album == null) return;
    
    final json = await rootBundle.loadString(AppConstants.defaultAlbumJson);
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final jsonVersionStr = decoded['version'] as String?;
    final jsonVersion = jsonVersionStr != null 
        ? int.tryParse(jsonVersionStr) 
        : null;
    
    if (jsonVersion != null && 
        (album.version == null || jsonVersion > album.version!)) {
      await _catalogRepository.importCatalogFromJsonString(json);
    }
  }
}
