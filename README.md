# 2024 ATP Tour Performance Analytics Project

### ❓ What it’s about
This project is a deep-dive data analysis of the 2024 ATP tennis season. It takes the raw, messy match statistics of professional tennis players—including details like aces, double faults, court surfaces, match lengths, and break points—and processes them to evaluate true player dominance and court performance. 

### 🎯 Why it matters
In real-world data jobs, data is almost never handed to you cleanly. In this dataset, a player's statistics are split awkwardly across separate "winner" and "loser" columns depending on who won the match. A standard spreadsheet or pivot table struggles to combine these rows automatically. This project matters because it solves a real business problem: transforming a chaotic, flat file into a unified, clean database where you can evaluate a player's true season profile across all matches played.

### 🔨 How I built it
I built this project by scaling my analysis from spreadsheet tools into the cloud. 
1. **Data Cleaning & Scoping:** I started in Google Sheets to isolate the raw 2024 data and plan my metrics.
2. **Cloud Migration:** Because the data was too complex for basic formulas, I migrated the raw dataset into Google BigQuery, a powerful cloud data warehouse.
3. **Database Engineering:** I wrote 4 custom SQL scripts utilizing Common Table Expressions (CTEs), Set Operators (UNION ALL), and Full Outer Joins to clean the records and calculate unified player metrics.

### 📊 What I discovered
* **Server Dominance:** Giovanni Mpetshi Perricard statistically dominated the tour-wide benchmarks for overall aces hit per service game. 
* **Elite Season Efficiency:** By unifying winning and losing rows, the data confirmed Jannik Sinner as the most efficient and consistent overall player, leading the tour in unified win percentage.
* **Surface Specialization:** The surface analysis mathematically isolated exactly which players saw their win percentages spike or drop significantly when transitioning between Hard, Clay, and Grass courts.
* **Tournament Pace & Pressure:** The executive summary uncovered structural variances across venues, pinpointing which tournaments had the longest average match durations and tracking tournament-wide clutch metrics (Break Points Saved %) under high pressure.

### 🧠 What I learned
Through this project, I learned how to move past the limitations of desktop spreadsheets and handle data like a professional engineer. I mastered cloud data loading workflows in Google BigQuery and learned how to write clean, production-grade SQL commands (like SAFE_DIVIDE to prevent database crashes). Most importantly, I learned how to translate raw numbers into a clear, structured technical portfolio that remains safe in the cloud and accessible from any computer.
