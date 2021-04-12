import 'package:json_annotation/json_annotation.dart';

import 'FallOff.dart';
import 'Armor.dart';
import 'Grids.dart';
import 'Shields.dart';

part 'Damage.g.dart';

@JsonSerializable(explicitToJson: true)
class Damage {
  late double maxIntegrity;
  late bool damageVoxels;
  late bool selfDamage;

  // defaults to a value of 1, this setting modifies how much Health is subtracted from a projectile per hit (1 = per hit).
  late double healthHitModifier;
  late double voxelHitModifier;
  late double characters;

  late FallOff fallOff;
  late Grids grids;
  late Armor armor;
  late Shields shields;

  Damage(
      this.maxIntegrity,
      this.damageVoxels,
      this.selfDamage,
      this.healthHitModifier,
      this.voxelHitModifier,
      this.characters,
      this.fallOff,
      this.grids,
      this.armor,
      this.shields);

  factory Damage.fromJson(Map<String, dynamic> json) => _$DamageFromJson(json);

  Map<String, dynamic> toJson() => _$DamageToJson(this);
}