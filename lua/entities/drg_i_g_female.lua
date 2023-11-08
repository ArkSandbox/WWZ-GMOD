if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Infectado Mujer"
ENT.Category = "World War z"
ENT.Models = {"models/vj_cncr/zombies/zombie_female_01.mdl",
			"models/vj_cncr/zombies/zombie_female_02.mdl",
			"models/vj_cncr/zombies/zombie_female_03.mdl",
			"models/vj_cncr/zombies/zombie_female_04.mdl",
			"models/vj_cncr/zombies/zombie_female_05.mdl",
			"models/vj_cncr/zombies/zombie_female_06.mdl"}
ENT.ModelScale = 1
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(10, 10, 72)
ENT.EntitiesToNoCollide = {"prop_physics"}
ENT.CanOpenDoors = false
ENT.CanDestroyDoors = true
-- Sounds --
ENT.OnIdleSounds = {"zn/z1.wav", "zn/z2.wav", "zn/z3.wav", "zn/z4.wav", "zn/z5.wav", "zn/z6.wav", "zn/z7.wav", "zn/z8.wav"}
ENT.OnDamageSounds = {"zn/z1.wav", "zn/z2.wav", "zn/z3.wav", "zn/z4.wav", "zn/z5.wav", "zn/z6.wav", "zn/z7.wav", "zn/z8.wav"}
ENT.OnDeathSounds = {"zn/z1.wav", "zn/z2.wav", "zn/z3.wav", "zn/z4.wav", "zn/z5.wav", "zn/z6.wav", "zn/z7.wav", "zn/z8.wav"}

-- Stats --
ENT.SpawnHealth = 100
ENT.HealthRegen = 0
ENT.MinPhysDamage = 10
ENT.MinFallDamage = 10
-- AI --
ENT.RangeAttackRange = 50
ENT.MeleeAttackRange = 50
ENT.ReachEnemyRange = 50
ENT.AvoidEnemyRange = 0
ENT.Omniscient = true

-- Relationships --
ENT.Factions = {FACTION_WWZ_ZOMBIES}

-- Movements/animations --
ENT.Acceleration = 200
ENT.Deceleration = 200
ENT.WalkSpeed = 50
ENT.RunSpeed = 400
ENT.JumpAnimRate = 1
ENT.WalkAnimation = "ACT_WALK"
ENT.IdleAnimation = "ACT_IDLE"
ENT.RunAnimation = "ACT_HL2MP_RUN_FAST"
ENT.JumpAnimation = "ACT_HL2MP_JUMP_FIST"
ENT.DeathDropHeight = 2000
ENT.StepHeight = 50
ENT.MaxYawRate = 250
-- Detection --
ENT.EyeBone = "Bip01 Head"
ENT.EyeOffset = Vector(7.5, 0, 5)
-- Climbing --
ENT.ClimbLedges = true
ENT.ClimbProps = true
ENT.ClimbLadders = true
ENT.ClimbSpeed = 120
ENT.ClimbUpAnimation = "ACT_ZOMBIE_CLIMB_UP"
ENT.ClimbOffset = Vector(-14, 0, 0)

-- Possession --
ENT.PossessionCrosshair = true
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_1DIR
ENT.PossessionViews = {
  {
    offset = Vector(0, 30,30),
    distance = 100
  },
  {
    offset = Vector(2, 0, 0),
    distance = 0,
    eyepos = true
  }
}	
ENT.PossessionBinds = {
	[IN_ATTACK] = {{
		coroutine = true,
		onkeydown = function(self)		
self:OnMeleeAttack(enemy)
end
	}},
		[IN_DUCK] = {{
		coroutine = true,
		onkeydown = function(self)
	
end
	}},
		[IN_RELOAD] = {{
		coroutine = true,
		onkeydown = function(self)

end
	}},
	[IN_JUMP] = {{
		coroutine = true,
		onkeydown = function(self)

		end
	}}
}

 function ENT:Termaattack1()
      self:Attack({
    damage = 25,
    range=80,
    delay=0.40,
    force=Vector(800,100,100),
    type = DMG_SLASH,
    viewpunch = Angle(20, math.random(-10, 10), 0),
	}, function(self, hit)
        if #hit > 0 then
          self:EmitSound("Zombie.AttackHit")
        else self:EmitSound("Zombie.AttackMiss") end
      end)
  end
if SERVER then

  -- Init/Think --

  function ENT:CustomInitialize()
	self:SequenceEvent("walk_all",2/5,function()self:EmitStep()end)
	self:SequenceEvent("walk_all",4/5,function()self:EmitStep()end)

	self:SequenceEvent("run_all_02",2/5,function()self:EmitStep()end)
	self:SequenceEvent("run_all_01",4/5,function()self:EmitStep()end)
	
    self:SetDefaultRelationship(D_HT)
	self:SequenceEvent("zombie_attack_special",{1/11/11/11/11/1},self.Termaattack1)
	self:SequenceEvent("attackG_quick",{1/11/11/11/11/1},self.Termaattack1)
  end

  -- AI --
  function ENT:OnMeleeAttack(enemy)		
if not self:IsPossessed() then
self:Termaattack1()
self:PlaySequenceAndMove("attack"..math.random(1,2),1,self.FaceEnemy)
elseif self:IsPossessed() then
self:Termaattack1()
self:PlaySequenceAndMove("attack"..math.random(1,2),1,self.PossessionFaceForward)
end
end

function ENT:OnStopClimbing(ladder, height, down)
	if down then return end
	self:SetPos(self:GetPos()+self:GetForward()*15)
end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)
