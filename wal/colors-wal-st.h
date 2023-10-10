const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1e0e16", /* black   */
  [1] = "#9B6854", /* red     */
  [2] = "#B28E66", /* green   */
  [3] = "#D3A167", /* yellow  */
  [4] = "#E8C474", /* blue    */
  [5] = "#A87A82", /* magenta */
  [6] = "#D4B28B", /* cyan    */
  [7] = "#ebe0c7", /* white   */

  /* 8 bright colors */
  [8]  = "#a49c8b",  /* black   */
  [9]  = "#9B6854",  /* red     */
  [10] = "#B28E66", /* green   */
  [11] = "#D3A167", /* yellow  */
  [12] = "#E8C474", /* blue    */
  [13] = "#A87A82", /* magenta */
  [14] = "#D4B28B", /* cyan    */
  [15] = "#ebe0c7", /* white   */

  /* special colors */
  [256] = "#1e0e16", /* background */
  [257] = "#ebe0c7", /* foreground */
  [258] = "#ebe0c7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
