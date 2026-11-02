.PHONY: setup start

# Se puede repetir: no pisa un .env existente ni rota un APP_KEY ya generado.
setup:
	cd backend && npm install
	cd frontend && npm install
	cd backend && { test -f .env || cp .env.example .env; }
	cd backend && { grep -Eq '^APP_KEY=.+' .env || node ace generate:key; }
	cd backend && node ace migration:run

# Levanta los dos servidores. Con Ctrl-C, o si termina uno, para el otro.
# La parada usa SIGINT porque `ace serve --hmr` ignora SIGTERM. Si el backend
# falla al arrancar no termina: se queda vigilando archivos hasta el siguiente
# cambio, con el error en la salida.
start:
	@trap 'trap "" EXIT INT TERM; kill -INT 0' EXIT INT TERM; \
	(cd backend && npm run dev) & backend=$$!; \
	(cd frontend && npm run dev) & frontend=$$!; \
	while kill -0 $$backend 2>/dev/null && kill -0 $$frontend 2>/dev/null; do \
		sleep 1; \
	done
