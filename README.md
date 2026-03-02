# Banco Deploy

Complete banking application project with frontend (Angular) and backend (Node.js/Express).

## 📋 Requirements

- Docker
- Docker Compose
- Git

## 🚀 Quick Start

### 1. Clone the repository with submodules

```bash
git clone --recurse-submodules <repository-url>
cd banco-deploy
```

If you already cloned the repository without submodules:

```bash
git submodule update --init --recursive
```

### 2. Grant execution permissions to scripts

```bash
chmod +x start.sh stop.sh logs.sh restart.sh
```

### 3. Start the services

```bash
./start.sh
```

## 🛠️ Available Scripts

### `./start.sh`
Starts all services (backend and frontend) in Docker containers.

### `./stop.sh`
Stops all services.

### `./restart.sh`
Restarts all services without rebuilding images.

### `./logs.sh [service]`
Shows service logs.

```bash
# View logs for all services
./logs.sh

# View logs for backend only
./logs.sh banco-back

# View logs for frontend only
./logs.sh banco-front
```

## 🌐 Service Access

- **Frontend**: http://localhost
- **Backend API**: http://localhost:3002/bp

## 📦 Project Structure

```
banco-deploy/
├── banco-back/          # Submodule: Backend (Node.js + Express)
├── banco-front/         # Submodule: Frontend (Angular)
├── docker-compose.yml   # Docker Compose configuration
├── start.sh            # Script to start services
├── stop.sh             # Script to stop services
├── restart.sh          # Script to restart services
├── logs.sh             # Script to view logs
└── README.md           # This file
```

## 🐳 Manual Docker Compose Commands

If you prefer to use Docker Compose directly:

```bash
# Start services
docker compose up -d

# Start with rebuild
docker compose up --build -d

# Stop services
docker compose down

# View logs
docker compose logs -f

# Restart services
docker compose restart

# View service status
docker compose ps
```

## 🔧 Local Development (without Docker)

### Backend

```bash
cd banco-back
npm install
npm run start:dev
```

### Frontend

```bash
cd banco-front
npm install
npm start
```

## 🆘 Troubleshooting

### Submodules are empty
```bash
git submodule update --init --recursive
```

### Port in use
If ports 80 or 3002 are occupied, modify the `docker-compose.yml` file:

```yaml
ports:
  - "8080:80"    # For frontend
  - "3003:3002"  # For backend
```

### Rebuild images from scratch
```bash
docker compose down
docker compose build --no-cache
docker compose up -d
```

### Clean containers and volumes
```bash
docker compose down -v
docker system prune -a
```

## 📝 Notes

- Backend runs on port 3002
- Frontend runs on port 80 (HTTP)
- Both services are connected through a Docker network called `banco-network`
- Containers restart automatically if they fail (`restart: unless-stopped`)
