SELECT 
  tourney_name,
  surface,
  COUNT(DISTINCT match_num) AS total_matches_played,
  ROUND(AVG(minutes), 1) AS avg_match_duration_minutes,
  
  -- Overall Server Metrics for the Tournament
  ROUND(AVG(w_ace), 1) AS avg_winner_aces,
  ROUND(AVG(l_ace), 1) AS avg_loser_aces,
  
  -- Clutch Performance (Break Points Saved % across the tournament)
  ROUND(SAFE_DIVIDE(SUM(w_bpSaved), SUM(w_bpFaced)) * 100, 1) AS winner_overall_bp_saved_pct,
  ROUND(SAFE_DIVIDE(SUM(l_bpSaved), SUM(l_bpFaced)) * 100, 1) AS loser_overall_bp_saved_pct

FROM `tennis_daa.atp_2024_matches`
WHERE tourney_name IS NOT NULL
GROUP BY tourney_name, surface
HAVING total_matches_played > 5
ORDER BY total_matches_played DESC;
