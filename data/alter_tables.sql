/* Ajout d une colonne image  */
ALTER TABLE "coffee"
ADD COLUMN "image" VARCHAR(255);

/* Créer une relation entre image et reference comme le nom est commun */
UPDATE "coffee"
SET "image" = CONCAT("reference", '.png');