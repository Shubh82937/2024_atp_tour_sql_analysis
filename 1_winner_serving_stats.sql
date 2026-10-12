SELECT 
  winner_name AS player_name,
  COUNT(*) AS total_matches_won,
  
  -- 1. First Serve %
  ROUND(SAFE_DIVIDE(SUM(w_1stIn), SUM(w_svpt)) * 100, 1) AS avg_first_serve_pct,
  
  -- 2. First Serve Points Won %
  ROUND(SAFE_DIVIDE(SUM(w_1stWon), SUM(w_1stIn)) * 100, 1) AS avg_first_serve_won_pct,
  
  -- 3. Second Serve Points Won %
  ROUND(SAFE_DIVIDE(SUM(w_2ndWon), SUM(w_svpt - w_1stIn)) * 100, 1) AS avg_second_serve_won_pct,
  
  -- 4. Aces Per Service Game
  ROUND(SAFE_DIVIDE(SUM(w_ace), SUM(w_SvGms)), 2) AS aces_per_service_game,
  
  -- 5. Double Faults Per Service Game
  ROUND(SAFE_DIVIDE(SUM(w_df), SUM(w_SvGms)), 2) AS dfs_per_service_game,
  
  -- 6. Break Points Saved %
  ROUND(SAFE_DIVIDE(SUM(w_bpSaved), SUM(w_bpFaced)) * 100, 1) AS break_points_saved_pct

FROM 
  `tennis_daa.atp_2024_matches`
GROUP BY 
  winner_name
HAVING 
  total_matches_won >= 10
ORDER BY 
  aces_per_service_game DESC;
