-- LocalScript (IDLE)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- CONFIG
local IDLE_ID = "rbxassetid://COLOQUE_O_ID_DO_IDLE"
local FADE_TIME = 0.25 -- transição suave

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")

	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = humanoid
	end

	local idleAnim = Instance.new("Animation")
	idleAnim.AnimationId = IDLE_ID

	local idleTrack = animator:LoadAnimation(idleAnim)
	idleTrack.Priority = Enum.AnimationPriority.Idle
	idleTrack.Looped = true

	RunService.RenderStepped:Connect(function()
		-- Só idle quando estiver totalmente parado
		if humanoid.MoveDirection.Magnitude == 0 then
			if not idleTrack.IsPlaying then
				idleTrack:Play(FADE_TIME)
			end
		else
			if idleTrack.IsPlaying then
				idleTrack:Stop(FADE_TIME)
			end
		end
	end)
end

if player.Character then
	onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)
