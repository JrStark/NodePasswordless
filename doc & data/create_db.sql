BEGIN TRANSACTION;

-- on commence par détruire toutes les tables si elles existent
DROP TABLE IF EXISTS "post", "category", "users";

-- et c'est parti, on créé les tables
CREATE TABLE "posts" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description_courte" TEXT,
    "description_longue" TEXT,
    "image" TEXT,
    "enabled" INT NOT NULL DEFAULT "1",
    "user_id"  INT REFERENCES users(id),
    "category_id" INT NOT NULL REFERENCES category(id),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "categories" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL,
    "description" TEXT,
    "image" TEXT,
    "enabled" INT NOT NULL DEFAULT "1",
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "users" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" VARCHAR(64) COLLATE DEFAULT NULL,
    "last_ping" DATETIME DEFAULT NULL,
    "enabled" INT NOT NULL DEFAULT "1",
    "role_id" INT NOT NULL REFERENCES role(id),
    "created_at" TIMESTAMPTZ NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NULL,
);

CREATE TABLE "roles" (
    "id"  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "level" INT NOT NULL,
    "created_at" TIMESTAMPTZ NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NULL,
);

COMMIT;