#!/bin/bash

echo " Starting Banco services..."

# Check if submodules are initialized
if [ ! -f "banco-back/package.json" ] || [ ! -f "banco-front/package.json" ]; then
    echo "  Initializing submodules..."
    git submodule update --init --recursive
fi

# Build and start containers
docker compose up --build -d

echo "Services started successfully"
echo "Frontend: http://localhost"
echo "Backend: http://localhost:3002/bp"
echo ""
echo "To view logs: docker compose logs -f"
echo "To stop: ./stop.sh"
