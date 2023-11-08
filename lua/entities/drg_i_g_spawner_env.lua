ENT.Base = "spwn_drg_default"
ENT.Type = "point"
ENT.PrintName = "Random Infectado ENVIRONMENT SPAWNER"
ENT.Category = "World War z"
ENT.ToSpawn = {
    ["drg_i_g_male"] = 5, 
	["drg_i_g_male"] = 5, 
	["drg_i_g_male"] = 5, 
	["drg_i_g_male"] = 5, 
	["drg_i_g_male"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
	["drg_i_g_female"] = 5, 
}
ENT.AutoRemove = false
ENT.Radius = 30000
ENT.Quantity = 624
ENT.Delay = 5

if SERVER then AddCSLuaFile() end

DrGBase.AddSpawner(ENT)