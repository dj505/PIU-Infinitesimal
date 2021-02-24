-- The following is borrowed from Simply Love under the GNU GPL v3 license
-- https://github.com/quietly-turning/Simply-Love-SM5
-- Copyright (C) 2020 quietly-turning

local sm_version = ("%s %s"):format(ProductFamily(), ProductVersion())

local SongStats = ("%i songs in %i groups"):format(
	SONGMAN:GetNumSongs(),
	SONGMAN:GetNumSongGroups()
)

-- Original, non-borrowed code begins here

local t = Def.ActorFrame {

	Def.ActorFrame {

		InitCommand=function(self)
			self:Center()
			:queuecommand("Zoomy")
		end,

		ZoomyCommand=function(self)
			self:accelerate(3.4288)
			:zoom(0.96)
			:decelerate(3.4288)
			:zoom(1)
			:queuecommand("Zoomy")
		end,

		Def.Sprite {
		Texture=THEME:GetPathG("","logo"),
      InitCommand=function(self)
        self:zoom(0.5,0.5)
      end
    },

		Def.Sprite {
		Texture=THEME:GetPathG("","logo"),
      InitCommand=function(self)
        self:zoom(0.5,0.5)
				:queuecommand("Pulse")
      end,

			PulseCommand=function(self)
				self:sleep(3.4288)
				:diffusealpha(0.5)
				:zoom(0.5)
				:decelerate(1.7144)
				:zoom(0.65)
				:diffusealpha(0)
				:sleep(1.7144)
				:queuecommand("Pulse")
			end,
    },

    Def.Sprite {
		Texture=THEME:GetPathG("","blurLogo"),
      InitCommand=function(self)
        self:zoom(0.8,0.8)
        :diffusealpha(0)
        :queuecommand("Flash")
      end,
      FlashCommand=function(self)
        self:accelerate(3.4288)
        :diffusealpha(0.8)
        :decelerate(3.4288)
        :diffusealpha(0)
        :queuecommand("Flash")
      end
    },

	},

  LoadActor(THEME:GetPathG("","PressCenterStep"))..{
  	InitCommand=function(self)
      self:xy(SCREEN_LEFT+150,SCREEN_BOTTOM-100)
      :zoom(0.75,0.75)
    end
  },

  LoadActor(THEME:GetPathG("","PressCenterStep"))..{
    InitCommand=function(self)
      self:xy(SCREEN_RIGHT-150,SCREEN_BOTTOM-100)
      :zoom(0.75,0.75)
    end
  },

  ----------------
  -- Info Stuff --
  ----------------

  LoadFont("Montserrat semibold 20px")..{
    InitCommand=function(self)
      self:settext(SongStats.."\n"..sm_version)
      :zoom(0.5)
      :xy(SCREEN_LEFT+8, SCREEN_TOP+8)
      :vertalign(top)
      :horizalign(left)
      :shadowlength(1)
    end
  }

}

return t;
