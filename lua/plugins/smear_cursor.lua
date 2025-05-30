return {
  "sphamba/smear-cursor.nvim",
  opts = {
    stiffness = 0.8, -- 0.6      [0, 1]
    trailing_stiffness = 0.6, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
    time_interval = 7, --milliseconds
    --trailing_exponent = 5,
    never_draw_over_target = true,
    hide_target_hack = true,
    legacy_computing_symbols_support = true,
  },
}
