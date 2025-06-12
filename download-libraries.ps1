# Function to download file
function Download-File {
    param (
        [string]$Url,
        [string]$OutputPath
    )
    Write-Host "Downloading $Url to $OutputPath"
    Invoke-WebRequest -Uri $Url -OutFile $OutputPath
}

# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "lib/bootstrap"
New-Item -ItemType Directory -Force -Path "lib/fontawesome"
New-Item -ItemType Directory -Force -Path "lib/fontawesome/webfonts"
New-Item -ItemType Directory -Force -Path "lib/aos"
New-Item -ItemType Directory -Force -Path "lib/fonts"

# Download Bootstrap
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" -OutFile "lib/bootstrap/bootstrap.min.css"
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" -OutFile "lib/bootstrap/bootstrap.bundle.min.js"

# Download Font Awesome
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" -OutFile "lib/fontawesome/all.min.css"
# Download Font Awesome webfonts
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-brands-400.woff2" -OutFile "lib/fontawesome/webfonts/fa-brands-400.woff2"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-regular-400.woff2" -OutFile "lib/fontawesome/webfonts/fa-regular-400.woff2"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-solid-900.woff2" -OutFile "lib/fontawesome/webfonts/fa-solid-900.woff2"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-brands-400.ttf" -OutFile "lib/fontawesome/webfonts/fa-brands-400.ttf"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-regular-400.ttf" -OutFile "lib/fontawesome/webfonts/fa-regular-400.ttf"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/webfonts/fa-solid-900.ttf" -OutFile "lib/fontawesome/webfonts/fa-solid-900.ttf"

# Download AOS (Animate on Scroll)
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" -OutFile "lib/aos/aos.css"
Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" -OutFile "lib/aos/aos.js"

# Download Google Font (Poppins)
$poppinsCSS = @"
/* devanagari */
@font-face {
  font-family: 'Poppins';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/poppins/v20/pxiEyp8kv8JHgFVrJJbecnFHGPezSQ.woff2) format('woff2');
  unicode-range: U+0900-097F, U+1CD0-1CF9, U+200C-200D, U+20A8, U+20B9, U+25CC, U+A830-A839, U+A8E0-A8FF;
}
/* latin */
@font-face {
  font-family: 'Poppins';
  font-style: normal;
  font-weight: 400;
  src: url(https://fonts.gstatic.com/s/poppins/v20/pxiEyp8kv8JHgFVrJJfecnFHGPc.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}
"@

Set-Content -Path "lib/fonts/poppins.css" -Value $poppinsCSS

Write-Host "All libraries have been downloaded successfully!" 