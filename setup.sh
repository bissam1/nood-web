#!/bin/bash

# Navigate to or create the project directory
mkdir -p /workspaces/nood-web
cd /workspaces/nood-web || exit

# Create directory structure
mkdir -p .github/workflows assets components pages styles data

# Create all files
touch .github/workflows/vercel.yml
touch assets/placeholder-video.mp4
touch components/AnimatedNav.jsx components/CustomCursor.jsx components/HeroSection.jsx components/ParallaxVideoBackground.jsx components/Preloader.jsx components/ContactForm.jsx components/Footer.jsx components/Button.jsx components/utils.js components/PropertyCard.jsx components/PropertyList.jsx components/SearchBar.jsx components/AIChatbot.jsx
touch pages/UnitedArabEmirates.jsx pages/UnitedKingdom.jsx pages/UnitedStates.jsx pages/Russia.jsx pages/Pakistan.jsx
touch styles/globals.css
touch data/properties.json data/chatbotResponses.json
touch .gitignore App.jsx main.jsx Attributions.md README.md package.json package-lock.json vercel.json vite.config.js .env

# Populate files with content
cat > package.json << 'EOF'
{
  "name": "nood-web",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-router-dom": "^6.27.0",
    "framer-motion": "^12.0.0",
    "lucide-react": "^0.453.0",
    "clsx": "^2.1.1",
    "tailwind-merge": "^2.5.4",
    "react-ga4": "^2.1.0"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.3.2",
    "vite": "^5.4.9",
    "tailwindcss": "^3.4.14",
    "autoprefixer": "^10.4.20",
    "postcss": "^8.4.47"
  }
}
EOF

cat > App.jsx << 'EOF'
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { AnimatedNav } from "./components/AnimatedNav";
import { CustomCursor } from "./components/CustomCursor";
import { HeroSection } from "./components/HeroSection";
import { ParallaxVideoBackground } from "./components/ParallaxVideoBackground";
import { Preloader } from "./components/Preloader";
import { ContactForm } from "./components/ContactForm";
import { Footer } from "./components/Footer";
import { SearchBar } from "./components/SearchBar";
import { PropertyList } from "./components/PropertyList";
import { AIChatbot } from "./components/AIChatbot";
import UnitedArabEmirates from "./pages/UnitedArabEmirates";
import UnitedKingdom from "./pages/UnitedKingdom";
import UnitedStates from "./pages/UnitedStates";
import Russia from "./pages/Russia";
import Pakistan from "./pages/Pakistan";
import "./styles/globals.css";

function App() {
  return (
    <Router>
      <Preloader />
      <CustomCursor />
      <AnimatedNav isVisible={true} />
      <AIChatbot />
      <Routes>
        <Route
          path="/"
          element={
            <>
              <HeroSection />
              <SearchBar />
              <ParallaxVideoBackground />
              <PropertyList />
              <ContactForm />
              <Footer />
            </>
          }
        />
        <Route path="/UnitedArabEmirates" element={<UnitedArabEmirates />} />
        <Route path="/UnitedKingdom" element={<UnitedKingdom />} />
        <Route path="/UnitedStates" element={<UnitedStates />} />
        <Route path="/Russia" element={<Russia />} />
        <Route path="/Pakistan" element={<Pakistan />} />
      </Routes>
    </Router>
  );
}

export default App;
EOF

cat > main.jsx << 'EOF'
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";
import "./styles/globals.css";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>
);
EOF

cat > styles/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --primary: #1E3A8A;
  --secondary: #F59E0B;
  --background: #0F172A;
  --card: #1E293B;
  --card-foreground: #F1F5F9;
  --border: #334155;
  --muted-foreground: #94A3B8;
  --accent: #1E40AF;
  --destructive: #DC2626;
  --ring: #2563EB;
}

body {
  @apply bg-background text-card-foreground;
}

.gradient-bg {
  background: linear-gradient(135deg, #1E3A8A 0%, #4B0082 100%);
}
EOF

cat > components/AnimatedNav.jsx << 'EOF'
import { motion } from "framer-motion";
import { Button } from "./Button";
import { Building2, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";

function AnimatedNav({ isVisible }) {
  const navItems = [
    { label: "Overview", href: "/#overview" },
    { label: "Properties", href: "/#properties" },
    { label: "Services", href: "/#services" },
    { label: "Markets", href: "/#markets" },
    { label: "About NOOD", href: "/#about" },
  ];

  return (
    <motion.nav
      className="fixed top-0 left-0 right-0 z-50 px-6 py-6"
      initial={{ y: -100, opacity: 0 }}
      animate={isVisible ? { y: 0, opacity: 1 } : { y: -100, opacity: 0 }}
      transition={{ duration: 0.8, delay: 0.5 }}
    >
      <div className="flex items-center justify-between backdrop-blur-md bg-black/20 rounded-2xl px-8 py-4 border border-white/10">
        <motion.div
          className="flex items-center space-x-3"
          initial={{ x: -50, opacity: 0 }}
          animate={isVisible ? { x: 0, opacity: 1 } : { x: -50, opacity: 0 }}
          transition={{ duration: 0.6, delay: 0.7 }}
        >
          <motion.div
            className="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center shadow-lg"
            whileHover={{ scale: 1.05, rotate: 5 }}
            transition={{ type: "spring", stiffness: 300 }}
          >
            <Building2 className="w-6 h-6 text-white" />
          </motion.div>
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 1 }}
          >
            <div className="text-white font-bold text-xl">NOOD</div>
            <div className="text-gray-300 text-xs tracking-wider">PROPERTIES</div>
          </motion.div>
        </motion.div>
        <motion.div
          className="hidden md:flex items-center space-x-8"
          initial={{ opacity: 0 }}
          animate={isVisible ? { opacity: 1 } : { opacity: 0 }}
          transition={{ duration: 0.6, delay: 0.9 }}
        >
          {navItems.map((item, index) => (
            <motion.a
              key={item.label}
              href={item.href}
              className="text-gray-300 hover:text-white transition-colors relative group"
              initial={{ y: -20, opacity: 0 }}
              animate={isVisible ? { y: 0, opacity: 1 } : { y: -20, opacity: 0 }}
              transition={{ duration: 0.5, delay: 0.9 + index * 0.1 }}
              whileHover={{ y: -2 }}
              data-cursor="hover"
            >
              {item.label}
              <motion.div
                className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-blue-500 to-purple-600 group-hover:w-full"
                transition={{ duration: 0.3 }}
              />
            </motion.a>
          ))}
        </motion.div>
        <motion.div
          initial={{ x: 50, opacity: 0 }}
          animate={isVisible ? { x: 0, opacity: 1 } : { x: 50, opacity: 0 }}
          transition={{ duration: 0.6, delay: 1.1 }}
        >
          <Button
            className="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 border-0 text-white px-6 py-2"
            data-cursor="hover"
          >
            Get Started
            <ArrowRight className="w-4 h-4 ml-2" />
          </Button>
        </motion.div>
      </div>
    </motion.nav>
  );
}

export default AnimatedNav;
EOF

cat > components/CustomCursor.jsx << 'EOF'
import { useEffect, useState } from "react";
import { motion } from "framer-motion";

function CustomCursor() {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });
  const [isHovering, setIsHovering] = useState(false);

  useEffect(() => {
    const moveCursor = (e) => {
      setMousePosition({ x: e.clientX, y: e.clientY });
    };

    const hoverElements = document.querySelectorAll('[data-cursor="hover"]');
    hoverElements.forEach((el) => {
      el.addEventListener("mouseenter", () => setIsHovering(true));
      el.addEventListener("mouseleave", () => setIsHovering(false));
    });

    document.addEventListener("mousemove", moveCursor);
    return () => {
      document.removeEventListener("mousemove", moveCursor);
      hoverElements.forEach((el) => {
        el.removeEventListener("mouseenter", () => setIsHovering(true));
        el.removeEventListener("mouseleave", () => setIsHovering(false));
      });
    };
  }, []);

  return (
    <motion.div
      className="fixed pointer-events-none z-50"
      style={{ x: mousePosition.x - 12, y: mousePosition.y - 12 }}
      animate={{
        scale: isHovering ? 2 : 1,
        backgroundColor: isHovering ? "#2563EB" : "#F59E0B",
      }}
      transition={{ type: "spring", stiffness: 500, damping: 28 }}
    >
      <div className="w-6 h-6 rounded-full bg-secondary opacity-80" />
    </motion.div>
  );
}

export default CustomCursor;
EOF

cat > components/HeroSection.jsx << 'EOF'
import { motion } from "framer-motion";
import { Button } from "./Button";
import { Link } from "react-router-dom";

function HeroSection() {
  return (
    <motion.section
      className="gradient-bg text-white py-24 text-center relative overflow-hidden"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 1 }}
    >
      <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
      <motion.h1
        className="text-5xl md:text-6xl font-bold tracking-tight"
        initial={{ y: 50, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.2 }}
      >
        NOOD International Properties
      </motion.h1>
      <motion.p
        className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
        initial={{ y: 50, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.4 }}
      >
        Redefining luxury and transparency in global property investment. Discover premium properties in Abu Dhabi and beyond.
      </motion.p>
      <motion.div
        initial={{ y: 50, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.8, delay: 0.6 }}
      >
        <Button
          as={Link}
          to="/UnitedArabEmirates"
          className="mt-8 bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white px-8 py-3 text-lg"
          data-cursor="hover"
        >
          Explore Abu Dhabi
        </Button>
      </motion.div>
    </motion.section>
  );
}

export default HeroSection;
EOF

cat > components/ParallaxVideoBackground.jsx << 'EOF'
import { motion, useScroll, useTransform } from "framer-motion";

function ParallaxVideoBackground() {
  const { scrollY } = useScroll();
  const y = useTransform(scrollY, [0, 500], [0, -100]);

  return (
    <motion.div
      className="relative h-96 overflow-hidden my-12"
      style={{ y }}
    >
      <video
        autoPlay
        loop
        muted
        className="absolute top-0 left-0 w-full h-full object-cover"
      >
        <source src="/assets/placeholder-video.mp4" type="video/mp4" />
      </video>
      <motion.div
        className="absolute inset-0 bg-black/50 flex items-center justify-center"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1 }}
      >
        <motion.h2
          className="text-white text-3xl md:text-4xl font-bold"
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.5 }}
        >
          Experience Luxury with NOOD
        </motion.h2>
      </motion.div>
    </motion.div>
  );
}

export default ParallaxVideoBackground;
EOF

cat > components/Preloader.jsx << 'EOF'
import { useEffect, useState } from "react";
import { motion } from "framer-motion";

function Preloader() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => setIsLoading(false), 2000);
    return () => clearTimeout(timer);
  }, []);

  if (!isLoading) return null;

  return (
    <motion.div
      className="fixed inset-0 gradient-bg flex items-center justify-center z-50"
      initial={{ opacity: 1 }}
      animate={{ opacity: isLoading ? 1 : 0 }}
      transition={{ duration: 0.5 }}
    >
      <motion.div
        className="flex space-x-2"
        animate={{ scale: [1, 1.2, 1] }}
        transition={{ repeat: Infinity, duration: 1.2 }}
      >
        <motion.div className="w-4 h-4 bg-secondary rounded-full" />
        <motion.div
          className="w-4 h-4 bg-secondary rounded-full"
          animate={{ scale: [1.2, 1, 1.2] }}
          transition={{ repeat: Infinity, duration: 1.2, delay: 0.2 }}
        />
        <motion.div
          className="w-4 h-4 bg-secondary rounded-full"
          animate={{ scale: [1, 1.2, 1] }}
          transition={{ repeat: Infinity, duration: 1.2, delay: 0.4 }}
        />
      </motion.div>
    </motion.div>
  );
}

export default Preloader;
EOF

cat > components/ContactForm.jsx << 'EOF'
import { motion } from "framer-motion";
import { Button } from "./Button";

function ContactForm() {
  return (
    <motion.section
      className="py-16 bg-card text-card-foreground"
      initial={{ opacity: 0, y: 50 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8 }}
    >
      <div className="container mx-auto px-4">
        <motion.h2
          className="text-3xl font-bold text-center mb-8"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.2 }}
        >
          Contact NOOD International
        </motion.h2>
        <motion.form
          className="max-w-lg mx-auto space-y-4"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.4 }}
        >
          <input
            type="text"
            placeholder="Name"
            className="w-full p-3 rounded-md border border-border bg-background text-card-foreground"
            data-cursor="hover"
          />
          <input
            type="email"
            placeholder="Email"
            className="w-full p-3 rounded-md border border-border bg-background text-card-foreground"
            data-cursor="hover"
          />
          <textarea
            placeholder="Message"
            className="w-full p-3 rounded-md border border-border bg-background text-card-foreground"
            rows="4"
            data-cursor="hover"
          ></textarea>
          <Button
            className="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white px-6 py-3"
            data-cursor="hover"
          >
            Send Message
          </Button>
        </motion.form>
        <motion.div
          className="text-center mt-6"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
        >
          <p>
            Or contact us via{" "}
            <a
              href="https://wa.me/971567575075"
              className="text-secondary hover:underline"
              data-cursor="hover"
            >
              WhatsApp: +971 56 7575 075
            </a>
          </p>
          <p>
            Email:{" "}
            <a
              href="mailto:info@noodproperties.com"
              className="text-secondary hover:underline"
              data-cursor="hover"
            >
              info@noodproperties.com
            </a>
          </p>
        </motion.div>
      </div>
    </motion.section>
  );
}

export default ContactForm;
EOF

cat > components/Footer.jsx << 'EOF'
import { motion } from "framer-motion";
import { Link } from "react-router-dom";

function Footer() {
  return (
    <motion.footer
      className="bg-primary text-white py-8"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <div className="container mx-auto px-4 text-center">
        <motion.div
          className="flex justify-center space-x-4 mb-4"
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2 }}
        >
          <Link to="/UnitedArabEmirates" className="hover:text-secondary" data-cursor="hover">
            🇦🇪 UAE
          </Link>
          <Link to="/UnitedKingdom" className="hover:text-secondary" data-cursor="hover">
            🇬🇧 UK
          </Link>
          <Link to="/UnitedStates" className="hover:text-secondary" data-cursor="hover">
            🇺�� US
          </Link>
          <Link to="/Russia" className="hover:text-secondary" data-cursor="hover">
            🇷🇺 Russia
          </Link>
          <Link to="/Pakistan" className="hover:text-secondary" data-cursor="hover">
            🇵🇰 Pakistan
          </Link>
        </motion.div>
        <motion.p
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.4 }}
        >
          © 2025 NOOD International Properties. Redefining global real estate.
        </motion.p>
      </div>
    </motion.footer>
  );
}

export default Footer;
EOF

cat > components/Button.jsx << 'EOF'
import { cn } from "./utils";
import * as React from "react";

const Button = React.forwardRef(
  ({ className, as = "button", ...props }, ref) => {
    const Comp = as;
    return (
      <Comp
        ref={ref}
        className={cn(
          "inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
          className
        )}
        data-cursor="hover"
        {...props}
      />
    );
  }
);
Button.displayName = "Button";

export { Button };
EOF

cat > components/utils.js << 'EOF'
import { clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs) {
  return twMerge(clsx(inputs));
}
EOF

cat > components/PropertyCard.jsx << 'EOF'
import { motion } from "framer-motion";
import { Button } from "./Button";
import { Link } from "react-router-dom";

function PropertyCard({ property }) {
  return (
    <motion.div
      className="bg-card rounded-lg overflow-hidden shadow-lg"
      whileHover={{ scale: 1.05, boxShadow: "0 10px 20px rgba(0,0,0,0.2)" }}
      transition={{ type: "spring", stiffness: 300 }}
      data-cursor="hover"
    >
      <img
        src={property.image}
        alt={property.title}
        className="w-full h-48 object-cover"
        loading="lazy"
      />
      <div className="p-4">
        <h3 className="text-xl font-bold text-card-foreground">{property.title}</h3>
        <p className="text-muted-foreground mt-2">{property.location}</p>
        <p className="text-secondary font-semibold mt-2">{property.price}</p>
        <Button
          as={Link}
          to={`/property/${property.id}`}
          className="mt-4 bg-gradient-to-r from-blue-500 to-purple-600 text-white"
          data-cursor="hover"
        >
          View Details
        </Button>
      </div>
    </motion.div>
  );
}

export default PropertyCard;
EOF

cat > components/PropertyList.jsx << 'EOF'
import { motion } from "framer-motion";
import PropertyCard from "./PropertyCard";
import properties from "../data/properties.json";

function PropertyList() {
  return (
    <motion.section
      className="py-16 container mx-auto px-4"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <motion.h2
        className="text-3xl font-bold text-center mb-8"
        initial={{ y: 20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ delay: 0.2 }}
      >
        Featured Properties
      </motion.h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {properties.map((property) => (
          <PropertyCard key={property.id} property={property} />
        ))}
      </div>
    </motion.section>
  );
}

export default PropertyList;
EOF

cat > components/SearchBar.jsx << 'EOF'
import { useState } from "react";
import { motion } from "framer-motion";
import { Search } from "lucide-react";

function SearchBar() {
  const [query, setQuery] = useState("");

  const suggestions = [
    "Abu Dhabi Villas",
    "Dubai Apartments",
    "London Townhouses",
    "New York Penthouses",
    "Moscow Estates",
  ];

  return (
    <motion.div
      className="relative max-w-lg mx-auto my-8"
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8 }}
    >
      <div className="flex items-center border border-border rounded-md bg-background p-2">
        <Search className="w-5 h-5 text-muted-foreground mr-2" />
        <input
          type="text"
          placeholder="Search properties..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="w-full bg-transparent outline-none text-card-foreground"
          data-cursor="hover"
          aria-label="Search properties"
        />
      </div>
      {query && (
        <motion.ul
          className="absolute w-full bg-card border border-border rounded-md mt-2 shadow-lg"
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3 }}
        >
          {suggestions
            .filter((s) => s.toLowerCase().includes(query.toLowerCase()))
            .map((suggestion, index) => (
              <li
                key={index}
                className="p-2 hover:bg-accent hover:text-accent-foreground cursor-pointer"
                data-cursor="hover"
              >
                {suggestion}
              </li>
            ))}
        </motion.ul>
      )}
    </motion.div>
  );
}

export default SearchBar;
EOF

cat > components/AIChatbot.jsx << 'EOF'
import { useState, useEffect, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { MessageCircle, Send, X } from "lucide-react";
import { Button } from "./Button";
import properties from "../data/properties.json";
import responses from "../data/chatbotResponses.json";

function AIChatbot() {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState("");
  const [language, setLanguage] = useState("en");
  const messagesEndRef = useRef(null);

  // Detect language based on current route
  useEffect(() => {
    const path = window.location.pathname;
    if (path.includes("UnitedArabEmirates")) setLanguage("ar");
    else if (path.includes("Russia")) setLanguage("ru");
    else if (path.includes("Pakistan")) setLanguage("ur");
    else setLanguage("en");
  }, []);

  // Scroll to latest message
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const handleSend = () => {
    if (!input.trim()) return;

    const userMessage = { text: input, sender: "user", language };
    setMessages([...messages, userMessage]);

    // Process query
    const query = input.toLowerCase();
    let response = responses[language].default;

    // Property-related queries
    if (query.includes("property") || query.includes("house") || query.includes("apartment")) {
      const matchedProperties = properties.filter(
        (p) =>
          p.location.toLowerCase().includes(query) ||
          p.title.toLowerCase().includes(query)
      );
      if (matchedProperties.length > 0) {
        response = responses[language].propertyFound.replace(
          "{properties}",
          matchedProperties.map((p) => p.title).join(", ")
        );
      } else {
        response = responses[language].propertyNotFound;
      }
    } else if (query.includes("contact") || query.includes("reach")) {
      response = responses[language].contact;
    }

    setMessages((prev) => [
      ...prev,
      { text: response, sender: "bot", language },
    ]);
    setInput("");
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <motion.div
      className="fixed bottom-4 right-4 z-50"
      initial={{ scale: 0 }}
      animate={{ scale: 1 }}
      transition={{ duration: 0.5 }}
    >
      <motion.button
        className="bg-secondary text-white p-4 rounded-full shadow-lg"
        onClick={() => setIsOpen(!isOpen)}
        whileHover={{ scale: 1.1 }}
        whileTap={{ scale: 0.9 }}
        data-cursor="hover"
        aria-label={isOpen ? "Close chatbot" : "Open chatbot"}
      >
        {isOpen ? <X className="w-6 h-6" /> : <MessageCircle className="w-6 h-6" />}
      </motion.button>
      <AnimatePresence>
        {isOpen && (
          <motion.div
            className="bg-card w-80 md:w-96 h-96 rounded-lg shadow-xl p-4 mt-2 overflow-y-auto border border-border"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 20 }}
            transition={{ duration: 0.3 }}
            role="dialog"
            aria-labelledby="chatbot-title"
          >
            <h3 id="chatbot-title" className="sr-only">
              NOOD AI Chatbot
            </h3>
            <div className="space-y-2 mb-4">
              {messages.map((msg, index) => (
                <motion.div
                  key={index}
                  className={`p-3 rounded-lg ${
                    msg.sender === "user"
                      ? "bg-primary text-white ml-auto"
                      : "bg-accent text-card-foreground"
                  } max-w-[80%] ${msg.language === "ar" || msg.language === "ur" ? "text-right" : "text-left"}`}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ duration: 0.2 }}
                >
                  {msg.text}
                </motion.div>
              ))}
              <div ref={messagesEndRef} />
            </div>
            <div className="flex">
              <textarea
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyPress={handleKeyPress}
                className="flex-1 p-2 rounded-l-md border border-border bg-background text-card-foreground resize-none"
                placeholder={responses[language].placeholder}
                data-cursor="hover"
                aria-label="Chat input"
                rows="2"
              />
              <Button
                onClick={handleSend}
                className="bg-gradient-to-r from-blue-500 to-purple-600 text-white p-2 rounded-r-md"
                data-cursor="hover"
                aria-label="Send message"
              >
                <Send className="w-5 h-5" />
              </Button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  );
}

export default AIChatbot;
EOF

cat > pages/UnitedArabEmirates.jsx << 'EOF'
import { motion } from "framer-motion";
import { SearchBar } from "../components/SearchBar";
import { PropertyList } from "../components/PropertyList";

function UnitedArabEmirates() {
  return (
    <motion.div
      className="min-h-screen bg-background"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <section className="gradient-bg text-white py-24 text-center relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
        <motion.h1
          className="text-5xl md:text-6xl font-bold tracking-tight"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          Properties in UAE 🇦🇪
        </motion.h1>
        <motion.p
          className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          Discover luxury real estate in Abu Dhabi and Dubai, tailored for global investors.
        </motion.p>
      </section>
      <SearchBar />
      <PropertyList />
    </motion.div>
  );
}

export default UnitedArabEmirates;
EOF

cat > pages/UnitedKingdom.jsx << 'EOF'
import { motion } from "framer-motion";
import { SearchBar } from "../components/SearchBar";
import { PropertyList } from "../components/PropertyList";

function UnitedKingdom() {
  return (
    <motion.div
      className="min-h-screen bg-background"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <section className="gradient-bg text-white py-24 text-center relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
        <motion.h1
          className="text-5xl md:text-6xl font-bold tracking-tight"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          Properties in UK 🇬🇧
        </motion.h1>
        <motion.p
          className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          Explore premium properties in London and beyond, designed for luxury living.
        </motion.p>
      </section>
      <SearchBar />
      <PropertyList />
    </motion.div>
  );
}

export default UnitedKingdom;
EOF

cat > pages/UnitedStates.jsx << 'EOF'
import { motion } from "framer-motion";
import { SearchBar } from "../components/SearchBar";
import { PropertyList } from "../components/PropertyList";

function UnitedStates() {
  return (
    <motion.div
      className="min-h-screen bg-background"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <section className="gradient-bg text-white py-24 text-center relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
        <motion.h1
          className="text-5xl md:text-6xl font-bold tracking-tight"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          Properties in USA 🇺🇸
        </motion.h1>
        <motion.p
          className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          Find exclusive real estate in New York, Miami, and more.
        </motion.p>
      </section>
      <SearchBar />
      <PropertyList />
    </motion.div>
  );
}

export default UnitedStates;
EOF

cat > pages/Russia.jsx << 'EOF'
import { motion } from "framer-motion";
import { SearchBar } from "../components/SearchBar";
import { PropertyList } from "../components/PropertyList";

function Russia() {
  return (
    <motion.div
      className="min-h-screen bg-background"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <section className="gradient-bg text-white py-24 text-center relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
        <motion.h1
          className="text-5xl md:text-6xl font-bold tracking-tight"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          Properties in Russia 🇷🇺
        </motion.h1>
        <motion.p
          className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          Discover luxury estates in Moscow and St. Petersburg.
        </motion.p>
      </section>
      <SearchBar />
      <PropertyList />
    </motion.div>
  );
}

export default Russia;
EOF

cat > pages/Pakistan.jsx << 'EOF'
import { motion } from "framer-motion";
import { SearchBar } from "../components/SearchBar";
import { PropertyList } from "../components/PropertyList";

function Pakistan() {
  return (
    <motion.div
      className="min-h-screen bg-background"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.8 }}
    >
      <section className="gradient-bg text-white py-24 text-center relative overflow-hidden">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.1),transparent)]" />
        <motion.h1
          className="text-5xl md:text-6xl font-bold tracking-tight"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.2 }}
        >
          Properties in Pakistan ��🇰
        </motion.h1>
        <motion.p
          className="mt-4 text-lg md:text-xl max-w-2xl mx-auto"
          initial={{ y: 50, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.8, delay: 0.4 }}
        >
          Explore premium properties in Islamabad and Karachi.
        </motion.p>
      </section>
      <SearchBar />
      <PropertyList />
    </motion.div>
  );
}

export default Pakistan;
EOF

cat > data/properties.json << 'EOF'
[
  {
    "id": 1,
    "title": "Luxury Villa in Abu Dhabi",
    "location": "Saadiyat Island, UAE",
    "price": "$2,500,000",
    "image": "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2"
  },
  {
    "id": 2,
    "title": "Modern Apartment in Dubai",
    "location": "Downtown Dubai, UAE",
    "price": "$1,200,000",
    "image": "https://images.unsplash.com/photo-1560448204-446b9d3b3d0e"
  },
  {
    "id": 3,
    "title": "Townhouse in London",
    "location": "Kensington, UK",
    "price": "£1,800,000",
    "image": "https://images.unsplash.com/photo-1560448204-1234567890"
  }
]
EOF

cat > data/chatbotResponses.json << 'EOF'
{
  "en": {
    "default": "Hello! How can I assist you with your property search today?",
    "propertyFound": "I found these properties: {properties}. Would you like more details?",
    "propertyNotFound": "Sorry, I couldn't find any properties matching your query. Try something else!",
    "contact": "You can reach us at info@noodproperties.com or WhatsApp: +971 56 7575 075.",
    "placeholder": "Ask about properties..."
  },
  "ar": {
    "default": "مرحبًا! كيف يمكنني مساعدتك في البحث عن العقارات اليوم؟",
    "propertyFound": "وجدت هذه العقارات: {properties}. هل تريد المزيد من التفاصيل؟",
    "propertyNotFound": "عذرًا، لم أتمكن من العثور على عقارات تطابق استفسارك. جرب شيئًا آخر!",
    "contact": "يمكنك التواصل معنا عبر info@noodproperties.com أو واتساب: +971 56 7575 075",
    "placeholder": "اسأل عن العقارات..."
  },
  "ru": {
    "default": "Здравствуйте! Чем могу помочь с поиском недвижимости?",
    "propertyFound": "Я нашел следующие объекты: {properties}. Хотите узнать подробности?",
    "propertyNotFound": "Извините, не нашел объектов по вашему запросу. Попробуйте другой!",
    "contact": "Свяжитесь с нами: info@noodproperties.com или WhatsApp: +971 56 7575 075",
    "placeholder": "Спросите о недвижимости..."
  },
  "ur": {
    "default": "ہیلو! میں آپ کو پراپرٹی کی تلاش میں کیسے مدد کر سکتا ہوں؟",
    "propertyFound": "میں نے یہ پراپرٹیز پائیں: {properties}۔ کیا آپ مزید تفصیلات چاہتے ہیں؟",
    "propertyNotFound": "معذرت، آپ کے سوال سے ملتی جلتی کوئی پراپرٹی نہیں ملی۔ کچھ اور آزمائیں!",
    "contact": "ہم سے رابطہ کریں: info@noodproperties.com یا واٹس ایپ: +971 56 7575 075",
    "placeholder": "پراپرٹیز کے بارے میں پوچھیں..."
  }
}
EOF

cat > .github/workflows/vercel.yml << 'EOF'
name: Deploy to Vercel
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          scope: ${{ secrets.VERCEL_ORG_ID }}
EOF

cat > .gitignore << 'EOF'
node_modules
dist
.env
.vercel
EOF

cat > Attributions.md << 'EOF'
# Attributions

- Images: Unsplash[](https://unsplash.com)
- Icons: Lucide React[](https://lucide.dev)
- Fonts: Google Fonts (Inter)
- Video: Mixkit[](https://mixkit.co)
- Animations: Framer Motion[](https://framer.com/motion)
EOF

cat > README.md << 'EOF'
# NOOD International Properties

Welcome to NOOD – a visionary real estate platform redefining luxury and transparency in global property investment.

This project is built using:

- ⚛️ React (with Vite)
- 🎬 Framer Motion (for advanced cinematic animations)
- 🎨 Tailwind CSS
- 🌐 React Router
- 🖱️ Custom Cursor Component
- 🎥 Parallax Cinematic Video Background
- 🧠 AI-First UX, featuring a Preloader, Hero Section, Contact Forms, Property Listings, Search Bar, and AI Chatbot

## 🌍 Vision

NOOD is building the world's most cinematic, premium real estate website with localized landing pages for:

- United Arab Emirates 🇦🇪
- United Kingdom 🇬🇧
- United States 🇺🇸
- Russia 🇷��
- Pakistan 🇵🇰

Each country page includes:
- Native language
- Flag-themed visual styles
- Highlighting Abu Dhabi’s unique investment appeal

## �� Structure

- `/components` – Reusable animated UI components
- `/pages` – Country-specific landing pages
- `App.jsx` – Main layout including all sections
- `main.jsx` – React DOM bootstrap
- `/assets` – Logos, video backgrounds
- `vite.config.js` – Vite configuration
- `package.json` – Project dependencies

## 🧪 Setup

1. Clone the repository: `git clone https://github.com/bissam1/nood-web.git`
2. Install dependencies: `npm install`
3. Run locally: `npm run dev`
4. Build for production: `npm run build`

## 🚀 Deployment

Deployed on Vercel: [Add URL after deployment]

## 📞 Contact

- Email: [info@noodproperties.com](mailto:info@noodproperties.com)
- WhatsApp: [+971 56 7575 075](https://wa.me/971567575075)

## ✨ Features

- Dynamic property listings with interactive cards
- AI-powered search with autocomplete
- AI chatbot with multilingual support for property queries
- Localized pages with native language support
- SEO optimization and Google Analytics integration
- Accessible design with ARIA attributes

Built by NOOD. Redefining global real estate.
EOF

cat > package-lock.json << 'EOF'
{
  "name": "nood-web",
  "version": "1.0.0",
  "lockfileVersion": 3,
  "requires": true,
  "packages": {}
}
EOF

cat > vercel.json << 'EOF'
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build",
      "config": {
        "buildCommand": "npm run build",
        "installCommand": "npm install",
        "outputDirectory": "dist"
      }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/"
    }
  ]
}
EOF

cat > vite.config.js << 'EOF'
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  base: "/",
  build: {
    outDir: "dist",
  },
  define: {
    "process.env": process.env,
  },
});
EOF

cat > .env << 'EOF'
# Environment variables for future backend integration
VITE_API_URL=http://api.noodproperties.com
VITE_GOOGLE_ANALYTICS_ID=your-ga-id
EOF

cat > assets/placeholder-video.mp4 << 'EOF'
Placeholder for real estate video (e.g., from Mixkit). Replace with actual video file.
EOF

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
  git init
  git add .
  git commit -m "Initial setup of NOOD International Properties with AI chatbot"
fi

echo "Project setup complete! Run 'npm install' to install dependencies, then 'npm run dev' to start the development server."
