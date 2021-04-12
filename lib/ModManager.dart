import 'package:logging/logging.dart';
import 'package:xml/xml.dart';
import 'models/World.dart';
import 'Steam.dart';
import 'dart:io';

class ModManager {
  final _log = Logger('ModManager');
  final gameId;
  final subDirectory;

  ModManager(this.gameId, this.subDirectory) {}


  Future<void> updateMods(var worlds) async {
    await _downloadMods(worlds);
    await _parseMods();
  }

  Future<void> _downloadMods(var worlds) async {
    _log.info('Downloading mods (this might take a little while)');
    for (var world in worlds){
      _log.info('Downloading mods for world: ${world.sessionName}');
      var modIds = <int>[];
      for (var mod in world.mods){
        modIds.add(mod.publishedFileId);
      }
      await downloadWorkshopItems(gameId, modIds, directory: subDirectory);
    }
    _log.info('Finished downloading mods');
  }

  // TODO
  Future<void> _parseMods() async {

  }




}
