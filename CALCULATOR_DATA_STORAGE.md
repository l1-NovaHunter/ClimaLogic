# 📊 Calculator Data Storage - Complete Guide

## 🗄️ Where Calculator Data is Stored

### Database: MongoDB

Calculator data is stored in the **`calculations`** collection in MongoDB.

**Location Details:**
- **Database Name**: `climalogic` (configured in `server/.env`)
- **Collection**: `calculations`
- **Model File**: `server/database/models/Calculation.js`
- **API Endpoints**: `server/index.js` (lines 162-280)

---

## 📋 Data Structure

Each calculation document contains:

```javascript
{
  _id: ObjectId,                    // Unique calculation ID
  userId: ObjectId,                 // User who created this calculation
  facilityId: ObjectId,              // Optional: Linked facility
  facilityName: String,             // Facility name
  industryType: String,             // Industry type
  
  // Input data from calculator form
  inputData: {
    facilityName: String,
    industryType: String,
    facilitySize: String,
    location: String,
    electricity: Number,            // MWh
    naturalGas: Number,             // m³
    fuelOil: Number,               // liters
    renewableEnergy: Number,        // percentage
    production: Number,
    processType: String,
    additionalData: Mixed
  },
  
  // Calculated results
  results: {
    totalEmissions: Number,         // Total CO₂e in tons
    breakdown: {
      electricity: Number,
      naturalGas: Number,
      fuelOil: Number,
      process: Number,
      transportation: Number
    },
    intensity: Number,              // Emissions per unit
    treeEquivalent: Number,          // Trees needed to offset
    carbonCost: Number,              // Cost at current carbon price
    industryAverage: Number,
    vsAverage: Number,              // Percentage vs industry
    recommendations: [              // AI-generated recommendations
      {
        priority: "HIGH" | "MEDIUM" | "LOW",
        title: String,
        description: String,
        impact: {
          reduction: Number,
          percentage: Number
        },
        roi: Number,                // Payback period in months
        difficulty: "Easy" | "Medium" | "Hard",
        cost: String
      }
    ]
  },
  
  savedAt: Date,                    // When calculation was saved
  createdAt: Date,                  // Document creation time
  updatedAt: Date                   // Last update time
}
```

---

## 🔌 API Endpoints

### 1. Calculate Emissions
**POST** `/api/calculator/calculate`

**Request:**
```json
{
  "inputData": {
    "facilityName": "Steel Mill #1",
    "industryType": "Steel Manufacturing",
    "facilitySize": "large",
    "location": "Jamshedpur, Jharkhand",
    "electricity": 50000,
    "naturalGas": 2000000,
    "fuelOil": 500000,
    "renewableEnergy": 15,
    "production": 10000,
    "processType": "EAF"
  },
  "userId": "user_id_here",        // Optional if logged in
  "saveCalculation": true          // Save to database
}
```

**Response:**
```json
{
  "totalEmissions": 5475.5,
  "breakdown": {
    "electricity": 2200,
    "naturalGas": 1900,
    "fuelOil": 350,
    "process": 850,
    "transportation": 175.5
  },
  "intensity": 2.19,
  "treeEquivalent": 91258,
  "carbonCost": 273775,
  "industryAverage": 4800,
  "vsAverage": 14.07,
  "recommendations": [...],
  "calculationId": "calculation_id_if_saved"
}
```

### 2. Save Calculation
**POST** `/api/calculator/save`

**Request:**
```json
{
  "userId": "user_id_here",
  "inputData": { ... },
  "results": { ... }
}
```

**Response:**
```json
{
  "success": true,
  "calculationId": "calculation_id",
  "message": "Calculation saved successfully"
}
```

### 3. Get Calculation History
**GET** `/api/calculator/history?userId=user_id`

**Response:**
```json
[
  {
    "_id": "calculation_id",
    "facilityName": "Steel Mill #1",
    "industryType": "Steel Manufacturing",
    "results": {
      "totalEmissions": 5475.5
    },
    "createdAt": "2025-01-15T10:30:00Z"
  },
  ...
]
```

### 4. Get Single Calculation
**GET** `/api/calculator/:id`

**Response:**
```json
{
  "_id": "calculation_id",
  "inputData": { ... },
  "results": { ... },
  "createdAt": "2025-01-15T10:30:00Z"
}
```

### 5. Delete Calculation
**DELETE** `/api/calculator/:id`

**Response:**
```json
{
  "success": true,
  "message": "Calculation deleted"
}
```

---

## 📍 File Locations

| Component | File Path |
|-----------|-----------|
| **Database Model** | `server/database/models/Calculation.js` |
| **API Routes** | `server/index.js` (lines 162-280) |
| **Frontend Component** | `src/pages/Calculator.jsx` |
| **Form Component** | `src/components/calculator/CalculatorForm.jsx` |
| **Results Component** | `src/components/calculator/CalculatorResults.jsx` |
| **Database Config** | `server/database/config.js` |

---

## 🔍 Current Status

### ✅ What's Ready:
- ✅ Database model defined (`Calculation.js`)
- ✅ API endpoints implemented
- ✅ Database connection configured
- ✅ Seed data script ready

### ⚠️ What Needs Connection:
- ⚠️ Frontend currently uses **mock data** (not calling backend)
- ⚠️ Need to connect frontend to API endpoints
- ⚠️ Need user authentication to save calculations

---

## 🔗 How to Connect Frontend to Backend

### Step 1: Update Calculator.jsx

Replace the mock calculation with API call:

```javascript
// In src/pages/Calculator.jsx
const handleCalculate = async (formData) => {
  setIsCalculating(true)
  
  try {
    const response = await fetch('http://localhost:5000/api/calculator/calculate', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        inputData: formData,
        userId: currentUserId, // Get from auth context
        saveCalculation: true
      })
    })
    
    const results = await response.json()
    setResults(results)
  } catch (error) {
    console.error('Calculation error:', error)
    // Fallback to mock data if API fails
  } finally {
    setIsCalculating(false)
  }
}
```

### Step 2: Add Save Functionality

In `CalculatorResults.jsx`, connect the "Save Calculation" button:

```javascript
const handleSave = async () => {
  try {
    const response = await fetch('http://localhost:5000/api/calculator/save', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        userId: currentUserId,
        inputData: formData,
        results: results
      })
    })
    
    const data = await response.json()
    if (data.success) {
      alert('Calculation saved successfully!')
    }
  } catch (error) {
    console.error('Save error:', error)
  }
}
```

---

## 🗄️ Viewing Stored Data

### Using MongoDB Shell

```bash
# Connect to MongoDB
mongosh climalogic

# View all calculations
db.calculations.find().pretty()

# Find by user
db.calculations.find({ userId: ObjectId("user_id") })

# Find recent calculations
db.calculations.find().sort({ createdAt: -1 }).limit(10)

# Find by industry
db.calculations.find({ industryType: "Steel Manufacturing" })

# Find high emissions
db.calculations.find({ "results.totalEmissions": { $gt: 10000 } })
```

### Using MongoDB Compass

1. Connect to MongoDB (local or Atlas)
2. Navigate to `climalogic` database
3. Open `calculations` collection
4. Browse documents with GUI

---

## 📊 Database Indexes

For efficient queries, indexes are created on:
- `userId` + `createdAt` (for user's calculation history)
- `facilityId` (for facility-linked calculations)
- `industryType` (for industry-based queries)

---

## 🔐 Security Notes

- Calculations are **user-specific** (userId required)
- Users can only access their own calculations
- Data is stored securely in MongoDB
- Input validation on API endpoints
- Rate limiting recommended for production

---

## 🚀 Next Steps

1. ✅ Database model ready
2. ✅ API endpoints ready
3. ⏳ Connect frontend to API
4. ⏳ Add user authentication
5. ⏳ Add calculation history UI
6. ⏳ Add export functionality
7. ⏳ Add calculation comparison features

---

## 💡 Quick Reference

**Database**: MongoDB  
**Collection**: `calculations`  
**Model**: `server/database/models/Calculation.js`  
**API Base**: `http://localhost:5000/api/calculator`  
**Main Endpoint**: `POST /api/calculator/calculate`
