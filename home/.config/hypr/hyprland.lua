-- Hyprland Lua 설정 파일 (hyprland.conf 에서 마이그레이션)
-- 참고: https://wiki.hypr.land/Configuring/Start/
--
-- 이 설정 파일을 여러 개의 파일로 분할할 수 있습니다.
-- 별도의 파일을 생성한 후 아래와 같이 이 파일에서 불러오십시오.
-- require("myColors")

-------------------
---- 모니터 설정 ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Monitors/ 참고
--
-- 모니터의 일반적인 구성은 다음과 같습니다.
-- hl.monitor({ output = 이름, mode = 해상도, position = 위치, scale = 배율 })
-- 모니터 정보 보는 방법
-- hyprctl monitors

-- 일반
hl.monitor({ output = "eDP-1", mode = "2160x1350@59.74", position = "4892x1680", scale = 1.0 }) -- 내장 모니터

-- === Monitors (집) ===
-- hl.monitor({ output = "eDP-1", mode = "2160x1350@59.74", position = "4892x1680", scale = 1.0 }) -- 내장 모니터
-- hl.monitor({ output = "DP-5", mode = "1920x1080@60.0", position = "4892x600", scale = 1.0 }) -- 외장 모니터 1 (중앙)
-- hl.monitor({ output = "DP-6", mode = "1920x1080@60.32", position = "3812x600", scale = 1.0, transform = 1 }) -- 외장 모니터 2 (왼쪽)
-- hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = true }) -- 워크스페이스 10
-- hl.workspace_rule({ workspace = "2", monitor = "DP-5", default = true }) -- 워크스페이스 1
-- hl.workspace_rule({ workspace = "1", monitor = "DP-6", default = true }) -- 워크스페이스 2

-- === Monitors (델 워크스테이션) ===
-- hl.monitor({ output = "DP-1", mode = "1920x1080@60.0",  position = "4892x0", scale = 1.0 })                -- 외장 모니터 1 (중앙)
-- hl.monitor({ output = "DP-2", mode = "1920x1080@60.32", position = "3812x0", scale = 1.0, transform = 1 }) -- 외장 모니터 2 (왼쪽)
-- hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true }) -- 워크스페이스 1
-- hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true }) -- 워크스페이스 2
-- hl.config({
--     cursor = {
--         no_hardware_cursors = true, -- transform(회전) 모니터에서 hw cursor 데드존/좌표 버그 회피
--     },
-- })

-- === Monitors (연구실 1) ===
-- hl.monitor({ output = "eDP-1", mode = "2160x1350@59.74", position = "4892x0", scale = 1.0 }) -- 내장 모니터
-- hl.monitor({ output = "DP-5", mode = "2560x1440@29.99", position = "4892x1350", scale = 1.0 }) -- 외장 모니터 1 (중앙)
-- hl.monitor({ output = "DP-6", mode = "2560x1440@29.99", position = "3452x1350", scale = 1.0, transform = 1 }) -- 외장 모니터 2 (왼쪽)
-- hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = true }) -- 워크스페이스 10
-- hl.workspace_rule({ workspace = "2", monitor = "DP-5", default = true }) -- 워크스페이스 1
-- hl.workspace_rule({ workspace = "1", monitor = "DP-6", default = true }) -- 워크스페이스 2

-- === Monitors (연구실 2) ===
-- hl.monitor({ output = "DP-5", mode = "2560x1440@29.99", position = "4892x0", scale = 1.0 }) -- 외장 모니터 1 (중앙)
-- hl.monitor({ output = "DP-6", mode = "2560x1440@29.99", position = "3452x0", scale = 1.0, transform = 1 }) -- 외장 모니터 2 (왼쪽)
-- hl.monitor({ output = "eDP-1", mode = "2160x1350@59.74", position = "4892x1440", scale = 1.0 }) -- 내장 모니터
-- hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = true }) -- 워크스페이스 10
-- hl.workspace_rule({ workspace = "1", monitor = "DP-6", default = true }) -- 워크스페이스 1
-- hl.workspace_rule({ workspace = "2", monitor = "DP-5", default = true }) -- 워크스페이스 2

---------------------
---- 프로그램 설정 ----
---------------------

-- 사용하는 프로그램을 설정하십시오.
local terminal = "kitty"
local fileManager = "nautilus"
local menu = 'rofi -show drun -font "Hack Nerd Font Regular 18" -show-icons'

-----------------
---- 자동 실행 ----
-----------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/ 참고
-- 필수 프로세스(예: 알림 데몬, 상태 표시줄 등)를 자동 실행합니다.

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-launch dunst --config ~/.config/dunst/dunstrc")
	hl.exec_cmd("tlp start")
	hl.exec_cmd("discord --start-minimized")
	hl.exec_cmd("sh -c 'sleep 30; pkill -TERM -x Discord'") -- 30초 뒤에 discord 종료
	hl.exec_cmd("numlockx on")
	hl.exec_cmd("copyq")
	hl.exec_cmd("mako")
	hl.exec_cmd("hypridle")
	hl.exec_cmd(
		"systemd-run --user --unit=waybar-hyprland --collect --property=Restart=on-failure --property=RestartSec=2s --property='ExecCondition=/usr/bin/hyprctl -q monitors' /usr/bin/waybar"
	)

	-- 로그인 시 브릿지 자동 실행
	hl.exec_cmd("clipboard-sync")

	-- fcitx5 자동 실행
	hl.exec_cmd("fcitx5 -d --replace")

	-- 바탕화면 설정
	-- hl.exec_cmd("swww init && swww img ~/.config/hypr/thinkpad_wallpaper.png")
	hl.exec_cmd("hyprpaper")
end)

-- Kime 를 쓰려면 위 fcitx5 대신 아래를 사용하십시오.
-- hl.on("hyprland.start", function() hl.exec_cmd("kime") end)
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("GLFW_IM_MODULE", "ibus")  -- kitty가 Wayland text-input(kime) 활성화
-- hl.env("GTK_IM_MODULE", "kime")
-- hl.env("QT_IM_MODULE", "kime")
-- hl.env("XMODIFIERS", "@im=kime")

---------------------
---- 환경 변수 설정 ----
---------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/ 참고

-- fcitx5 입력기
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("GLFW_IM_MODULE", "ibus") -- kitty의 Wayland text-input 활성화
hl.env("SDL_IM_MODULE", "fcitx")

-- Firefox는 GTK의 Wayland text-input-v3 경로를 사용한다.
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- XCursor(마우스 커서) 테마 변경
hl.env("HYPRCURSOR_SIZE", "48")
hl.env("XCURSOR_THEME", "Oxygen 01 Yellow")
hl.env("XCURSOR_SIZE", "48")

---------------------
---- 외형 및 스타일 ----
---------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/ 참고
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 5,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- true로 설정하면 창의 테두리나 간격을 클릭하여 크기를 조정할 수 있음
		resize_on_border = true,

		-- 이 옵션을 활성화하기 전에 https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ 문서를 참고하십시오.
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- 포커스를 받은 창과 받지 않은 창의 투명도 설정
		active_opacity = 1.0,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- 애니메이션 커브, https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/ 참고
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ 참고
-- "스마트 간격" / "창이 하나만 있을 때 간격 없음"
-- 사용하려면 주석을 해제하십시오.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ 참고
hl.config({
	dwindle = {
		preserve_split = true, -- 활성화하는 것이 좋음.
	},
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ 참고
hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0, -- 0 또는 1로 설정하면 애니메이션 마스코트 배경을 비활성화함.
		disable_hyprland_logo = false, -- true로 설정하면 Hyprland 로고 및 애니메이션 캐릭터 배경을 비활성화함.
	},
})

-----------------
---- 입력 설정 ----
-----------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "korean:ralt_hangul,korean:rctrl_hanja",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 ~ 1.0, 0은 기본값.

		touchpad = {
			-- natural_scroll = false,
			natural_scroll = true,
			scroll_factor = 1.0,
		},
	},
})

-- https://wiki.hypr.land/Configuring/Basics/Gestures/ 참고
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- 개별 장치 설정
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ 참고
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
hl.device({ name = "tpps/2-elan-trackpoint", sensitivity = -0.7 })
-- hl.device({ name = "elan0670:00-04f3:3150-touchpad", sensitivity = 0.8, scroll_method = "edge", scroll_factor = 0.3 })
hl.device({ name = "elan0670:00-04f3:3150-touchpad", sensitivity = 0.8 })

-- hl.device({
--     name                   = "elan0670:00-04f3:3150-touchpad",
--     tap_to_click           = true,   -- click-on-tap 활성화
--     tap_button_map         = "lrm",  -- 1손가락: left click, 2손가락: right click, 3손가락: middle click
--     disable_while_typing   = true,   -- 타이핑 중 터치패드 비활성화
--     scroll_method          = "two_finger",
-- })

-----------------
---- 키 바인딩 ----
-----------------

-- https://wiki.hypr.land/Configuring/Basics/Binds/ 참고
local mainMod = "SUPER" -- "Windows" 키를 주 수정 키로 설정

-- 창 종료
hl.bind(mainMod .. " + X", hl.dsp.window.close()) -- 창 종료 1
hl.bind("ALT + F4", hl.dsp.window.close()) -- 창 종료 2

-- 프로그램 키 바인딩
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal)) -- 터미널 실행
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal)) -- 터미널 실행
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu)) -- Rofi 실행
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("terminator -e nmtui")) -- Network Manager (nmtui) 실행
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pavucontrol")) -- 오디오 설정 (Pavucontrol) 실행
-- hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd("google-chrome-stable --ozone-platform=x11"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd("copyq show")) -- 클립보드 관리자 (CopyQ) 실행
hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd("nautilus")) -- 파일 관리자 (PCManFM) 실행
-- hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd(fileManager))        -- 파일 관리자 (dolphin) 실행
hl.bind("XF86Calculator", hl.dsp.exec_cmd("mate-calc")) -- Mate Calculator 실행
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock")) -- 화면보호기(hyprlock) 실행
hl.bind(mainMod .. " + ALT + H", hl.dsp.exec_cmd("systemctl hibernate")) -- 시스템 최대 절전 모드
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("systemctl suspend")) -- 시스템 절전 모드

-- 덮개 닫아도 suspend 안 되게 (이번 부팅 한정, 터미널 창 유지)
local lidInhibitCmd =
	[[kitty --hold sh -c 'echo "==============================================="; echo "덮개 닫아도 suspend 안 되게 유지"; echo "  실행 중: systemd-inhibit --what=handle-lid-switch"; echo "  이 창을 닫거나 Ctrl+C 하면 해제됩니다."; echo "==============================================="; echo; systemd-inhibit --what=handle-lid-switch --why="작업 유지" sleep infinity']]
hl.bind(mainMod .. " + ALT + I", hl.dsp.exec_cmd(lidInhibitCmd)) -- 덮개 닫아도 suspend

-- kitty 폰트 크기 조절용 단축키
hl.bind(mainMod .. " + ALT + 1", hl.dsp.exec_cmd("kitty @ set-font-size 10"))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.exec_cmd("kitty @ set-font-size 18"))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.exec_cmd("kitty @ set-font-size 26"))

-- 창 조작
-- hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())            -- Hyprland 종료
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- 창을 플로팅 상태로 전환
hl.bind(mainMod .. " + H", hl.dsp.layout("togglesplit")) -- 레이아웃에서 분할 방식 전환 (Horizontal, Vertical)
hl.bind(mainMod .. " + W", hl.dsp.window.fullscreen()) -- FullScreen
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- 창을 플로팅 상태로 전환

-- Alt+Tab
hl.config({
	binds = {
		workspace_back_and_forth = true,
	},
})
hl.bind("ALT + TAB", hl.dsp.focus({ last = true }))

-- 방향키로 창 이동
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "left" })) -- 왼  쪽
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" })) -- 오른쪽
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ direction = "up" })) -- 위
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "down" })) -- 아  래

-- 키보드로 창 이동
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" })) -- 왼  쪽
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" })) -- 오른쪽
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" })) -- 위
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" })) -- 아  래

-- 방향키로 창 포커스 이동
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" })) -- 왼  쪽
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" })) -- 오른쪽
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" })) -- 위
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" })) -- 아  래

-- 키보드로 창 포커스 이동
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "left" })) -- 왼  쪽
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" })) -- 오른쪽
hl.bind(mainMod .. " + I", hl.dsp.focus({ direction = "up" })) -- 위
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "down" })) -- 아  래

-- 주 수정 키(mainMod) + [0-9]로 워크스페이스 전환
-- 주 수정 키(mainMod) + SHIFT + [0-9]로 현재 창을 특정 워크스페이스로 이동
for i = 1, 10 do
	local key = i % 10 -- 10은 0 키에 대응
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- 방향키로 워크스페이스 전환
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))

-- 마우스로 창 이동/크기 조절
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 키보드로 창 크기 조절: Resize 모드 진입
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

-- Resize 모드에서 방향키로 창 크기 조절
hl.define_submap("resize", function()
	hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	hl.bind("j", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("i", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	-- Resize 모드 종료
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("Return", hl.dsp.submap("reset"))
end)

-- 노트북 멀티미디어 키 (볼륨 및 LCD 밝기 조절)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- playerctl이 필요함 (미디어 컨트롤 키)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------------------
---- 창 및 워크스페이스 설정 ----
---------------------------

-- 창 규칙 관련 정보: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- 워크스페이스 규칙 관련 정보: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- 창 규칙 예제
-- hl.window_rule({ name = "float-kitty", match = { class = "^(kitty)$" }, float = true })

-- 애플리케이션의 창 최대화 요청을 무시합니다. 이 설정이 유용할 수 있습니다.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- XWayland에서 창 드래그 관련 문제 해결
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		-- float   = true,
		fullscreen = false,
		-- pin     = false,
	},

	no_focus = true,
})
