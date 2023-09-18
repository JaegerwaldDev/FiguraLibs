--[[                                                                   __________
					        									______/          \__
  		__  ____   _____  _              _  _____  _           /  _  /            \ \
	 __|  ||    \ |     || | ___  _ _  _| ||     || |_  ___  ___ | |_  ___  ___     /\
	|  |  ||  |  ||   --|| || . || | || . ||   --||   || -_||  _|| '_|| -_||  _|      |
	|_____||____/ |_____||_||___||___||___||_____||_|_||___||___||_,_||___||_|   ____/

	Developed by https://www.github.com/JaegerwaldDev
	w/ some optimisation help from https://www.github.com/superpowers04
	GitHub @ https://www.github.com/JaegerwaldDev/FiguraLibs
	Documentation @ https://github.com/JaegerwaldDev/FiguraLibs/blob/main/jd_cloud_checker.md

	Copyright (c) JaegerwaldDev 2023

	Description: Shows a little icon in the corner of your screen to show if your avatar is currently uploaded to the figura cloud or not.
	Version: 1.3.0

]]--

if not host:isHost() then 
	return {
        main = function() end,
        tick = function() end
    }
end

local jailib = require("modules.jailib.main")

local jd_cloud_checker = {
	show_uploaded = false,
    debug_overlay = nil,
	data = {
		sprites = {
			not_uploaded = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAQCAMAAAA7+k+nAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABaUExURQAAAOL2/vr///////T8/34HB+QMDP7///P8/+H1/t/1/uD0/tv0/t3z/tvz/tTy/tfy/tXx/tTw/s/v/tDv/tHu/tDu/szu/svu/snu/sju/sru/sfu/gAAAOpMPNkAAAAedFJOU///////////////////////////////////////AOwYHF4AAAAJcEhZcwAADsMAAA7DAcdvqGQAAACmSURBVChTVZAJEoQgDAQjAWHvW1mU/39zZwDZcqpMQrfgIblHmDZj1TqmgenrbRAZDNNN7cCDUaab0jZsre2GFaeoOnBUqzsBMjr1pbYtKNxgyTwv34zUg1RJRxcCzYG3y9GoR0IgR4c4FXE2hdcdHNVcrjhIbvdiSKtR83hCZHm98cVgvX6miSLLPMcY3RdJLqW4LPyX5c3WNaX1H7Ii8KBdQHL+AaEtFDoMnibyAAAAAElFTkSuQmCC",
			uploaded = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAQCAMAAAA7+k+nAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABaUExURQAAAOL2/vr///////T8//7//wCEIRPdRvP8/+H1/t/1/uD0/tv0/t3z/tvz/tTy/tfy/tXx/tTw/s/v/tDv/tHu/tDu/szu/svu/snu/sju/sru/sfu/gAAAKd5KMkAAAAedFJOU///////////////////////////////////////AOwYHF4AAAAJcEhZcwAADsMAAA7DAcdvqGQAAAClSURBVChTVZAJEoMgDEVjQihd7apW5f7X7E9AOr4ZDPwX40K5QUbd41Qrdp3RztuGqGOjmVIRdyxGM162OITQjF0xxbuDr52wZhEViW0YLnYD4qCq8RC1GtoGxZInhTlaO51Yaq8tTRBnFxdGrgmp5UD4esMg6u9uSr8h/HhCZHq9/Zs5lsL8GQYTmcZxAl8wg2lZ7F/6m63rPK9/LHOBB+1AkvMPdXYUCy3CdPsAAAAASUVORK5CYII="
		},
		cloud_sprite = jailib.hud:newSprite("cloud_sprite"),
		position = {
			normal = vec(-8, -8, 0), -- You can set y to -22 to move down for showFPS being enabled in Sodium/Optifine
			debug = vec(-8, -235, 0)
		}
	}
}

textures:read("jd_cloud_checker.not_uploaded", jd_cloud_checker.data.sprites.not_uploaded)
textures:read("jd_cloud_checker.uploaded", jd_cloud_checker.data.sprites.uploaded)

jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.not_uploaded"), 24, 16)

function jd_cloud_checker.update_sprite_position()
	if jd_cloud_checker.data.debug_overlay ~= client:isDebugOverlayEnabled() then
		jd_cloud_checker.data.debug_overlay = client:isDebugOverlayEnabled()
		jd_cloud_checker.data.cloud_sprite:setPos(jd_cloud_checker.data.position[jd_cloud_checker.data.debug_overlay and "debug" or "normal"])
	end
end
function jd_cloud_checker.check()
	if not host:isAvatarUploaded() then return end

	events.tick:remove("JDCloudChecker.Checker")
	if jd_cloud_checker.show_uploaded then 
		jd_cloud_checker.data.cloud_sprite:setTexture(textures:get("jd_cloud_checker.uploaded"), 24, 16)
		return
	end
	
	events.tick:remove("JDCloudChecker.SpritePositionUpdater")
	jd_cloud_checker.data.cloud_sprite:moveTo()
end

function jd_cloud_checker.tick(show_uploaded)
	jd_cloud_checker.show_uploaded = show_uploaded or false

	events.tick:register(jd_cloud_checker.check, "JDCloudChecker.Checker")
	events.tick:register(jd_cloud_checker.update_sprite_position, "JDCloudChecker.SpritePositionUpdater")
end

return jd_cloud_checker
