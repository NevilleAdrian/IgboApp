import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheManager {
  DefaultCacheManager manager = DefaultCacheManager();
  Future<List<FileInfo>> loadAllAssets(List<String> assets) async {
    List<FileInfo> fileInfos = [];
    for (int i = 0; i < assets.length; i++) {
      String asset = assets[i];
      try {
        FileInfo fileInfo = await _getAsset(asset);
        if (fileInfo == null) {
          print('file was null and downloading');
          fileInfo = await manager.downloadFile(asset, key: asset);
          print('this is file $fileInfo');
        }
        fileInfos.add(fileInfo);
      } catch (ex) {
        print(ex);
      }
    }
    return fileInfos;
  }

  Future<FileInfo> loadAsset(String asset) async {
    FileInfo fileInfo;
    try {
      fileInfo = await _getAsset(asset);
      if (fileInfo == null) {
        fileInfo = await manager.downloadFile(asset, key: asset);
      }
    } catch (ex) {
      print(ex);
    }
    return fileInfo;
  }

  Future<FileInfo> _getAsset(String asset) async {
    return await manager.getFileFromCache(asset);
  }
}
