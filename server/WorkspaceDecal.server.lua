-- Install one copy as a Script in ServerScriptService for your own place.
local ADMIN_USER_IDS = {
    -- [12345678] = true,
}

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteName = "AdminPlusWorkspaceDecal"
assert(not replicatedStorage:FindFirstChild(remoteName), "Install only one WorkspaceDecal script")

local faces = Enum.NormalId:GetEnumItems()
local busy = false

local function applyDecals(assetId)
    local texture = "rbxassetid://" .. assetId
    local applied, total = 0, 0
    for _, part in workspace:GetDescendants() do
        if not part:IsA("BasePart") or part == workspace.Terrain then continue end
        total += #faces
        if total % (128 * #faces) == 0 then task.wait() end
        if not part:IsDescendantOf(workspace) then continue end

        local occupied = {}
        for _, child in part:GetChildren() do
            if child.ClassName == "Decal" then
                child.Texture = texture
                child.Transparency = 0
                occupied[child.Face] = true
            end
        end

        for _, face in faces do
            if not occupied[face] then
                local decal = Instance.new("Decal")
                decal.Face = face
                decal.Texture = texture
                decal.Parent = part
            end
            applied += 1
        end
    end
    return {applied = applied, total = total}
end

local remote = Instance.new("RemoteFunction")
remote.Name = remoteName
remote.OnServerInvoke = function(player, assetId)
    local isOwner = game.CreatorType == Enum.CreatorType.User and player.UserId == game.CreatorId
    if not isOwner and not ADMIN_USER_IDS[player.UserId] then
        return {message = "You are not authorized to run Workspace decals on this server"}
    end
    if type(assetId) ~= "string" or #assetId > 19 or not assetId:match("^[1-9]%d*$") then
        return {message = "Usage: >decal <asset ID>"}
    end
    if busy then return {message = "A server decal command is already running"} end

    busy = true
    local ok, result = pcall(applyDecals, assetId)
    busy = false
    if ok then return result end
    warn("Admin Plus Workspace decals:", result)
    return {message = "Server decal application failed. You can try again."}
end
remote.Parent = replicatedStorage
