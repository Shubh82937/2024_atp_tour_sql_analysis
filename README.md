# 2024 ATP Tour Performance Analytics Project
![Interactive Tennis Dashboard](dashboard_screenshot.png)

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
Through this project, I learned how to use data to look past surface-level sports headlines and uncover the actual tactical realities of the 2024 ATP Tour:

*   **The Power of Server Profiles:** I learned that ace totals alone don't tell the whole story. By calculating aces *per service game*, the data highlighted players like Giovanni Mpetshi Perricard, proving that specific serving efficiency and holding service games under pressure is a distinct competitive edge on modern fast courts.
*   **True Dominance vs. Match Count:** I learned how easily raw match-win numbers can deceive you. A player might look successful simply because they played a massive volume of tournaments. By building a unified win-percentage metric, the data filtered out the noise to prove Jannik Sinner’s absolute, clinical efficiency when he did step on the court.
*   **Surface Specialisation is Real:** The data showed me that court surfaces aren't just minor adjustments—they completely alter a player's performance profile. I learned how drastically a player’s statistical efficiency can spike or drop when transitioning from Clay (where points are longer and break points are faced more often) to Grass or Hard courts.
*   **Tournament Pace and Wear-and-Tear:** By analyzing average match durations across different venues, I learned how much the physical demands on a player change from tournament to tournament. This data provided a clear picture of tour-wide attrition, showing which events require higher baseline physical endurance and better clutch performance (Break Points Saved %) to survive.
