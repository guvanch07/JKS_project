abstract class LocalDBStructure {
  static String getPath(
    String databasesPath,
    String nameDB,
  ) =>
      '$databasesPath/$nameDB.db';

  static String queryGetCacheJob(String job) {
    return '''SELECT name,type,defaultValue,description, GROUP_CONCAT(detailsJobsVariants.variant) AS choices
              FROM detailsJobs 
              LEFT JOIN detailsJobsVariants ON detailsJobs.id = detailsJobsVariants.idDetailsJob
              WHERE nameJob = '$job'
              GROUP BY detailsJobs.id ''';
  }

  static String queryCreatePropertyJobs() {
    return '''
            CREATE TABLE detailsJobs
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            nameJob TEXT,
            name TEXT,
            type TEXT,
            defaultValue TEXT, 
            description TEXT)
            ''';
  }

  static String queryForeignKeysOn() {
    return 'PRAGMA foreign_keys=ON';
  }
}
