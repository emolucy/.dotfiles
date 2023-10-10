static const char norm_fg[] = "#ebe0c7";
static const char norm_bg[] = "#1e0e16";
static const char norm_border[] = "#a49c8b";

static const char sel_fg[] = "#ebe0c7";
static const char sel_bg[] = "#B28E66";
static const char sel_border[] = "#ebe0c7";

static const char urg_fg[] = "#ebe0c7";
static const char urg_bg[] = "#9B6854";
static const char urg_border[] = "#9B6854";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
