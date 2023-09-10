# JDCloudChecker

Shows a little icon in the corner of your screen to show if your avatar is currently uploaded to the figura cloud or not.

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