MAKEFLAGS=+j2

init: 
	make create-strapi
	make -j2 deps
	make -j2 dev

mise:
	mise install

create-strapi:
	bun --production --silent create strapi-app@v4.22.1 strapi --quickstart --ts --no-run

#### DEPENDECIES ####

deps: deps-frontend deps-strapi

deps-frontend:
	cd frontend && bun --bun install

deps-strapi:
	cd strapi && bun install

#### DEVELOP ####

dev: dev-frontend dev-strapi

dev-frontend: 
	cd frontend && bun --bun run dev

dev-strapi:
	cd strapi && bun run develop
