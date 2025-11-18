# ⚡ Quick Start - Get ClimaLogic Running in 2 Minutes

## 🎯 Fastest Way (No Database Required)

### 1. Install Dependencies

```bash
npm install
cd server && npm install && cd ..
```

### 2. Start Everything

**Option A: Start separately (recommended for first time)**

**Terminal 1:**
```bash
npm run dev
```

**Terminal 2:**
```bash
cd server
npm start
```

**Option B: Start together (requires concurrently package)**
```bash
npm install -g concurrently
npm run start:dev
```

### 3. Open Browser

Visit: **http://localhost:3000**

✅ **That's it!** The app is running.

---

## What You Get

- ✅ Frontend at http://localhost:3000
- ✅ Backend API at http://localhost:5000/api
- ✅ Works without MongoDB (uses mock data)
- ✅ All features functional except database persistence

---

## Troubleshooting

### Port Already in Use?

**Kill the process:**

**Windows:**
```powershell
netstat -ano | findstr :3000
taskkill /PID <PID> /F

netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

**Mac/Linux:**
```bash
lsof -ti:3000 | xargs kill -9
lsof -ti:5000 | xargs kill -9
```

### Module Not Found?

```bash
# Make sure you installed dependencies
npm install
cd server && npm install && cd ..
```

---

## Next: Add Database (Optional)

See `START_HERE.md` for full setup with MongoDB.

