BEGIN TRANSACTION;

-- on commence par détruire toutes les tables si elles existent
DROP TABLE IF EXISTS "posts", "categories", "users", "roles";

-- et c'est parti, on créé les tables


CREATE TABLE "categories" (
    "id" integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" text UNIQUE NOT NULL,
    "description" text,
    "image" text,
    "enabled" integer NOT NULL DEFAULT(1),
    "created_at" timestamptz NOT NULL DEFAULT NOW(),
    "updated_at" timestamptz
);

CREATE TABLE "roles" (
    "id"  integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" text NOT NULL,
    "level" integer NOT NULL,
    "created_at" timestamptz NULL DEFAULT NOW(),
    "updated_at" timestamptz NULL
);

CREATE TABLE "users" (
    "id" integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "first_name" text NOT NULL,
    "last_name" text NOT NULL,
    "email" text NOT NULL,
    "token" varchar(64) DEFAULT NULL,
    "last_ping" date DEFAULT NULL,
    "enabled" integer NOT NULL DEFAULT(1),
    "role_id" integer NOT NULL REFERENCES roles(id),
    "created_at" timestamptz NULL DEFAULT NOW(),
    "updated_at" timestamptz NULL
);

CREATE TABLE "posts" (
    "id" integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL,
    "description_courte" text,
    "description_longue" text,
    "image" text,
    "user_id"  integer REFERENCES users(id),
    "category_id" integer NOT NULL REFERENCES categories(id),
    "created_at" timestamptz NOT NULL DEFAULT NOW(),
    "updated_at" timestamptz
);

COMMIT;