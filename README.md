# ClimaLogic - Industrial Emission Monitoring Platform

A comprehensive, production-ready web platform for monitoring, predicting, and reducing industrial emissions in real-time.

## Features

### 🏠 Landing Page
- **Hero Section**: Animated gradient background with compelling CTAs
- **Social Proof**: Company logos, testimonials, and key metrics
- **Stats Banner**: Eye-catching statistics about global emissions
- **Features**: Six key features with icons and descriptions
- **How It Works**: Four-step process visualization
- **Pricing**: Three-tier pricing plans with highlighted "Professional" option
- **FAQ**: Expandable accordion with common questions
- **Final CTA**: Dark gradient section with particle animations

### 🧮 Industrial Emission Calculator
- **Multi-Section Form**: 
  - Facility information (name, industry, size, location)
  - Energy consumption (electricity, natural gas, fuel oil, renewable energy)
  - Industry-specific production metrics
- **Real-Time Results**:
  - Total emissions with animated counter
  - Industry comparison charts
  - Pie and bar charts showing emission breakdown
  - Key metrics (intensity, carbon offset, cost)
  - Personalized recommendations with ROI calculations
- **Export Options**: Download report, share results, save calculation

### 🗺️ 3D Interactive Heatmap
- **India Map**: Full country view with 3D pins
- **Facility Pins**: Color-coded by industry type with height based on emissions
- **Interactive Features**:
  - Hover tooltips with facility details
  - Click to view detailed information
  - Filter by industry type
  - Real-time statistics panel
- **Map Controls**: Zoom, pan, reset view, toggle 2D/3D

### 🤖 AI Chatbot
- **Gemini-Powered**: Google Gemini AI integration for intelligent responses
- **Context-Aware**: Remembers conversation and page context
- **Quick Suggestions**: Pre-filled questions for common queries
- **Markdown Support**: Rich text formatting in responses
- **Floating Widget**: Always accessible from any page

### 🎨 Design System
- **Theme Toggle**: Light and dark mode with smooth transitions
- **Animated Backgrounds**: Gradient animations for visual appeal
- **Glassmorphism**: Modern glass effects on cards and panels
- **Responsive Design**: Mobile, tablet, and desktop optimized
- **Smooth Animations**: Framer Motion for page transitions and interactions

## Technology Stack

### Frontend
- **React 18+** with Vite
- **React Router** for navigation
- **Tailwind CSS** for styling
- **Framer Motion** for animations
- **Recharts** for data visualization
- **Mapbox GL JS** for interactive maps
- **React Markdown** for chatbot responses

### Backend (Ready for Integration)
- **Node.js + Express.js**
- **MongoDB** for data storage
- **Socket.io** for real-time updates
- **JWT** for authentication
- **Google Gemini API** for AI chatbot

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ClimaLogic2.o
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   Create a `.env` file in the root directory:
   ```env
   VITE_MAPBOX_TOKEN=your_mapbox_token_here
   VITE_API_URL=http://localhost:5000/api
   ```

4. **Start development server**
   ```bash
   npm run dev
   ```

5. **Build for production**
   ```bash
   npm run build
   ```

## Project Structure

```
ClimaLogic2.o/
├── src/
│   ├── components/
│   │   ├── calculator/
│   │   │   ├── CalculatorForm.jsx
│   │   │   └── CalculatorResults.jsx
│   │   ├── home/
│   │   │   ├── Hero.jsx
│   │   │   ├── SocialProof.jsx
│   │   │   ├── StatsBanner.jsx
│   │   │   ├── Features.jsx
│   │   │   ├── HowItWorks.jsx
│   │   │   ├── Pricing.jsx
│   │   │   ├── FAQ.jsx
│   │   │   └── FinalCTA.jsx
│   │   ├── Navigation.jsx
│   │   ├── Footer.jsx
│   │   └── Chatbot.jsx
│   ├── contexts/
│   │   └── ThemeContext.jsx
│   ├── pages/
│   │   ├── Home.jsx
│   │   ├── Calculator.jsx
│   │   └── Heatmap.jsx
│   ├── App.jsx
│   ├── main.jsx
│   └── index.css
├── index.html
├── package.json
├── vite.config.js
├── tailwind.config.js
└── README.md
```

## Environment Variables

Required environment variables:

- `VITE_MAPBOX_TOKEN`: Your Mapbox access token for the heatmap
- `VITE_API_URL`: Backend API URL (default: http://localhost:5000/api)

## Features in Detail

### Theme System
- Automatic dark/light mode detection
- Smooth color transitions (0.5s)
- LocalStorage persistence
- Glassmorphism effects adapt to theme

### Calculator
- Industry-specific emission factors
- Real-time calculations
- Visual breakdowns (charts)
- Actionable recommendations
- Export capabilities

### Heatmap
- Interactive 3D visualization
- Real-time data updates (ready for Socket.io)
- Filterable by industry and emissions range
- Facility details on click
- Statistics panel

### Chatbot
- Context-aware responses
- Conversation history
- Quick suggestion buttons
- Markdown formatting
- Mobile-optimized interface

## Deployment

### Frontend (Vercel)
1. Connect GitHub repository
2. Framework: Vite
3. Build command: `npm run build`
4. Output directory: `dist`
5. Add environment variables

### Backend (Railway/Heroku)
1. Connect GitHub repository
2. Add Node.js buildpack
3. Set environment variables
4. Start command: `node server/index.js`

### Database (MongoDB Atlas)
1. Create free cluster
2. Whitelist IP (0.0.0.0/0 for all)
3. Create database user
4. Copy connection string to `.env`

## Future Enhancements

- [ ] Backend API integration
- [ ] User authentication system
- [ ] Saved calculations in dashboard
- [ ] Real-time emission monitoring
- [ ] PDF report generation
- [ ] Email sharing functionality
- [ ] Advanced filtering on heatmap
- [ ] More industry-specific calculators

## License

This project is proprietary and confidential.

## Support

For questions or support, please contact the development team.

