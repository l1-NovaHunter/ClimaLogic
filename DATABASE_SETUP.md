# ClimaLogic Database Setup Guide

Complete guide to set up and configure the ClimaLogic database.

## Quick Start

1. **Choose your database option** (Local or Cloud)
2. **Install dependencies**: `cd server && npm install`
3. **Configure**: Copy `.env.example` to `.env` and update
4. **Initialize**: `npm run init-db`
5. **Seed (optional)**: `npm run seed`

## Database Options

### 🖥️ Option 1: Local MongoDB (Recommended for Development)

**Advantages:**
- Free
- Fast local access
- No internet required
- Full control

**Setup Steps:**

1. **Download MongoDB Community Edition**:
   - [Windows](https://www.mongodb.com/try/download/community)
   - [macOS](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/)
   - [Linux](https://www.mongodb.com/docs/manual/administration/install-on-linux/)

2. **Install MongoDB**:
   ```bash
   # macOS with Homebrew
   brew tap mongodb/brew
   brew install mongodb-community

   # Start MongoDB service
   brew services start mongodb-community
   ```

3. **Verify Installation**:
   ```bash
   mongosh
   # Should connect to MongoDB shell
   ```

4. **Configure in `.env`**:
   ```env
   MONGODB_LOCAL_URI=mongodb://localhost:27017/climalogic
   ```

### ☁️ Option 2: MongoDB Atlas (Recommended for Production)

**Advantages:**
- Managed service
- Free tier available
- Automatic backups
- Scalable
- No local installation needed

**Setup Steps:**

1. **Create Account**:
   - Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register)
   - Sign up for free

2. **Create Cluster**:
   - Click "Build a Database"
   - Choose FREE tier (M0)
   - Select cloud provider and region
   - Click "Create"

3. **Create Database User**:
   - Go to "Database Access"
   - Click "Add New Database User"
   - Choose "Password" authentication
   - Username: `climalogic`
   - Password: Generate secure password (save it!)
   - Database User Privileges: "Read and write to any database"
   - Click "Add User"

4. **Configure Network Access**:
   - Go to "Network Access"
   - Click "Add IP Address"
   - For development: Click "Allow Access from Anywhere" (0.0.0.0/0)
   - For production: Add specific IPs only
   - Click "Confirm"

5. **Get Connection String**:
   - Go to "Database"
   - Click "Connect" on your cluster
   - Choose "Connect your application"
   - Copy connection string
   - Replace `<password>` with your database user password

6. **Configure in `.env`**:
   ```env
   MONGODB_URI=mongodb+srv://climalogic:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/climalogic?retryWrites=true&w=majority
   ```

## Installation Steps

### 1. Install Server Dependencies

```bash
cd server
npm install
```

### 2. Configure Environment

```bash
# Copy example file
cp .env.example .env

# Edit .env with your settings
# Windows: notepad .env
# macOS/Linux: nano .env
```

**Required in `.env`**:
```env
# For Local MongoDB
MONGODB_LOCAL_URI=mongodb://localhost:27017/climalogic

# OR for MongoDB Atlas
MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/climalogic

# Server Port
PORT=5000

# CORS (Frontend URL)
CORS_ORIGIN=http://localhost:3000
```

### 3. Initialize Database

Creates collections and indexes:

```bash
npm run init-db
```

**Expected Output:**
```
🔧 Initializing database...
📑 Creating indexes...
   ✓ User indexes created
   ✓ Facility indexes created
   ✓ Calculation indexes created
   ✓ Conversation indexes created
✅ Database initialization completed!
```

### 4. Seed Sample Data (Optional)

Populates database with sample facilities and users:

```bash
npm run seed
```

**Expected Output:**
```
🌱 Starting database seeding...
🗑️  Clearing existing data...
✅ Existing data cleared

👤 Creating users...
✅ Created 3 users

🏭 Creating facilities...
✅ Created 5 facilities

📊 Creating sample calculations...
✅ Created 1 calculations

✅ Database seeding completed successfully!

🔑 Test Credentials:
   Email: demo@steelcorp.com
   Password: password123
```

## Verify Database Connection

### Check if MongoDB is Running

**Local MongoDB:**
```bash
mongosh
# or
mongo
```

**MongoDB Atlas:**
- Check cluster status in Atlas dashboard
- Should show "Active" status

### Test Database Connection

```bash
cd server
npm start
```

Look for:
```
✅ MongoDB connected successfully
📊 Database: climalogic
🌐 Host: localhost (or Atlas host)
```

### View Database Contents

**Using MongoDB Shell:**
```bash
mongosh climalogic

# Show collections
show collections

# View users
db.users.find().pretty()

# View facilities
db.facilities.find().pretty()

# Count documents
db.users.countDocuments()
db.facilities.countDocuments()
```

**Using MongoDB Compass** (GUI):
1. Download [MongoDB Compass](https://www.mongodb.com/products/compass)
2. Connect with connection string from `.env`
3. Browse collections and documents visually

## Database Collections

### `users`
- User accounts and authentication
- Preferences and subscriptions
- Indexed on: email, role, subscription plan

### `facilities`
- Industrial facilities with location data
- Energy consumption and emissions
- Geospatial index for map queries
- Indexed on: location (2dsphere), industryType, userId

### `calculations`
- Saved emission calculations
- Input data and results
- Indexed on: userId, facilityId, createdAt

### `conversations`
- AI chatbot conversations
- Message history and context
- Indexed on: userId, conversationId

## Troubleshooting

### ❌ "MongoDB connection error"

**Local MongoDB:**
- Check if MongoDB is running: `mongosh`
- Start MongoDB: `brew services start mongodb-community` (macOS)
- Check connection string in `.env`

**MongoDB Atlas:**
- Verify IP address is whitelisted
- Check username and password
- Verify connection string format
- Check cluster status in Atlas dashboard

### ❌ "Port 27017 already in use"

Another MongoDB instance is running. Options:
- Stop other instance
- Use different port: `mongod --port 27018`
- Update connection string in `.env`

### ❌ "Authentication failed"

**For Atlas:**
- Verify username and password in connection string
- Check database user permissions
- Ensure IP is whitelisted

### ❌ "Database not found"

The database will be created automatically on first connection. If issues persist:
- Manually create: `mongosh` → `use climalogic`
- Check connection string database name

## Production Checklist

- [ ] Use MongoDB Atlas (cloud managed)
- [ ] Set strong database user password
- [ ] Whitelist only production IPs
- [ ] Enable MongoDB Atlas backups
- [ ] Set up monitoring and alerts
- [ ] Use connection pooling
- [ ] Set JWT_SECRET to strong random value
- [ ] Enable SSL/TLS connections
- [ ] Regular database backups
- [ ] Monitor database size and performance

## Next Steps

1. ✅ Database is set up and initialized
2. ✅ Start backend server: `cd server && npm start`
3. ✅ Test API endpoints: `curl http://localhost:5000/api/health`
4. ✅ Connect frontend to backend
5. ✅ Start development!

## Support

For database issues:
- MongoDB Documentation: https://docs.mongodb.com/
- MongoDB Atlas Docs: https://docs.atlas.mongodb.com/
- MongoDB Community: https://community.mongodb.com/

