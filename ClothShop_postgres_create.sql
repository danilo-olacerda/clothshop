CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT(30) NOT NULL,
	"email" TEXT(30) NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" float4 NOT NULL,
	"categorieId" serial NOT NULL,
	"mainPhotoId" serial NOT NULL,
	"photosIds" serial[] NOT NULL,
	"sizeId" serial NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"type" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"photoPath" TEXT NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"type" char NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"productId" serial NOT NULL,
	"quantity" int NOT NULL,
	"state" serial NOT NULL,
	"date" DATE NOT NULL,
	"adressId" serial NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.saleState" (
	"id" serial NOT NULL,
	"state" TEXT NOT NULL,
	CONSTRAINT "saleState_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adresses" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"adress" TEXT NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categorieId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("mainPhotoId") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("photosIds") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk3" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");




ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk2" FOREIGN KEY ("state") REFERENCES "saleState"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk3" FOREIGN KEY ("adressId") REFERENCES "adresses"("id");


ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");









