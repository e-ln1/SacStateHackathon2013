kRotationSpeed = 50

function OnAfterSceneLoaded(self)
  self.controls = Input:CreateMap("InputMap")

  self.controls:MapTrigger("KeyLeft", "KEYBOARD", "CT_KB_A")
  self.controls:MapTrigger("KeyRight", "KEYBOARD", "CT_KB_D")
  self.controls:MapTrigger("KeyUp", "KEYBOARD", "CT_KB_W")
  self.controls:MapTrigger("KeyDown", "KEYBOARD", "CT_KB_S")
  
  self.rotation = 0
  
  self.player = Game:GetEntity("player")
  self.playerPhysics = self.player:GetComponentOfType("vHavokRigidBody")
  
  G.rotating = false
end

function OnThink(self)
  -- Pull in keyboard controls
  local KeyGoLeft = self.controls:GetTrigger("KeyLeft")>0
  local KeyGoRight = self.controls:GetTrigger("KeyRight")>0
  local KeyGoUp = self.controls:GetTrigger("KeyUp")>0
  local KeyGoDown = self.controls:GetTrigger("KeyDown")>0
  
  local dt = Timer:GetTimeDiff()
  
  if KeyGoLeft then
    self.rotation = self.rotation + kRotationSpeed * dt
  elseif KeyGoRight then
    self.rotation = self.rotation - kRotationSpeed * dt
  end
  
  --if KeyGoUp then
  --  self.applyForce((0,1,0), 0)
  --end
  
  G.rotating = KeyGoLeft or KeyGoRight

  self:SetPosition(self.player:GetPosition())
  self:SetOrientation(0, 0, self.rotation)
end
