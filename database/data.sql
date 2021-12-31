drop schema "public" cascade;
create schema "public";
CREATE TABLE "users" (
	"userId" serial NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"horoscope" TEXT NOT NULL,
	"bio" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "solutions" (
	"solutionId" serial NOT NULL,
	"locations" text NOT NULL,
	"locationsRotate90" text NOT NULL,
	"locationsRotate180" text NOT NULL,
	"locationsRotate270" text NOT NULL,
	CONSTRAINT "solutions_pk" PRIMARY KEY ("solutionId")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "usersSolutions" (
	"userId" integer NOT NULL,
	"solutionId" integer NOT NULL,
	CONSTRAINT "usersSolutions_pk" PRIMARY KEY ("userId","solutionId")
) WITH (
  OIDS=FALSE
);
ALTER TABLE "usersSolutions" ADD CONSTRAINT "usersSolutions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
ALTER TABLE "usersSolutions" ADD CONSTRAINT "usersSolutions_fk1" FOREIGN KEY ("solutionId") REFERENCES "solutions"("solutionId");
