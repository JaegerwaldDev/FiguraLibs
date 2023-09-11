The code for this library can be found [here](https://github.com/JaegerwaldDev/FiguraLibs/blob/main/jd_cloud_checker.lua).

# JDCloudChecker

Shows a little icon in the corner of your screen to show if your avatar is currently uploaded to the Figura cloud or not.

> **Important**
> For this script to work, you'll also have to have my JaiLib module in the modules folder.

## Instruction on how to add this to your avatar

```lua
-- Require the library (in this case the library is found at ".minecraft/Figura/avatars/MyAvatar/libraries/")
local jd_cloud_checker = require("libraries.jd_cloud_checker")

-- The Figura tick event
function events.tick()
    -- The tick function of the library, that updates the icon
    jd_cloud_checker.tick()
    -- If you want to still have an icon displayed if the avatar is uploaded, have this instead
    jd_cloud_checker.tick(true)
end
```

Latest Release: [JDCloudChecker 1.1](https://github.com/JaegerwaldDev/FiguraLibs/blob/main/jd_cloud_checker.md](https://github.com/JaegerwaldDev/FiguraLibs/releases/tag/JDCloudChecker-1.1)https://github.com/JaegerwaldDev/FiguraLibs/releases/tag/JDCloudChecker-1.1)


## Screenshots

<img src="https://raw.githubusercontent.com/JaegerwaldDev/FiguraLibs/main/screenshots/JDCloudChecker_NotUploaded.png">
<sub>If the avatar is not currently uploaded to the Figura Cloud.</sub>

---

<img src="https://raw.githubusercontent.com/JaegerwaldDev/FiguraLibs/main/screenshots/JDCloudChecker_HideUploaded.png">
<sub>If the avatar is currently uploaded to the Figura Cloud. (Without uploaded icon)</sub>

---

<img src="https://raw.githubusercontent.com/JaegerwaldDev/FiguraLibs/main/screenshots/JDCloudChecker_ShowUploaded.png">
<sub>If the avatar is currently uploaded to the Figura Cloud. (With uploaded icon)</sub>
