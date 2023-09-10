--[[

    JDCloudChecker for Figura

    Developed by https://www.github.com/JaegerwaldDev
    GitHub @ https://www.github.com/JaegerwaldDev/FiguraLibs
    Documentation @ https://github.com/JaegerwaldDev/FiguraLibs/blob/main/jd_cloud_checker.md

    Copyright (c) JaegerwaldDev 2023

    Description: Shows a little icon in the corner of your screen to show if your avatar is currently uploaded to the figura cloud or not.

]]--

local jd_cloud_checker = {
    data = {
        sprites = {
            not_uploaded = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAQCAMAAAA7+k+nAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABaUExURQAAAOL2/vr///////T8/34HB+QMDP7///P8/+H1/t/1/uD0/tv0/t3z/tvz/tTy/tfy/tXx/tTw/s/v/tDv/tHu/tDu/szu/svu/snu/sju/sru/sfu/gAAAOpMPNkAAAAedFJOU///////////////////////////////////////AOwYHF4AAAAJcEhZcwAADsMAAA7DAcdvqGQAAACmSURBVChTVZAJEoQgDAQjAWHvW1mU/39zZwDZcqpMQrfgIblHmDZj1TqmgenrbRAZDNNN7cCDUaab0jZsre2GFaeoOnBUqzsBMjr1pbYtKNxgyTwv34zUg1RJRxcCzYG3y9GoR0IgR4c4FXE2hdcdHNVcrjhIbvdiSKtR83hCZHm98cVgvX6miSLLPMcY3RdJLqW4LPyX5c3WNaX1H7Ii8KBdQHL+AaEtFDoMnibyAAAAAElFTkSuQmCC",
            uploaded = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAQCAMAAAA7+k+nAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABaUExURQAAAOL2/vr///////T8//7//wCEIRPdRvP8/+H1/t/1/uD0/tv0/t3z/tvz/tTy/tfy/tXx/tTw/s/v/tDv/tHu/tDu/szu/svu/snu/sju/sru/sfu/gAAAKd5KMkAAAAedFJOU///////////////////////////////////////AOwYHF4AAAAJcEhZcwAADsMAAA7DAcdvqGQAAAClSURBVChTVZAJEoMgDEVjQihd7apW5f7X7E9AOr4ZDPwX40K5QUbd41Qrdp3RztuGqGOjmVIRdyxGM162OITQjF0xxbuDr52wZhEViW0YLnYD4qCq8RC1GtoGxZInhTlaO51Yaq8tTRBnFxdGrgmp5UD4esMg6u9uSr8h/HhCZHq9/Zs5lsL8GQYTmcZxAl8wg2lZ7F/6m63rPK9/LHOBB+1AkvMPdXYUCy3CdPsAAAAASUVORK5CYII=",
            none = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY2BgYGAAAAAFAAGKM+MAAAAAAElFTkSuQmCC"
        },
        cloud_sprite = models.model.HUD:newSprite("cloud_sprite"),
        position = {
            normal = vec(-8, -8, 0),
            debug = vec(-8, -235, 0)
        }
    }
}

textures:read("jd_cloud_checker.not_uploaded", jd_cloud_checker.data.sprites.not_uploaded)
textures:read("jd_cloud_checker.uploaded", jd_cloud_checker.data.sprites.uploaded)
textures:read("jd_cloud_checker.none", jd_cloud_checker.data.sprites.none)

jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.none"), 24, 16)

function jd_cloud_checker.tick(show_uploaded)
    show_uploaded = show_uploaded or false

    if host:isHost() and not client:isDebugOverlayEnabled() then
        jd_cloud_checker.data.cloud_sprite:setPos(jd_cloud_checker.data.position.normal)
    elseif host:isHost() and client:isDebugOverlayEnabled() then
        jd_cloud_checker.data.cloud_sprite:setPos(jd_cloud_checker.data.position.debug)
    end

    if not host:isAvatarUploaded() then
        jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.not_uploaded"), 24, 16)
    elseif host:isAvatarUploaded() and show_uploaded then
        jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.uploaded"), 24, 16)
    else
        jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.none"), 24, 16)
    end
end

return jd_cloud_checker
