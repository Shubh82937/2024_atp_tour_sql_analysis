WITH player_stats AS (
  -- Section A: Get stats from matches won
  SELECT 
    winner_name AS player_name,
    1 AS is_win,
    w_ace AS aces,
    w_df AS double_faults,
    w_SvGms AS service_games
  FROM `tennis_daa.atp_2024_matches`
  
  UNION ALL
  
  -- Section B: Get stats from matches lost
  SELECT 
    loser_name AS player_name,
    0 AS is_win,
    l_ace AS aces,
    l_df AS double_faults,
    l_SvGms AS service_games
  FROM `tennis_daa.atp_2024_matches`
)

-- Section C: Calculate overall totals and averages
SELECT 
  player_name,
  COUNT(*) AS total_matches_played,
  SUM(is_win) AS total_wins,
  COUNT(*) - SUM(is_win) AS total_losses,
  ROUND((SUM(is_win) / COUNT(*)) * 100, 1) AS win_percentage,
  SUM(aces) AS total_aces_2024,
  ROUND(SAFE_DIVIDE(SUM(aces), SUM(service_games)), 2) AS overall_aces_per_game,
  ROUND(SAFE_DIVIDE(SUM(double_faults), SUM(service_games)), 2) AS overall_dfs_per_game
FROM player_stats
WHERE player_name IS NOT NULL
GROUP BY player_name
HAVING total_matches_played >= 15
ORDER BY win_percentage DESC;
