ENT.Base = "spwn_drg_default"
ENT.Type = "point"
ENT.PrintName = "Random Infectado SPAWNER"
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
ENT.Radius = 300
ENT.Quantity = 84
ENT.Delay = 2

if SERVER then AddCSLuaFile() end

DrGBase.AddSpawner(ENT)