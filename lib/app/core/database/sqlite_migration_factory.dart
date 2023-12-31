import 'package:todo_list/app/core/database/migrations/migration.dart';
import 'package:todo_list/app/core/database/migrations/migration.v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [MigrationV1()];
  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    if (version == 1) {
      // migrations.add(MigrationV2());
      // migrations.add(MigrationV3());
    }

    if (version == 2) {
      // migrations.add(MigrationV3());
    }

    return migrations;
  }
}
