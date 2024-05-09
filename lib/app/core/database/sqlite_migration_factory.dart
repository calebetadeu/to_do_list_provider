import 'package:to_do_list_provider/app/core/database/migration.dart';
import 'package:to_do_list_provider/app/core/database/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [MigrationV1()];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = getCreateMigration();
    return migrations.sublist(version);
  }
}
