local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local plr = Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
if pg:FindFirstChild("HanzLoading") then pg.HanzLoading:Destroy() end
if pg:FindFirstChild("hanzPauseGui") then pg.hanzPauseGui:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "HanzLoading"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = pg

local cam = workspace.CurrentCamera or workspace:WaitForChild("Camera")
local vp = cam.ViewportSize
local W, H = vp.X, vp.Y
local M = math.min(W, H)
local centerY = H * 0.40
local titleSize = math.clamp(M * 0.16, 96, 200)
local barW = math.clamp(M * 0.42, 320, 560)
local barH = 3
local progY = centerY + titleSize * 0.85 + 78
local pctY = progY + 30
local wordY = pctY + 26

local QO = Enum.EasingStyle.Quint
local QD = Enum.EasingDirection.Out
local SO = Enum.EasingStyle.Sine
local SD = Enum.EasingDirection.InOut
local LO = Enum.EasingStyle.Linear

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(18, 12, 32)
bg.BorderSizePixel = 0
bg.ZIndex = 1
bg.Parent = gui

local bgG = Instance.new("UIGradient")
bgG.Rotation = 135
bgG.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 28, 52)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(42, 18, 68)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(62, 22, 52)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 24)),
}
bgG.Parent = bg

for _, cfg in ipairs({
    { rot = -24, w = M * 2, h = 280, c = Color3.fromRGB(190, 120, 255), t = 0.90, dur = 22, x1 = -0.4, x2 = 1.4, delay = 0 },
    { rot = -24, w = M * 2, h = 200, c = Color3.fromRGB(120, 180, 255), t = 0.93, dur = 32, x1 = 1.4, x2 = -0.4, delay = 6 },
    { rot = -24, w = M * 1.5, h = 160, c = Color3.fromRGB(255, 140, 220), t = 0.94, dur = 40, x1 = -0.4, x2 = 1.4, delay = 12 },
}) do
    local ray = Instance.new("Frame")
    ray.AnchorPoint = Vector2.new(0.5, 0.5)
    ray.Position = UDim2.fromScale(cfg.x1, 0.5)
    ray.Size = UDim2.fromOffset(cfg.w, cfg.h)
    ray.Rotation = cfg.rot
    ray.BackgroundColor3 = cfg.c
    ray.BackgroundTransparency = cfg.t
    ray.BorderSizePixel = 0
    ray.ZIndex = 2
    ray.Parent = gui

    local g = Instance.new("UIGradient")
    g.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.4, 0.15),
        NumberSequenceKeypoint.new(0.6, 0.15),
        NumberSequenceKeypoint.new(1, 1),
    }
    g.Parent = ray

    TweenService:Create(ray, TweenInfo.new(cfg.dur, LO, QD, -1, false, cfg.delay), { Position = UDim2.fromScale(cfg.x2, 0.5) }):Play()
end

for i = 1, 18 do
    local ln = Instance.new("Frame")
    ln.Size = UDim2.new(1, 0, 0, 1)
    ln.Position = UDim2.fromScale(0, i / 19)
    ln.BackgroundColor3 = Color3.fromRGB(140, 110, 200)
    ln.BackgroundTransparency = 0.94
    ln.BorderSizePixel = 0
    ln.ZIndex = 3
    ln.Parent = gui
    TweenService:Create(ln, TweenInfo.new(8 + math.random() * 4, SO, SD, -1, true), { BackgroundTransparency = 0.88 }):Play()
end
for i = 1, 22 do
    local ln = Instance.new("Frame")
    ln.Size = UDim2.new(0, 1, 1, 0)
    ln.Position = UDim2.fromScale(i / 23, 0)
    ln.BackgroundColor3 = Color3.fromRGB(140, 110, 200)
    ln.BackgroundTransparency = 0.94
    ln.BorderSizePixel = 0
    ln.ZIndex = 3
    ln.Parent = gui
    TweenService:Create(ln, TweenInfo.new(8 + math.random() * 4, SO, SD, -1, true), { BackgroundTransparency = 0.88 }):Play()
end

for i = 1, 20 do
    local sz = math.random(6, 16)
    local shard = Instance.new("Frame")
    shard.AnchorPoint = Vector2.new(0.5, 0.5)
    local px, py = math.random(4, 96) / 100, math.random(4, 96) / 100
    shard.Position = UDim2.fromScale(px, py)
    shard.Size = UDim2.fromOffset(sz, sz)
    shard.Rotation = math.random(0, 360)
    shard.BackgroundTransparency = 1
    shard.BorderSizePixel = 0
    shard.ZIndex = 4
    shard.Parent = gui

    local st = Instance.new("UIStroke")
    st.Thickness = 1
    st.Color = (i % 4 == 0) and Color3.fromRGB(255, 190, 240) or Color3.fromRGB(200, 160, 255)
    st.Transparency = 0.7
    st.Parent = shard

    local cor = Instance.new("UICorner")
    cor.CornerRadius = UDim.new(0.15, 0)
    cor.Parent = shard

    TweenService:Create(shard, TweenInfo.new(4 + math.random() * 4, LO, QD, -1), { Rotation = shard.Rotation + 360 }):Play()
    TweenService:Create(shard, TweenInfo.new(6 + math.random() * 4, SO, SD, -1, true), {
        Position = UDim2.fromScale(px + (math.random() - 0.5) * 0.08, py + (math.random() - 0.5) * 0.08),
    }):Play()
    TweenService:Create(st, TweenInfo.new(2.5 + math.random() * 2, SO, SD, -1, true), { Transparency = 0.4 }):Play()
end

local vt = Instance.new("Frame")
vt.Size = UDim2.new(1, 0, 0.25, 0)
vt.Position = UDim2.fromScale(0, 0)
vt.BackgroundColor3 = Color3.new(0, 0, 0)
vt.BackgroundTransparency = 0.4
vt.BorderSizePixel = 0
vt.ZIndex = 5
vt.Parent = gui

local vtG = Instance.new("UIGradient")
vtG.Rotation = 90
vtG.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 1),
}
vtG.Parent = vt

local vb = vt:Clone()
vb.Position = UDim2.fromScale(0, 0.75)
vb.UIGradient.Rotation = 270
vb.Parent = gui

for side = -1, 1, 2 do
    local sideFrame = Instance.new("Frame")
    sideFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    sideFrame.Position = UDim2.fromScale(side < 0 and 0.05 or 0.95, 0.5)
    sideFrame.Size = UDim2.new(0, 1, 0.4, 0)
    sideFrame.BackgroundColor3 = Color3.fromRGB(160, 130, 220)
    sideFrame.BackgroundTransparency = 0.7
    sideFrame.BorderSizePixel = 0
    sideFrame.ZIndex = 6
    sideFrame.Parent = gui

    local dot = Instance.new("Frame")
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.fromOffset(4, 4)
    dot.Position = UDim2.fromScale(0.5, 0.5)
    dot.BackgroundColor3 = (side < 0) and Color3.fromRGB(180, 240, 255) or Color3.fromRGB(255, 180, 240)
    dot.BorderSizePixel = 0
    dot.Parent = sideFrame

    local dc = Instance.new("UICorner")
    dc.CornerRadius = UDim.new(1, 0)
    dc.Parent = dot

    TweenService:Create(dot, TweenInfo.new(3 + math.random() * 2, SO, SD, -1, true), { Position = UDim2.fromScale(0.5, 1) }):Play()
end

for _, cfg in ipairs({
    { r = M * 0.36, n = 12, dsz = 3, c = Color3.fromRGB(200, 160, 255), dur = 22, dir = 1, t = 0.4 },
    { r = M * 0.44, n = 16, dsz = 2, c = Color3.fromRGB(150, 200, 255), dur = 32, dir = -1, t = 0.5 },
    { r = M * 0.52, n = 20, dsz = 2, c = Color3.fromRGB(255, 160, 220), dur = 44, dir = 1, t = 0.6 },
}) do
    local ring = Instance.new("Frame")
    ring.AnchorPoint = Vector2.new(0.5, 0.5)
    ring.Position = UDim2.new(0.5, 0, 0, centerY)
    ring.Size = UDim2.fromOffset(cfg.r * 2, cfg.r * 2)
    ring.BackgroundTransparency = 1
    ring.ZIndex = 7
    ring.Parent = gui

    for j = 1, cfg.n do
        local a = (j / cfg.n) * math.pi * 2
        local dot = Instance.new("Frame")
        dot.AnchorPoint = Vector2.new(0.5, 0.5)
        dot.Position = UDim2.fromScale(0.5 + math.cos(a) * 0.5, 0.5 + math.sin(a) * 0.5)
        dot.Size = UDim2.fromOffset(cfg.dsz, cfg.dsz)
        dot.BackgroundColor3 = cfg.c
        dot.BackgroundTransparency = cfg.t
        dot.BorderSizePixel = 0
        dot.Parent = ring

        local dc = Instance.new("UICorner")
        dc.CornerRadius = UDim.new(1, 0)
        dc.Parent = dot

        TweenService:Create(dot, TweenInfo.new(1.5 + math.random() * 2, SO, SD, -1, true), { BackgroundTransparency = 0.9 }):Play()
    end

    if cfg.dir > 0 then
        TweenService:Create(ring, TweenInfo.new(cfg.dur, LO, QD, -1), { Rotation = 360 }):Play()
    else
        TweenService:Create(ring, TweenInfo.new(cfg.dur, LO, QD, -1), { Rotation = -360 }):Play()
    end
end

local titleGroup = Instance.new("Frame")
titleGroup.AnchorPoint = Vector2.new(0.5, 0.5)
titleGroup.Position = UDim2.new(0.5, 0, 0, centerY)
titleGroup.Size = UDim2.fromOffset(M * 1.2, titleSize * 1.6)
titleGroup.BackgroundTransparency = 1
titleGroup.ZIndex = 10
titleGroup.Parent = gui

local tScale = Instance.new("UIScale")
tScale.Scale = 1.25
tScale.Parent = titleGroup

for side = -1, 1, 2 do
    local acc = Instance.new("Frame")
    acc.AnchorPoint = Vector2.new(0.5, 0.5)
    acc.Position = UDim2.new(0.5, side * (titleSize * 1.35), 0.5, 0)
    acc.Size = UDim2.fromOffset(9, 9)
    acc.Rotation = 45
    acc.BackgroundColor3 = Color3.fromRGB(255, 210, 140)
    acc.BackgroundTransparency = 1
    acc.BorderSizePixel = 0
    acc.ZIndex = 11
    acc.Parent = titleGroup

    local ac = Instance.new("UIStroke")
    ac.Thickness = 1.5
    ac.Color = Color3.fromRGB(255, 210, 140)
    ac.Transparency = 1
    ac.Parent = acc

    TweenService:Create(acc, TweenInfo.new(1.0, QO, QD, 0, false, 0.8), { BackgroundTransparency = 0.3 }):Play()
    TweenService:Create(ac, TweenInfo.new(1.0, QO, QD, 0, false, 0.8), { Transparency = 0.5 }):Play()
    TweenService:Create(acc, TweenInfo.new(2.2, SO, SD, -1, true, 1.8), { Rotation = 45 + 180 }):Play()
end

local bOffX = titleSize * 1.05
local bOffY = titleSize * 0.55
for _, cfg in ipairs({
    { dx = -1, dy = -1, rot = 0 },
    { dx = 1, dy = -1, rot = 90 },
    { dx = 1, dy = 1, rot = 180 },
    { dx = -1, dy = 1, rot = 270 },
}) do
    local br = Instance.new("Frame")
    br.AnchorPoint = Vector2.new(0.5, 0.5)
    br.Position = UDim2.new(0.5, cfg.dx * bOffX, 0.5, cfg.dy * bOffY)
    br.Size = UDim2.fromOffset(22, 22)
    br.BackgroundTransparency = 1
    br.Rotation = cfg.rot
    br.ZIndex = 11
    br.Parent = titleGroup

    local h = Instance.new("Frame")
    h.Size = UDim2.new(1, 0, 0, 1.5)
    h.BackgroundColor3 = Color3.fromRGB(180, 150, 255)
    h.BackgroundTransparency = 1
    h.BorderSizePixel = 0
    h.Parent = br

    local v = Instance.new("Frame")
    v.Size = UDim2.new(0, 1.5, 1, 0)
    v.BackgroundColor3 = Color3.fromRGB(180, 150, 255)
    v.BackgroundTransparency = 1
    v.BorderSizePixel = 0
    v.Parent = br

    TweenService:Create(h, TweenInfo.new(1.0, QO, QD, 0, false, 0.6), { BackgroundTransparency = 0.5 }):Play()
    TweenService:Create(v, TweenInfo.new(1.0, QO, QD, 0, false, 0.6), { BackgroundTransparency = 0.5 }):Play()
end

local tGlow = Instance.new("TextLabel")
tGlow.Size = UDim2.fromScale(1, 1)
tGlow.BackgroundTransparency = 1
tGlow.Font = Enum.Font.GothamBlack
tGlow.Text = "hanz"
tGlow.TextSize = titleSize
tGlow.TextColor3 = Color3.fromRGB(200, 140, 255)
tGlow.TextTransparency = 1
tGlow.ZIndex = 10
tGlow.Parent = titleGroup

local tGG = Instance.new("UIGradient")
tGG.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 120, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 180, 255)),
}
tGG.Rotation = 90
tGG.Parent = tGlow

local tGS = Instance.new("UIStroke")
tGS.Thickness = 8
tGS.Color = Color3.fromRGB(190, 130, 255)
tGS.Transparency = 1
tGS.Parent = tGlow

local tRed = Instance.new("TextLabel")
tRed.AnchorPoint = Vector2.new(0.5, 0.5)
tRed.Position = UDim2.new(0.5, -2, 0.5, -1)
tRed.Size = UDim2.fromScale(1, 1)
tRed.BackgroundTransparency = 1
tRed.Font = Enum.Font.GothamBlack
tRed.Text = "hanz"
tRed.TextSize = titleSize
tRed.TextColor3 = Color3.fromRGB(255, 80, 120)
tRed.TextTransparency = 1
tRed.ZIndex = 11
tRed.Parent = titleGroup

local tBlue = tRed:Clone()
tBlue.Position = UDim2.new(0.5, 2, 0.5, 1)
tBlue.TextColor3 = Color3.fromRGB(100, 140, 255)
tBlue.Parent = titleGroup

local tMain = Instance.new("TextLabel")
tMain.AnchorPoint = Vector2.new(0.5, 0.5)
tMain.Position = UDim2.fromScale(0.5, 0.5)
tMain.Size = UDim2.fromScale(1, 1)
tMain.BackgroundTransparency = 1
tMain.Font = Enum.Font.GothamBlack
tMain.Text = "hanz"
tMain.TextSize = titleSize
tMain.TextColor3 = Color3.fromRGB(255, 255, 255)
tMain.TextTransparency = 1
tMain.ZIndex = 12
tMain.Parent = titleGroup

local tMG = Instance.new("UIGradient")
tMG.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 230, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 235, 255)),
}
tMG.Rotation = 90
tMG.Parent = tMain

local tMS = Instance.new("UIStroke")
tMS.Thickness = 1.5
tMS.Color = Color3.fromRGB(255, 255, 255)
tMS.Transparency = 1
tMS.Parent = tMain

local accLine = Instance.new("Frame")
accLine.AnchorPoint = Vector2.new(0.5, 0)
accLine.Position = UDim2.new(0.5, 0, 0, centerY + titleSize * 0.55 + 30)
accLine.Size = UDim2.fromOffset(0, 1)
accLine.BackgroundColor3 = Color3.fromRGB(180, 150, 255)
accLine.BackgroundTransparency = 0.4
accLine.BorderSizePixel = 0
accLine.ClipsDescendants = true
accLine.ZIndex = 8
accLine.Parent = gui

local accLen = math.clamp(M * 0.28, 160, 340)
TweenService:Create(accLine, TweenInfo.new(1.2, QO, QD, 0, false, 1.0), { Size = UDim2.fromOffset(accLen, 1) }):Play()

local hl = Instance.new("Frame")
hl.AnchorPoint = Vector2.new(0.5, 0.5)
hl.Size = UDim2.fromOffset(40, 1)
hl.Position = UDim2.fromScale(-0.2, 0.5)
hl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hl.BackgroundTransparency = 0.2
hl.BorderSizePixel = 0
hl.Parent = accLine

local hlG = Instance.new("UIGradient")
hlG.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1),
}
hlG.Parent = hl

TweenService:Create(hl, TweenInfo.new(2.4, LO, QD, -1), { Position = UDim2.fromScale(1.2, 0.5) }):Play()

local barGlow = Instance.new("Frame")
barGlow.AnchorPoint = Vector2.new(0.5, 0.5)
barGlow.Position = UDim2.new(0.5, 0, 0, progY)
barGlow.Size = UDim2.fromOffset(barW + 100, barH + 40)
barGlow.BackgroundColor3 = Color3.fromRGB(180, 130, 255)
barGlow.BackgroundTransparency = 1
barGlow.BorderSizePixel = 0
barGlow.ZIndex = 8
barGlow.Parent = gui

local bgc = Instance.new("UICorner")
bgc.CornerRadius = UDim.new(1, 0)
bgc.Parent = barGlow

local barTrack = Instance.new("Frame")
barTrack.AnchorPoint = Vector2.new(0.5, 0.5)
barTrack.Position = UDim2.new(0.5, 0, 0, progY)
barTrack.Size = UDim2.fromOffset(barW, barH)
barTrack.BackgroundColor3 = Color3.fromRGB(50, 36, 78)
barTrack.BackgroundTransparency = 1
barTrack.BorderSizePixel = 0
barTrack.ClipsDescendants = true
barTrack.ZIndex = 9
barTrack.Parent = gui

local btc = Instance.new("UICorner")
btc.CornerRadius = UDim.new(1, 0)
btc.Parent = barTrack

local barFill = Instance.new("Frame")
barFill.Size = UDim2.fromScale(0, 1)
barFill.BackgroundColor3 = Color3.fromRGB(220, 210, 255)
barFill.BorderSizePixel = 0
barFill.ZIndex = 9
barFill.Parent = barTrack

local bfc = Instance.new("UICorner")
bfc.CornerRadius = UDim.new(1, 0)
bfc.Parent = barFill

local bfg = Instance.new("UIGradient")
bfg.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 180, 240)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(210, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 220, 255)),
}
bfg.Parent = barFill

local barShine = Instance.new("Frame")
barShine.AnchorPoint = Vector2.new(0.5, 0.5)
barShine.Size = UDim2.fromScale(0.35, 1.6)
barShine.Position = UDim2.fromScale(-0.2, 0.5)
barShine.Rotation = 15
barShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barShine.BackgroundTransparency = 0.55
barShine.BorderSizePixel = 0
barShine.Parent = barFill

local bsg = Instance.new("UIGradient")
bsg.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1),
}
bsg.Parent = barShine

TweenService:Create(barShine, TweenInfo.new(2.4, LO, QD, -1), { Position = UDim2.fromScale(1.2, 0.5) }):Play()

for _, cfg in ipairs({
    { x = -barW / 2 - 14 },
    { x = barW / 2 + 14 },
}) do
    local cap = Instance.new("Frame")
    cap.AnchorPoint = Vector2.new(0.5, 0.5)
    cap.Position = UDim2.new(0.5, cfg.x, 0, progY)
    cap.Size = UDim2.fromOffset(10, 10)
    cap.Rotation = 45
    cap.BackgroundTransparency = 1
    cap.BorderSizePixel = 0
    cap.ZIndex = 10
    cap.Parent = gui

    local cs = Instance.new("UIStroke")
    cs.Thickness = 1.5
    cs.Color = Color3.fromRGB(255, 210, 140)
    cs.Transparency = 1
    cs.Parent = cap

    TweenService:Create(cs, TweenInfo.new(1.0, QO, QD, 0, false, 1.4), { Transparency = 0.4 }):Play()
    TweenService:Create(cap, TweenInfo.new(2.0, SO, SD, -1, true, 1.8), { Rotation = 45 + 90 }):Play()
end

local pct = Instance.new("TextLabel")
pct.AnchorPoint = Vector2.new(0.5, 0.5)
pct.Position = UDim2.new(0.5, 0, 0, pctY)
pct.Size = UDim2.fromOffset(barW, 20)
pct.BackgroundTransparency = 1
pct.Font = Enum.Font.GothamMedium
pct.Text = "0%"
pct.TextSize = math.clamp(M * 0.02, 12, 15)
pct.TextColor3 = Color3.fromRGB(190, 175, 220)
pct.TextTransparency = 1
pct.ZIndex = 10
pct.Parent = gui

TweenService:Create(pct, TweenInfo.new(1.0, QO, QD, 0, false, 1.4), { TextTransparency = 0.15 }):Play()

local word = Instance.new("TextLabel")
word.AnchorPoint = Vector2.new(0.5, 0.5)
word.Position = UDim2.new(0.5, 0, 0, wordY)
word.Size = UDim2.fromOffset(barW, 16)
word.BackgroundTransparency = 1
word.Font = Enum.Font.Gotham
word.Text = "initializing"
word.TextSize = math.clamp(M * 0.016, 10, 13)
word.TextColor3 = Color3.fromRGB(120, 105, 145)
word.TextTransparency = 1
word.ZIndex = 10
word.Parent = gui

TweenService:Create(word, TweenInfo.new(1.0, QO, QD, 0, false, 1.6), { TextTransparency = 0.3 }):Play()

TweenService:Create(tScale, TweenInfo.new(2.0, QO, QD, 0, false, 0.2), { Scale = 1 }):Play()
TweenService:Create(tMain, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { TextTransparency = 0 }):Play()
TweenService:Create(tMS, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { Transparency = 0.4 }):Play()
TweenService:Create(tGlow, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { TextTransparency = 0.55 }):Play()
TweenService:Create(tGS, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { Transparency = 0.85 }):Play()
TweenService:Create(tRed, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { TextTransparency = 0.82 }):Play()
TweenService:Create(tBlue, TweenInfo.new(1.5, QO, QD, 0, false, 0.3), { TextTransparency = 0.82 }):Play()
TweenService:Create(barGlow, TweenInfo.new(1.0, QO, QD, 0, false, 1.2), { BackgroundTransparency = 0.88 }):Play()
TweenService:Create(barTrack, TweenInfo.new(1.0, QO, QD, 0, false, 1.3), { BackgroundTransparency = 0.5 }):Play()

TweenService:Create(tGG, TweenInfo.new(7, LO, QD, -1, false, 2.0), { Rotation = 90 + 360 }):Play()
TweenService:Create(tGlow, TweenInfo.new(3.0, SO, SD, -1, true, 2.2), { TextTransparency = 0.42 }):Play()
TweenService:Create(tScale, TweenInfo.new(2.8, SO, SD, -1, true, 2.5), { Scale = 1.015 }):Play()
TweenService:Create(barGlow, TweenInfo.new(2.6, SO, SD, -1, true, 2.2), { BackgroundTransparency = 0.94 }):Play()
TweenService:Create(tRed, TweenInfo.new(3.2, SO, SD, -1, true, 2.0), { TextTransparency = 0.68 }):Play()
TweenService:Create(tBlue, TweenInfo.new(3.2, SO, SD, -1, true, 2.0), { TextTransparency = 0.68 }):Play()

task.wait(0.5)

local elapsed = 0
local progress = 0
local wordTimer = 0
local wordIdx = 1
local words = { "initializing", "preparing", "loading", "connecting", "finalizing" }
local pulseTimer = 3.0
local pulses = {}

while true do
    local dt = RunService.Heartbeat:Wait()
    elapsed = elapsed + dt

    local cap = game:IsLoaded() and 1 or 0.92
    local target = math.min(cap, 1 - math.exp(-elapsed * 0.7))
    progress = progress + (target - progress) * math.min(1, dt * 5)
    barFill.Size = UDim2.fromScale(progress, 1)
    pct.Text = string.format("%d%%", math.floor(progress * 100 + 0.5))

    wordTimer = wordTimer + dt
    if wordTimer > 2.2 then
        wordTimer = 0
        wordIdx = (wordIdx % #words) + 1
        word.Text = words[wordIdx]
        word.TextTransparency = 1
        TweenService:Create(word, TweenInfo.new(0.5, QO, QD), { TextTransparency = 0.3 }):Play()
    end

    pulseTimer = pulseTimer + dt
    if pulseTimer > 3.5 then
        pulseTimer = 0
        local pulse = Instance.new("Frame")
        pulse.AnchorPoint = Vector2.new(0.5, 0.5)
        pulse.Position = UDim2.new(0.5, 0, 0, centerY)
        pulse.Size = UDim2.fromOffset(60, 60)
        pulse.BackgroundTransparency = 1
        pulse.ZIndex = 9
        pulse.Parent = gui

        local pc = Instance.new("UICorner")
        pc.CornerRadius = UDim.new(1, 0)
        pc.Parent = pulse

        local ps = Instance.new("UIStroke")
        ps.Thickness = 1
        ps.Color = Color3.fromRGB(200, 160, 255)
        ps.Transparency = 0.6
        ps.Parent = pulse

        TweenService:Create(pulse, TweenInfo.new(2.8, QO, QD), { Size = UDim2.fromOffset(M * 0.9, M * 0.9) }):Play()
        TweenService:Create(ps, TweenInfo.new(2.8, QO, QD), { Transparency = 1 }):Play()
        table.insert(pulses, { frame = pulse, t = 0 })
    end

    for i = #pulses, 1, -1 do
        pulses[i].t = pulses[i].t + dt
        if pulses[i].t > 3.0 then
            pulses[i].frame:Destroy()
            table.remove(pulses, i)
        end
    end

    if progress > 0.995 and game:IsLoaded() and elapsed > 4.5 then break end
end

pct.Text = "100%"
barFill.Size = UDim2.fromScale(1, 1)
task.wait(0.5)

local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.new(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.ZIndex = 100
overlay.Parent = gui

TweenService:Create(overlay, TweenInfo.new(1.1, QO, QD), { BackgroundTransparency = 0 }):Play()
task.wait(1.3)
gui:Destroy()

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "hanzPauseGui"
mainGui.ResetOnSpawn = false
mainGui.IgnoreGuiInset = true
mainGui.Parent = pg

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 290)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Active = true
main.ClipsDescendants = true
main.Parent = mainGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(50, 60, 80)
stroke.Thickness = 1
stroke.Parent = main

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "hanz | panel"
titleLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -30, 0, 70)
infoText.Position = UDim2.new(0, 15, 0, 42)
infoText.BackgroundTransparency = 1
infoText.Text = "cara kerja:\nscript ini mengeksekusi vote untuk map 3, lalu map 4. karena map 4 adalah map yang tidak eksis, sistem server akan tertahan menunggu data map yang tidak kunjung datang. efeknya, ronde dan waktu akan berhenti total."
infoText.TextColor3 = Color3.fromRGB(150, 160, 180)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 10
infoText.TextWrapped = true
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.Parent = main

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -30, 0, 40)
btn.Position = UDim2.new(0, 15, 0, 118)
btn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
btn.BorderSizePixel = 0
btn.Text = "execute pause"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
btn.AutoButtonColor = false
btn.Parent = main

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = btn

local chatLabel = Instance.new("TextLabel")
chatLabel.Size = UDim2.new(1, -30, 0, 16)
chatLabel.Position = UDim2.new(0, 15, 0, 166)
chatLabel.BackgroundTransparency = 1
chatLabel.Text = "pesan auto chat"
chatLabel.TextColor3 = Color3.fromRGB(170, 180, 200)
chatLabel.Font = Enum.Font.Gotham
chatLabel.TextSize = 11
chatLabel.TextXAlignment = Enum.TextXAlignment.Left
chatLabel.Parent = main

local chatDisplay = Instance.new("TextLabel")
chatDisplay.Size = UDim2.new(1, -30, 0, 32)
chatDisplay.Position = UDim2.new(0, 15, 0, 186)
chatDisplay.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
chatDisplay.BorderSizePixel = 0
chatDisplay.Text = "PAUSE RONDE BY HANZ"
chatDisplay.TextColor3 = Color3.fromRGB(230, 235, 245)
chatDisplay.Font = Enum.Font.Gotham
chatDisplay.TextSize = 12
chatDisplay.TextXAlignment = Enum.TextXAlignment.Left
chatDisplay.Parent = main

local displayCorner = Instance.new("UICorner")
displayCorner.CornerRadius = UDim.new(0, 6)
displayCorner.Parent = chatDisplay

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -30, 0, 16)
statusLabel.Position = UDim2.new(0, 15, 0, 226)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "status: menunggu pause"
statusLabel.TextColor3 = Color3.fromRGB(120, 130, 150)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = main

local isPaused = false
local autoChatThread = nil
local AUTO_CHAT_INTERVAL = 5
local AUTO_CHAT_MESSAGE = "PAUSE RONDE BY HANZ"

local function sendChat(msg)
    msg = tostring(msg):sub(1, 200)
    if msg == "" then return end

    local sent = false
    local TextChatService = game:GetService("TextChatService")

    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channels = TextChatService:FindFirstChild("TextChannels")
        local general = channels and channels:FindFirstChild("RBXGeneral")
        if general then
            sent = pcall(function()
                general:SendAsync(msg)
            end)
        end
    end

    if not sent then
        local rs = game:GetService("ReplicatedStorage")
        local ev = rs:FindFirstChild("DefaultChatSystemChatEvents")
        local say = ev and ev:FindFirstChild("SayMessageRequest")
        if say then
            say:FireServer(msg, "All")
        end
    end
end

local function stopAutoChat()
    if autoChatThread then
        task.cancel(autoChatThread)
        autoChatThread = nil
    end
end

local function startAutoChat()
    stopAutoChat()
    autoChatThread = task.spawn(function()
        while isPaused do
            sendChat(AUTO_CHAT_MESSAGE)
            task.wait(AUTO_CHAT_INTERVAL)
        end
    end)
end

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

btn.MouseButton1Click:Connect(function()
    if isPaused then return end
    isPaused = true

    btn.Text = "paused"
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)

    local player = game:GetService("Players").LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local compass = backpack:FindFirstChild("Compass")
    if compass then
        humanoid:EquipTool(compass)
        task.wait(0.2)
    end

    local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
    remotes.Compass:FireServer("Vote Map", 3)
    task.wait(0.2)
    remotes.Compass:FireServer("Vote Map", 4)

    task.wait(0.2)
    humanoid:UnequipTools()

    startAutoChat()
    statusLabel.Text = "status: pause, auto chat aktif"
end)

print("[hanz] cinematic loading + pause + auto chat loaded")