-- CreateTable
CREATE TABLE "FeatureFlag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "key" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Persona" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "country" TEXT,
    "age" INTEGER,
    "premium" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "PersonaFlag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "personaId" INTEGER NOT NULL,
    "flagId" INTEGER NOT NULL,
    "variant" TEXT NOT NULL DEFAULT 'on',
    CONSTRAINT "PersonaFlag_personaId_fkey" FOREIGN KEY ("personaId") REFERENCES "Persona" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PersonaFlag_flagId_fkey" FOREIGN KEY ("flagId") REFERENCES "FeatureFlag" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "FeatureFlag_key_key" ON "FeatureFlag"("key");

-- CreateIndex
CREATE UNIQUE INDEX "PersonaFlag_personaId_flagId_key" ON "PersonaFlag"("personaId", "flagId");
