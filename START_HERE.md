# 🚀 Quick Start Guide - Run ClimaLogic Locally

## Prerequisites

- **Node.js** (v18 or higher) - [Download](https://nodejs.org/)
- **npm** (comes with Node.js)

## Option 1: Run Without Database (Simplest - Recommended for First Time)

The application can run without MongoDB for testing the frontend and basic API.

### Step 1: Install Dependencies

```bash
# Install frontend dependencies
npm install

# Install server dependencies
cd server
npm install
cd ..
```

### Step 2: Start the Frontend

Open a terminal and run:

```bash
npm run dev
```

The frontend will start at: **http://localhost:3000**

### Step 3: Start the Backend (in a new terminal)

```bash
cd server
npm start
```

The backend will start at: **http://localhost:5000**

**Note:** The server will continue without MongoDB and use mock data.

### ✅ Done!

- Frontend: http://localhost:3000
- Backend API: http://localhost:5000/api
- Health Check: http://localhost:5000/api/health

---

## Option 2: Run With Local MongoDB (Full Features)

### Step 1: Install MongoDB

**Windows:**
1. Download from [MongoDB Community Server](https://www.mongodb.com/try/download/community)
2. Install MongoDB
3. MongoDB usually starts automatically as a service

**macOS:**
```bash
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community
```

**Linux:**
Follow [MongoDB Installation Guide](https://www.mongodb.com/docs/manual/administration/install-on-linux/)

### Step 2: Verify MongoDB is Running

```bash
mongosh
# or
mongo
```

If it connects, MongoDB is running! Type `exit` to quit.

### Step 3: Install Dependencies

```bash
npm install
cd server
npm install
cd ..
```

### Step 4: Initialize Database

```bash
cd server
npm run init-db
npm run seed  # Optional: Add sample data
cd ..
```

### Step 5: Start Both Servers

**Terminal 1 - Frontend:**
```bash
npm run dev
```

**Terminal 2 - Backend:**
```bash
cd server
npm start
```

### ✅ Done with Database!

---

## Troubleshooting

### ❌ "Cannot find module" errors

```bash
# Make sure all dependencies are installed
npm install
cd server && npm install && cd ..
```

### ❌ Port 3000 or 5000 already in use

**Change port for frontend:**
- Edit `vite.config.js` and change `port: 3000` to another port

**Change port for backend:**
- Edit `server/.env` and change `PORT=5000` to another port
- Update `vite.config.js` proxy target to match

### ❌ MongoDB connection errors

If you see MongoDB errors but want to continue anyway:
- The server will run without MongoDB automatically
- Or comment out the MongoDB connection in `server/index.js`

### ❌ "EADDRINUSE" error

A process is already using the port. Options:

**Windows:**
```powershell
# Find process using port 3000
netstat -ano | findstr :3000
# Kill the process (replace PID with actual process ID)
taskkill /PID <PID> /F

# Find process using port 5000
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

**macOS/Linux:**
```bash
# Find and kill process on port 3000
lsof -ti:3000 | xargs kill -9

# Find and kill process on port 5000
lsof -ti:5000 | xargs kill -9
```

### ❌ Module not found errors

Make sure you're in the correct directory:
- Root directory for frontend: `npm run dev`
- Server directory for backend: `cd server && npm start`

---

## Development Scripts

### Frontend (root directory)

```bash
npm run dev      # Start development server
npm run build    # Build for production
npm run preview  # Preview production build
```

### Backend (server directory)

```bash
npm start        # Start server
npm run dev      # Start with auto-reload (nodemon)
npm run init-db   # Initialize database
npm run seed      # Seed sample data
```

---

## What to Expect

When everything is running:

1. **Frontend** (http://localhost:3000):
   - Beautiful landing page
   - Calculator page
   - Heatmap (requires Mapbox token for full functionality)
   - AI Chatbot (mock responses without Gemini API)

2. **Backend** (http://localhost:5000):
   - API endpoints available
   - Health check: http://localhost:5000/api/health
   - Facilities: http://localhost:5000/api/facilities

---

## Environment Variables

### Frontend (.env in root)
```env
VITE_API_URL=http://localhost:5000/api
VITE_MAPBOX_TOKEN=your_mapbox_token_here  # Optional
```

### Backend (server/.env)
```env
PORT=5000
MONGODB_LOCAL_URI=mongodb://localhost:27017/climalogic  # Optional
CORS_ORIGIN=http://localhost:3000
```

**Note:** The `.env` files are already created. Edit them if needed.

---

## Next Steps

1. ✅ Application is running!
2. Visit http://localhost:3000
3. Explore the calculator
4. Check the heatmap
5. Try the AI chatbot

For full features with database:
- See `DATABASE_SETUP.md` for detailed database setup
- Run `npm run seed` in server directory to add sample data

---

## Need Help?

- Check `DATABASE_SETUP.md` for database setup
- Check `README.md` for full documentation
- Check `server/README.md` for backend details

