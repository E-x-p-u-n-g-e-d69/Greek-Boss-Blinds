if not GreekBossBlinds then
	GreekBossBlinds = {}
end
local mod_path = "" .. SMODS.current_mod.path
local files = NFS.getDirectoryItems(mod_path .. "lib")
for _, file in ipairs(files) do
    print("[GreekBossBlinds] Lib file load... ".."file")
    local f, err = SMODS.load_file("lib/" .. file)
    if err then
		error(err)
	end
    f()
end
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
    print("[GreekBossBlinds] Item file load... " .. file)
    local f, err = SMODS.load_file("items/" .. file)
    if err then
        error(err)
    end
    f()
end 