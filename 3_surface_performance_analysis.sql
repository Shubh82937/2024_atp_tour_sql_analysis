WITH surface_wins AS (
  SELECT winner_name AS player_name, surface, COUNT(*) AS wins
  FROM `tennis_daa.atp_2024_matches`
  WHERE winner_name IS NOT NULL AND surface IS NOT NULL
  GROUP BY winner_name, surface
),
surface_losses AS (
  SELECT loser_name AS player_name, surface, COUNT(*) AS losses
  FROM `tennis_daa.atp_2024_matches`
  WHERE loser_name IS NOT NULL AND surface IS NOT NULL
  GROUP BY loser_name, surface
),
combined_surface_stats AS (
  SELECT 
    COALESCE(w.player_name, l.player_name) AS player_name,
    COALESCE(w.surface, l.surface) AS surface,
    IFNULL(w.wins, 0) AS wins,
    IFNULL(l.losses, 0) AS losses,
    IFNULL(w.wins, 0) + IFNULL(l.losses, 0) AS total_matches
  FROM surface_wins w
  FULL OUTER JOIN surface_losses l 
    ON w.player_name = l.player_name AND w.surface = l.surface
)
SELECT 
  player_name,
  surface,
  wins,
  losses,
  total_matches,
  ROUND(SAFE_DIVIDE(wins, total_matches) * 100, 1) AS surface_win_percentage
FROM combined_surface_stats
WHERE total_matches >= 8
ORDER BY surface, surface_win_percentage DESC;
