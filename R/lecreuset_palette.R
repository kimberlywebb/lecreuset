# Code for `lecreuset` R package.
# Code is adopted from Cianna Bedford-Peterson's `inauguration` R package.
# Source code: https://github.com/ciannabp/inauguration
# Please find the copyright description from Cianna Bedford-Peterson's R package at the end of this file.


#' List of color palettes.
#'
#' Use \code{\link{render_lc_palette}} to construct palettes of desired length.
#'
#' @export
lc_palettes <- list(
  colors_2024 = c("#D20404", "#F96810", "#FBAE1E", "#215447", "#2BA6BA",
                  "#1F85C6", "#6B0909", "#5B6A3D", "#A5CFC6", "#8CA9A3",
                  "#8FA3C0", "#3B71B0", "#0A3147", "#3D493F", "#242943",
                  "#0F1010", "#656761", "#EFEAD8", "#E7DAD7", "#F6F7F5",
                  "#EFE4EC", "#DDB4BF", "#FACDB4")
)

names(lc_palettes$colors_2024) <- c("Cerise", "Flame", "Nectar", "Artichaut",
                                    "Caribbean", "Marseille", "Rhone", "Olive",
                                    "Sage", "Sea Salt", "Chambray", "Azure",
                                    "Agave", "Thyme", "Matte Navy", "Licorice",
                                    "Oyster", "Meringue", "Brioche", "White",
                                    "Shallot", "Chiffon Pink", "Peche")

#' Le Creuset palette rendering
#'
#' @param n Number of colors desired. The main palette has 23 colors. The color 
#'   scheme is derived from \href{https://www.lecreuset.com/explore-colors.html}.
#'   If omitted, uses all colors.
#' @param name Name of color palette. The only option is: \code{"colors_2024"}.
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' render_lc_palette("colors_2024")
render_lc_palette <- function(name, n) {

  pal <- lc_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of colors requested is larger than the chosen palette can provide.")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)
}


#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}


# MIT License

# Copyright (c) 2021 Cianna Bedford-Petersen

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
