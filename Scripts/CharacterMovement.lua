kRotationSpeed = 50

function OnAfterSceneLoaded(self)
  self.controls = Input:CreateMap("InputMap")
  self.controls:MapTrigger("KeyLeft", "KEYBOARD", "CT_KB_A")
  self.controls:MapTrigger("KeyRight", "KEYBOARD", "CT_KB_D")
  self.controls:MapTrigger("KeyUp", "KEYBOARD", "CT_KB_W")
  self.controls:MapTrigger("KeyDown", "KEYBOARD", "CT_KB_S")
  
  self.player = Game:GetEntity("player")
  self.playerPhysics = self.player:GetComponentOfType("vHavokRigidBody")

  self.camera = Game:GetEntity("camera")  
end

function OnThink(self)
  local dt = Timer:GetTimeDiff()  
 
  local cameraUp = -self.camera:GetObjDir_Up()
  
  -- make this the force of gravity
  cameraUp:setLength(9810.0)
  
  
  
  if not G.rotating then
    -- apply the new 'gravity' force to the player
    self.playerPhysics:ApplyForce( cameraUp, dt )
  else
    self.playerPhysics:SetLinearVelocity( Vision.hkvVec3(0, 0, 0) )
  end
end
