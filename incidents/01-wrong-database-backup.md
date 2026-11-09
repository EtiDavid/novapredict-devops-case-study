# Case study: a valid backup of the wrong database

**Context:** Local Docker production-style simulation, not a production customer outage.

**Problem.** A PostgreSQL restore completed, but the restored database had **21 tables**, while the application database had **24**. A successful `pg_restore` exit was not sufficient evidence of a complete recovery.

**Investigation.** I compared table inventories, inspected the backup archive, and found the three missing tables were absent from the archive itself. I then traced the original `pg_dump` command to its container and checked the running PostgreSQL containers and their persistent volumes.

**Root cause.** Two PostgreSQL containers existed, each with a separate data volume. The dump was valid—but it came from an older database instance, not the one used by the production-style Compose stack.

**Resolution and validation.** I identified the correct Compose service/database, produced a backup from the intended instance and used table/schema checks during restore validation. The key verification was **source identity plus restored content**, not just command success.

**Lesson.** A backup is only useful when you can prove **which system it came from** and **that the data you need can be restored**. I now verify the source container, connection target and restore contents explicitly.
