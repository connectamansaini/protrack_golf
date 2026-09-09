Add-Type -AssemblyName System.Drawing

# Regenerates the launcher icon, splash artwork and Play Store graphics.
# Run from anywhere: powershell -ExecutionPolicy Bypass -File tool\make_branding.ps1
$root = Split-Path -Parent $PSScriptRoot
$outDir = Join-Path $root "assets\branding"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$green = [System.Drawing.ColorTranslator]::FromHtml("#2E5339")
$white = [System.Drawing.Color]::White
$dimple = [System.Drawing.ColorTranslator]::FromHtml("#DDE3DF")
$gold  = [System.Drawing.ColorTranslator]::FromHtml("#E3B65C")
$goldDark = [System.Drawing.ColorTranslator]::FromHtml("#C4953F")

# Draws a golf ball on a tee, centred in a canvas of $size, scaled by $scale
# (1.0 = the artwork spans ~78% of the canvas).
function Draw-Mark {
  param($g, [int]$size, [double]$scale, [bool]$shadow)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

  $cx = $size / 2.0
  $r = 0.28 * $size * $scale             # ball radius
  $cy = $size * 0.45                     # ball centre y

  # Tee: cup under the ball, then a tapered stem.
  $cupTop = $cy + $r * 0.62
  $cupW = $r * 0.95
  $stemW = $r * 0.26
  $stemBottom = $cy + $r * 1.55
  $tee = [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(($cx - $cupW), $cupTop)),
    (New-Object System.Drawing.PointF(($cx + $cupW), $cupTop)),
    (New-Object System.Drawing.PointF(($cx + $cupW * 0.55), ($cupTop + $r * 0.28))),
    (New-Object System.Drawing.PointF(($cx + $stemW), ($cupTop + $r * 0.32))),
    (New-Object System.Drawing.PointF(($cx + $stemW * 0.7), $stemBottom)),
    (New-Object System.Drawing.PointF(($cx - $stemW * 0.7), $stemBottom)),
    (New-Object System.Drawing.PointF(($cx - $stemW), ($cupTop + $r * 0.32))),
    (New-Object System.Drawing.PointF(($cx - $cupW * 0.55), ($cupTop + $r * 0.28)))
  )
  $goldBrush = New-Object System.Drawing.SolidBrush($gold)
  $g.FillPolygon($goldBrush, $tee)
  # Stem edge shading for a little depth.
  $pen = New-Object System.Drawing.Pen($goldDark, [float]($size * 0.012))
  $g.DrawLine($pen, [float]($cx + $stemW * 0.55), [float]($cupTop + $r * 0.34), [float]($cx + $stemW * 0.45), [float]$stemBottom)

  if ($shadow) {
    $shadowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(70, 0, 0, 0))
    $g.FillEllipse($shadowBrush, [float]($cx - $r + $size*0.012), [float]($cy - $r + $size*0.018), [float](2*$r), [float](2*$r))
  }

  # Ball.
  $whiteBrush = New-Object System.Drawing.SolidBrush($white)
  $g.FillEllipse($whiteBrush, [float]($cx - $r), [float]($cy - $r), [float](2*$r), [float](2*$r))

  # Dimples: a hex-ish grid clipped to the ball.
  $clip = New-Object System.Drawing.Drawing2D.GraphicsPath
  $clip.AddEllipse([float]($cx - $r*0.9), [float]($cy - $r*0.9), [float](1.8*$r), [float](1.8*$r))
  $g.SetClip($clip)
  $dimpleBrush = New-Object System.Drawing.SolidBrush($dimple)
  $d = $r * 0.16
  $step = $r * 0.40
  $row = 0
  for ($y = $cy - $r; $y -le $cy + $r; $y += $step * 0.87) {
    $offset = 0
    if ($row % 2 -eq 1) { $offset = $step / 2 }
    for ($x = $cx - $r + $offset; $x -le $cx + $r; $x += $step) {
      $g.FillEllipse($dimpleBrush, [float]($x - $d/2), [float]($y - $d/2), [float]$d, [float]$d)
    }
    $row++
  }
  $g.ResetClip()

  # Soft highlight top-left.
  $hl = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(110, 255, 255, 255))
  $g.FillEllipse($hl, [float]($cx - $r*0.62), [float]($cy - $r*0.72), [float]($r*0.55), [float]($r*0.38))
}

function Save-Png {
  param([string]$name, [int]$size, [double]$scale, $background, [bool]$shadow)
  $bmp = New-Object System.Drawing.Bitmap($size, $size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  if ($null -ne $background) { $g.Clear($background) } else { $g.Clear([System.Drawing.Color]::Transparent) }
  Draw-Mark -g $g -size $size -scale $scale -shadow $shadow
  $g.Dispose()
  $path = Join-Path $outDir $name
  $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  "$name -> $path"
}

# Full-bleed launcher icon (iOS + legacy Android).
Save-Png -name "icon.png" -size 1024 -scale 1.0 -background $green -shadow $true
# Adaptive foreground: artwork inside the 66% safe zone, transparent around it.
Save-Png -name "icon_foreground.png" -size 1024 -scale 0.78 -background $null -shadow $true
# Splash logo: transparent, roomy, used on the green splash background.
Save-Png -name "splash_logo.png" -size 1024 -scale 0.9 -background $null -shadow $false
# Android 12+ splash icon: system shows it inside a circle, so keep it small.
Save-Png -name "splash_android12.png" -size 1152 -scale 0.55 -background $null -shadow $false

# Wordmark for the bottom of the splash: "ProTrack" in white, "Golf" in gold.
function Save-Wordmark {
  param([string]$name, [int]$w, [int]$h)
  $bmp = New-Object System.Drawing.Bitmap($w, $h, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.Clear([System.Drawing.Color]::Transparent)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
  $fmt = [System.Drawing.StringFormat]::GenericTypographic
  $s1 = "ProTrack"
  $s2 = "Golf"
  # Size the type so the whole wordmark spans ~90% of the canvas width;
  # the canvas itself is 2.5:1 to match Android's 200x80dp branding slot,
  # so nothing gets squashed when the system scales it.
  $trial = New-Object System.Drawing.Font("Segoe UI", 100, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
  $trialW = $g.MeasureString($s1, $trial, 10000, $fmt).Width + 30 + $g.MeasureString($s2, $trial, 10000, $fmt).Width
  $fontSize = 100 * (($w * 0.9) / $trialW)
  $font = New-Object System.Drawing.Font("Segoe UI", [float]$fontSize, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
  $gap = $font.Size * 0.3
  $w1 = $g.MeasureString($s1, $font, 10000, $fmt).Width
  $w2 = $g.MeasureString($s2, $font, 10000, $fmt).Width
  $x = ($w - ($w1 + $gap + $w2)) / 2
  # Name sits in the upper part of the canvas; the tagline goes underneath.
  $nameH = $font.GetHeight($g)
  $tagFont = New-Object System.Drawing.Font("Segoe UI", [float]($fontSize * 0.36), [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $tag = "Track your golf like a pro"
  $tagW = $g.MeasureString($tag, $tagFont, 10000, $fmt).Width
  $tagH = $tagFont.GetHeight($g)
  $blockH = $nameH + $tagH * 0.9
  $y = ($h - $blockH) / 2
  $g.DrawString($s1, $font, (New-Object System.Drawing.SolidBrush($white)), [float]$x, [float]$y, $fmt)
  $g.DrawString($s2, $font, (New-Object System.Drawing.SolidBrush($gold)), [float]($x + $w1 + $gap), [float]$y, $fmt)
  $g.DrawString($tag, $tagFont, (New-Object System.Drawing.SolidBrush($white)), [float](($w - $tagW) / 2), [float]($y + $nameH * 0.95), $fmt)
  $g.Dispose()
  $path = Join-Path $outDir $name
  $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  "$name -> $path"
}
Save-Wordmark -name "splash_branding.png" -w 1000 -h 400

# Play Store feature graphic (1024x500): the mark on the left, wordmark and
# tagline on the right, on the brand green.
function Save-FeatureGraphic {
  param([string]$path)
  $w = 1024; $h = 500
  $bmp = New-Object System.Drawing.Bitmap($w, $h, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.Clear($green)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
  # Mark: reuse Draw-Mark on a square region at the left.
  $markSize = 400
  $mark = New-Object System.Drawing.Bitmap($markSize, $markSize, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $mg = [System.Drawing.Graphics]::FromImage($mark)
  $mg.Clear([System.Drawing.Color]::Transparent)
  Draw-Mark -g $mg -size $markSize -scale 1.0 -shadow $true
  $mg.Dispose()
  $g.DrawImage($mark, 48, [int](($h - $markSize) / 2))
  $mark.Dispose()
  # Wordmark: size the type so "ProTrack Golf" fits the space right of the mark.
  $fmt = [System.Drawing.StringFormat]::GenericTypographic
  $x = 470
  $avail = $w - $x - 48
  $trial = New-Object System.Drawing.Font("Segoe UI", 100, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
  $trialW = $g.MeasureString("ProTrack", $trial, 10000, $fmt).Width + 30 + $g.MeasureString("Golf", $trial, 10000, $fmt).Width
  $fontSize = [Math]::Floor(100 * ($avail / $trialW))
  $font = New-Object System.Drawing.Font("Segoe UI", [float]$fontSize, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
  $tagFont = New-Object System.Drawing.Font("Segoe UI", [float]($fontSize * 0.4), [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $w1 = $g.MeasureString("ProTrack", $font, 10000, $fmt).Width
  $gap = $font.Size * 0.3
  $nameH = $font.GetHeight($g)
  $tagH = $tagFont.GetHeight($g)
  $y = ($h - ($nameH + $tagH)) / 2
  $g.DrawString("ProTrack", $font, (New-Object System.Drawing.SolidBrush($white)), [float]$x, [float]$y, $fmt)
  $g.DrawString("Golf", $font, (New-Object System.Drawing.SolidBrush($gold)), [float]($x + $w1 + $gap), [float]$y, $fmt)
  $g.DrawString("Track your golf like a pro", $tagFont, (New-Object System.Drawing.SolidBrush($white)), [float]($x + 4), [float]($y + $nameH * 0.98), $fmt)
  $g.Dispose()
  $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  "feature graphic -> $path"
}
$storeDir = Join-Path $root "store"
New-Item -ItemType Directory -Force -Path $storeDir | Out-Null
Save-FeatureGraphic -path (Join-Path $storeDir "feature_graphic.png")

# 512x512 hi-res icon for the Play listing, same artwork as the launcher icon.
$src = [System.Drawing.Image]::FromFile((Join-Path $outDir "icon.png"))
$small = New-Object System.Drawing.Bitmap(512, 512)
$sg = [System.Drawing.Graphics]::FromImage($small)
$sg.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$sg.DrawImage($src, 0, 0, 512, 512)
$sg.Dispose()
$small.Save((Join-Path $storeDir "icon_512.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$small.Dispose()
$src.Dispose()
"icon_512.png -> $storeDir"
