--[[
	覧覧覧覧覧覧覧覧 Rev 09 覧・	- Fixed GetChecked() now returning a boolean instead of nil/1
	覧・16.07.23 覧・Rev 10 覧・7.0.3/Legion 覧・
	- Changed SetTexture(r,g,b,a) -> SetColorTexture(r,g,b,a)
	覧・18.08.12 覧・Rev 11 覧・8.0/BfA 覧・
	- Added native LSM support to the dropdown
	- The building of the options page is now done internally, instead of in the client addon.
	- Some code restructure.
	覧・20.10.31 覧・Rev 12 覧・9.0.1/Shadowlands 覧・
	- CreateFrame() now uses the "BackdropTemplate"
	21.12.22 Rev 13 9.1.5/Shadowlands #frozn45
	- fixed selecting of "None" for backdrop/border texture and saving this settings.
	22.01.03 Rev 14 9.1.5/Shadowlands #frozn45
	- added a scroll frame to show a scroll bar if needed
	- minor adjustments of some elements
	22.03.30 Rev 15 9.2.0/Shadowlands #frozn45
	- added a header element
	22.10.30 Rev 16 10.0.0/Dragonflight #frozn45
	- replaced inheritsFrame "OptionsSliderTemplate" with "UISliderTemplateWithLabels" for slider
	22.11.20 Rev 17 10.0.2/Dragonflight #frozn45
	- left align text of check button and dropdown
	23.01.23 Rev 18 10.0.2/Dragonflight #frozn45
	- added library LibFroznFunctions-1.0
	- removed extended funtion SetFromHexColorMarkup() from color object
	- adjusted x offsets of Slider, CheckButton, ColorButton, DropDown and TextEdit
	- added a TextOnly element
	23.03.07 Rev 19 10.0.5/Dragonflight #frozn45
	- put option in new line also if last x offset has been lower than the current x offset
	23.08.28 Rev 20 10.1.5/Dragonflight #frozn45
	- added a tooltip for Slider
	23.10.15 Rev 21 10.1.7/Dragonflight #frozn45
	- added a tooltip for DropDown and menu items
	24.01.22 Rev 22 10.2.5/Dragonflight #frozn45
	- considered that the color picker frame has been reworked with df 10.2.5
	- switched using LibFroznFunctions.isWoWFlavor.* to LibFroznFunctions.hasWoWFlavor.*
	24.02.14 Rev 23 10.2.5/Dragonflight #frozn45
	- improved positioning and size of all elements
	24.04.27 Rev 24 10.2.6/Dragonflight #frozn45
	- don't change value of slider on mouse wheel
	24.05.07 Rev 25 10.2.6/Dragonflight #frozn45
	- added an "enabled" property for all objects
	- added a tooltip for TextEdit and TextOnly
	24.05.20 Rev 26 10.2.7/Dragonflight #frozn45
	- made shure that evaluating the "enabled" property always returns a boolean value
	- considered empty options for BuildOptionsPage()
	24.05.26 Rev 27 10.2.7/Dragonflight #frozn45
	- only set config value by TextEdit if text has changed
	24.07.25 Rev 28 11.0.0/Dragonflight #frozn45
	- fixed processing of OnEnter/OnLeave events for dropdown and slider
	- aligned text of slider, color picker, TextEdit horizontally to left
	- no build category page on OnTextChanged of TextEdit
	24.08.18 Rev 29 11.0.2/The War Within #frozn45
	- added an "hidden" property for all objects
	24.10.01 Rev 30 11.0.2/The War Within #frozn45
	- classic era: added a workaround for blizzard bug in classic era 1.15.4: the UISliderTemplateWithLabels template defined in "SliderTemplates.xml" is missing.
	24.10.29 Rev 31 11.0.2/The War Within #frozn45
	- classic era: removed the workaround for blizzard bug in classic era 1.15.4: the UISliderTemplateWithLabels template defined in "SliderTemplates.xml" is missing. fixed with WoW build 1.15.4.56857.
	25.05.18 Rev 32 11.1.5/The War Within #frozn45
	- replaced newlines in header of tooltip with a space for all option types
--]]

-- create new library
local REVISION = 32; -- bump on changes
if (type(AzOptionsFactory) == "table") and (AzOptionsFactory.vers >= REVISION) then
	return;
end

-- reuse and update obsolete version, or create new
AzOptionsFactory = AzOptionsFactory or {};
local azof = AzOptionsFactory;

azof.vers = REVISION;
azof.objectNameCount = azof.objectNameCount or {};
azof.__index = azof;

azof.objects = {};

local PARENT_MOD_NAME = "TipTac";

-- get libs
local LibFroznFunctions = LibStub:GetLibrary("LibFroznFunctions-1.0");

--------------------------------------------------------------------------------------------------------
--                                          Helper Functions                                          --
--------------------------------------------------------------------------------------------------------

local ReturnZeroMeta = { __index = function() return 0; end };

-- Generate Unique Object Name
local function GenerateObjectName(type)
	azof.objectNameCount[type] = (azof.objectNameCount[type] or 0) + 1;
	return "AzOptionsFactory"..type..azof.objectNameCount[type];
end

-- Gets an existing object or creates a new one if needed
function azof:GetObject(type)
	-- verify the object type is valid
	local obj = self.objects[type];
	if (not obj) then
		local TipTac = _G[PARENT_MOD_NAME];
		TipTac:AddMessageToChatFrame("{caption:" .. PARENT_MOD_NAME .. "}: {error:Invalid factory object type {highlight:[%s]}!}");
		return;
	end

	-- increase ref count for this object type
	local index = (self.objectUse[type] + 1);
	self.objectUse[type] = index;

	-- return an existing instance currently not in use, or create a new instance
	if (not self.instances[type]) then
		self.instances[type] = {};
	end

	if (self.instances[type][index]) then
		return self.instances[type][index];
	else
		local inst = obj.CreateNew(self);
		self.instances[type][index] = inst;
		inst.class = obj;
		inst.factory = self;
		return inst;
	end
end

-- Resets the object use and hides all objects
function azof:ResetObjectUse()
	wipe(self.objectUse);
	for _, types in next, self.instances do
		for _, inst in ipairs(types) do
			inst:Hide();
		end
	end
end

-- Creates New Factory Instance -- The UNUSED parameter is a remnant from when it needed the cfg table
function azof:New(owner,GetConfigValue,SetConfigValue)
	local instance = {
		owner = owner,
		instances = {},
		objectUse = setmetatable({},ReturnZeroMeta),
		GetConfigValue = GetConfigValue,
		SetConfigValue = SetConfigValue,
	};
	return setmetatable(instance,azof);
end

-- builds options page
function azof:BuildOptionsPage(options,anchor,left,top,restrictToken)
	self.isBuildingOptions = true;
	self:ResetObjectUse();
	AzDropDown:HideMenu();

	local lastXOffset = 0;
	local lastTop = 0;
	local firstOption = true;

	for index, option in ipairs(options or {}) do
		local restrictType = type(option.restrict);
		local allowCreation = (
			(restrictType == "nil")
			or (restrictType == "string" and restrictToken == option.restrict)
			or (restrictType == "table" and tIndexOf(option.restrict,restrictToken))
		);
		local hidden = (not not option.hidden) and (not not option.hidden(self, option));

		if (option.type) and (allowCreation) and (not hidden) then
			local obj = self:GetObject(option.type);

			obj.option = option;
			obj.text:SetText(option.label);
			
			if (obj.class.Init) then
				obj.class.Init(obj,option,self:GetConfigValue(option.var));
			end

			-- Anchor the frame
			obj:ClearAllPoints();

			local xOffset = (option.x or 0);
			local yOffset = (option.y or 0);

			if (xOffset > lastXOffset) then
				top = lastTop;
			end

			local xFinal = left + self.objects[option.type].xOffset + xOffset;
			local yFinal = top + self.objects[option.type].yOffset + yOffset;
			
			if (firstOption) then
				yFinal = yFinal - self.objects[option.type].extraPaddingTop;
				firstOption = false;
			end

			obj:SetPoint("TOPLEFT",anchor,"TOPLEFT",xFinal,-yFinal);

			top = yFinal + self.objects[option.type].height;

			lastXOffset = xOffset;

			if (xOffset <= lastXOffset) then
				lastTop = yFinal - self.objects[option.type].yOffset;
			end

			-- Show
			obj:Show();
		end
	end

	self.isBuildingOptions = nil;
end

--------------------------------------------------------------------------------------------------------
--                                            Slider Frame                                            --
--------------------------------------------------------------------------------------------------------

-- tooltip
local function SliderEdit_OnEnter(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,1,1);
	if (self.option.tip) then
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

local function SliderEdit_OnLeave(self)
	local frames = { self, self:GetChildren() };
	local frameWithMouseFocus = LibFroznFunctions:GetMouseFocus();
	
	for _, frame in ipairs(frames) do
		if (frame == frameWithMouseFocus) then
			return;
		end
	end
	
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,0.82,0);
	GameTooltip:Hide();
end

-- EditBox Enter Pressed
local function SliderEdit_OnEnterPressed(self)
	self:GetParent().slider:SetValue(self:GetNumber());
end

-- Slider Value Changed
local function Slider_OnValueChanged(self)
	local parent = self:GetParent();
	parent.edit:SetNumber(self:GetValue());
	parent.factory:SetConfigValue(parent.option.var,self:GetValue(), true);
end

-- OnMouseWheel
local function Slider_OnMouseWheel(self,delta)
	self:SetValue(self:GetValue() + self:GetParent().option.step * delta);
end

-- New Slider (dimensions: 301x32, visible dimension: 301x29, visible padding: 3/0/0/0)
azof.objects.Slider = {
	xOffset = 10, -- 10px final visible xOffset - 0px visible padding left = 10px
	yOffset = 2, -- 5px final visible yOffset + 0px extra padding top - 3px visible padding top = 2px
	height = 32, -- 29px visible dimension height + 3px visible padding top + 0px extra padding bottom = 32px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	Init = function(self,option,cfgValue)
		self.slider:SetMinMaxValues(option.min,option.max);
		self.slider:SetValueStep(option.step);
		--self.slider:SetStepsPerPage(0);
		self.slider:SetValue(cfgValue);
		self.edit:SetNumber(cfgValue);
		self.low:SetText(option.min);
		self.high:SetText(option.max);
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		self.edit:SetEnabled(enabled);
		self.slider:SetEnabled(enabled);
		if (enabled) then
			self.edit:SetTextColor(1, 1, 1);
			self.text:SetTextColor(1, 0.82, 0);
			self.low:SetTextColor(1, 1, 1);
			self.high:SetTextColor(1, 1, 1);
		else
			self.edit:SetTextColor(0.5, 0.5, 0.5);
			self.text:SetTextColor(0.5, 0.5, 0.5);
			self.low:SetTextColor(0.5, 0.5, 0.5);
			self.high:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("Frame",nil,self.owner);
		f:SetSize(301,32);
		f:SetHitRectInsets(-2, -2, -2, -2);
		
		f:SetScript("OnEnter", SliderEdit_OnEnter);
		f:SetScript("OnLeave", SliderEdit_OnLeave);

		f.edit = CreateFrame("EditBox",GenerateObjectName("EditBox"),f,"InputBoxTemplate");
		f.edit:SetSize(45,21);
		f.edit:SetPoint("BOTTOMLEFT", 5, 0);
		f.edit:SetScript("OnEnterPressed",SliderEdit_OnEnterPressed);
		f.edit:SetAutoFocus(false);
		f.edit:SetMaxLetters(5);
		f.edit:SetFontObject("GameFontHighlight");
		
		f.edit:SetScript("OnEnter", function(self, ...)
			SliderEdit_OnEnter(self:GetParent(), ...);
		end);
		f.edit:SetScript("OnLeave", function(self, ...)
			SliderEdit_OnLeave(self:GetParent(), ...);
		end);

		local sliderName = GenerateObjectName("Slider");

		f.slider = CreateFrame("Slider", sliderName, f, LibFroznFunctions.hasWoWFlavor.optionsSliderTemplate);
		if ((LibFroznFunctions.hasWoWFlavor.optionsSliderTemplate == "UISliderTemplateWithLabels") and BackdropTemplateMixin and "BackdropTemplate") then
			Mixin(f.slider, BackdropTemplateMixin);
			f.slider.backdropInfo = BACKDROP_SLIDER_8_8;
			f.slider:ApplyBackdrop();
		end
		f.slider:SetPoint("TOPLEFT",f.edit,"TOPRIGHT",5,-3);
		f.slider:SetPoint("BOTTOMRIGHT",0,-2);
		f.slider:SetScript("OnValueChanged",Slider_OnValueChanged);
		-- f.slider:SetScript("OnMouseWheel",Slider_OnMouseWheel);
		f.slider:EnableMouseWheel(true);
		f.slider:SetObeyStepOnDrag(true);
		
		f.slider:SetHitRectInsets(0, 0, 0, 0);
		f.slider:SetScript("OnEnter", function(self, ...)
			SliderEdit_OnEnter(self:GetParent(), ...);
		end);
		f.slider:SetScript("OnLeave", function(self, ...)
			SliderEdit_OnLeave(self:GetParent(), ...);
		end);

		f.text = _G[sliderName.."Text"];
		f.text:SetTextColor(1.0,0.82,0);
		f.text:SetJustifyH("LEFT");
		f.low = _G[sliderName.."Low"];
		f.low:ClearAllPoints();
		f.low:SetPoint("BOTTOMLEFT",f.slider,"TOPLEFT",0,0);
		f.high = _G[sliderName.."High"];
		f.high:ClearAllPoints();
		f.high:SetPoint("BOTTOMRIGHT",f.slider,"TOPRIGHT",0,0);

		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                               Header                                               --
--------------------------------------------------------------------------------------------------------

-- tooltip
local function Header_OnEnter(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	if (self.option.tip) then
		self.text:SetTextColor(1, 1, 1);
		
		GameTooltip:SetOwner(self, "ANCHOR_TOP");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "), 1, 1, 1);
		GameTooltip:AddLine(self.option.tip, nil, nil, nil, 1);
		GameTooltip:Show();
	end
end

local function Header_OnLeave(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1, 0.82, 0);
	GameTooltip:Hide();
end

-- New Header (dimensions: 301x18, visible dimension: 301x7, visible padding: 6/3/5/3)
azof.objects.Header = {
	xOffset = 10, -- 10px final visible xOffset - 0px visible padding left = 10px
	yOffset = 12, -- 5px final visible yOffset + 10px extra padding top - 3px visible padding top = 12px
	height = 18, -- 7px visible dimension height + 6px visible padding top + 5px extra padding bottom = 18px
	extraPaddingTop = 15, -- 5px final visible yOffset + 10px extra padding top = 15px
	Init = function(self, option, cfgValue)
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		if (enabled) then
			self.text:SetTextColor(1, 0.82, 0);
		else
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("Frame", nil, self.owner);
		f:SetSize(301, 18);
		
		f.text = f:CreateFontString("ARTWORK", nil, "GameFontNormalSmall");
		f.text:SetPoint("TOP"); -- vertically centered to Header (without text shadow and near to bottom in case of odd number of pixels)
		f.text:SetPoint("BOTTOM");
		f.text:SetJustifyH("CENTER");

		f.leftH = f:CreateTexture(nil, "BACKGROUND");
		f.leftH:SetHeight(8);
		f.leftH:SetPoint("RIGHT", f.text, "LEFT", -5, 0);
		f.leftH:SetPoint("LEFT", 3, 0);
		f.leftH:SetTexture(137057); -- Interface\\Tooltips\\UI-Tooltip-Border
		f.leftH:SetTexCoord(0.81, 0.94, 0.5, 1);

		f.rightH = f:CreateTexture(nil, "BACKGROUND");
		f.rightH:SetHeight(8);
		f.rightH:SetPoint("RIGHT", -3, 0);
		f.rightH:SetPoint("LEFT", f.text, "RIGHT", 5, 0);
		f.rightH:SetTexture(137057); -- Interface\\Tooltips\\UI-Tooltip-Border
		f.rightH:SetTexCoord(0.81, 0.94, 0.5, 1);
		
		f:SetScript("OnEnter", Header_OnEnter);
		f:SetScript("OnLeave", Header_OnLeave);

		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                            Check Button                                            --
--------------------------------------------------------------------------------------------------------

local function CheckButton_OnEnter(self)
	self.text:SetTextColor(1,1,1);
	if (self.option.tip) then
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

local function CheckButton_OnLeave(self)
	self.text:SetTextColor(1,0.82,0);
	GameTooltip:Hide();
end

local function CheckButton_OnClick(self)
	self.factory:SetConfigValue(self.option.var,self:GetChecked() and true or false);	-- WoD patch made GetChecked() return bool instead of 1/nil
end

-- New CheckButton (dimensions: 26x26, visible dimension: 20x17, visible padding: 4/3/5/3, visible padding right for text: 4)
azof.objects.Check = {
	xOffset = 7, -- 10px final visible xOffset - 3px visible padding left = 7px
	yOffset = 1, -- 5px final visible yOffset + 0px extra padding top - 4px visible padding top = 1px
	height = 21, -- 17px visible dimension height + 4px visible padding top + 0px extra padding bottom = 21px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	Init = function(self, option, cfgValue)
		self:SetHitRectInsets(0, self.text:GetWidth() * -1, 0, 0);
		self:SetChecked(cfgValue);
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		self:SetEnabled(enabled);
		if (enabled) then
			self.text:SetTextColor(1, 0.82, 0);
		else
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("CheckButton",nil,self.owner);
		f:SetSize(26,26);
		f:SetScript("OnEnter",CheckButton_OnEnter);
		f:SetScript("OnClick",CheckButton_OnClick);
		f:SetScript("OnLeave",CheckButton_OnLeave);

		f:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up");
		f:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down");
	 	f:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
		f:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled");
		f:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check");

		f.text = f:CreateFontString("ARTWORK",nil,"GameFontNormalSmall");
		f.text:SetPoint("LEFT",f,"RIGHT",0,1); -- vertically centered to CheckButton (without text shadow and near to bottom in case of odd number of pixels) and 5px final visible padding to CheckButton - 4px visible padding right for text = 1px
		f.text:SetJustifyH("LEFT");

		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                            Color Button                                            --
--------------------------------------------------------------------------------------------------------

-- we use this table to keep a state of the color picker instance that is active
local cpfState = {
	prevColor = CreateColor(),
};
local CPF = ColorPickerFrame;

-- Color Picker Function -- if "prevVal" is valid, then its called as cancel function
local function ColorButton_ColorPickerFunc(prevVal)
	local r, g, b, a;
	if (prevVal) then
		r, g, b, a  = prevVal:GetRGBA();
	else
		r, g, b = CPF:GetColorRGB();
		a = LibFroznFunctions:GetColorAlphaFromColorPicker();
	end

	-- Update frame only if its still showing this option. This can fail if the category page was changed.
	-- With our "cpfState" table, we can still keep track of the correct option though
	if (cpfState.frame.option == cpfState.option) then
		cpfState.frame.texture:SetVertexColor(r,g,b,a);
		cpfState.frame.color:SetRGBA(r,g,b,a);
	end

	-- Update color setting
	cpfState.isSettingConfigValue = true;
	
	if (cpfState.option.subType == 2) then
		local hexColorMarkup = format("|c%.2x%.2x%.2x%.2x",a * 255,r * 255,g * 255,b * 255);
		cpfState.factory:SetConfigValue(cpfState.option.var,hexColorMarkup);		-- color:GenerateHexColorMarkup()
	else
		cpfState.newColor[1] = r;
		cpfState.newColor[2] = g;
		cpfState.newColor[3] = b;
		cpfState.newColor[4] = a;
		cpfState.factory:SetConfigValue(cpfState.option.var,cpfState.newColor);
	end
	
	cpfState.isSettingConfigValue = false;
end

-- OnClick
local function ColorButton_OnClick(self,button)
	-- if color picker is already open, cancel it
	if (CPF:IsShown()) and (type(CPF.cancelFunc) == "function") then
		CPF.cancelFunc(CPF.previousValues);
	end

	-- get color and back them up in case of cancel
	local r, g, b, a = self.color:GetRGBA();
	cpfState.prevColor:SetRGBA(r,g,b,a);

	-- we must create a new table here to avoid overwriting old table
	if (self.option.subType ~= 2) then
		cpfState.newColor = {};
	end

	local opacity = (a or 1);

	-- keep a state of the active references needed for this color pick
	cpfState.frame = self;
	cpfState.option = self.option;
	cpfState.factory = self.factory;

	-- init and display the color picker
	LibFroznFunctions:SetupColorPickerAndShow({
		swatchFunc = ColorButton_ColorPickerFunc,
		hasOpacity = true,
		opacityFunc = ColorButton_ColorPickerFunc,
		opacity = opacity,
		r = r,
		g = g,
		b = b,
		cancelFunc = ColorButton_ColorPickerFunc
	});
	
	CPF.previousValues = cpfState.prevColor;
end

-- OnEnter
local function ColorButton_OnEnter(self)
	self.text:SetTextColor(1,1,1);
	self.border:SetVertexColor(1,1,0);
	if (self.option.tip) then
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

-- OnLeave
local function ColorButton_OnLeave(self)
	self.text:SetTextColor(1,0.82,0);
	self.border:SetVertexColor(1,1,1);
	GameTooltip:Hide();
end

-- New ColorButton (dimensions: 19x19, visible dimension: 19x19, visible padding: 0/0/0/0, visible padding right for text: 0)
azof.objects.Color = {
	xOffset = 10, -- 10px final visible xOffset - 0px visible padding left = 10px
	yOffset = 5, -- 5px final visible yOffset + 0px extra padding top - 0px visible padding top = 5px
	height = 19, -- 19px visible dimension height + 0px visible padding top + 0px extra padding bottom = 19px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	Init = function(self,option,cfgValue)
		self:SetHitRectInsets(-2,self.text:GetWidth() * -1 - 2, -2, -2);
		-- if color picker is open, cancel and hide it
		if (CPF:IsShown()) and (type(CPF.cancelFunc) == "function") and (not cpfState.isSettingConfigValue) then
			CPF.cancelFunc(CPF.previousValues);
			CPF:Hide();
		end
		if (option.subType == 2) then
			local ha, hr, hg, hb = cfgValue:match("^|c(..)(..)(..)(..)");
			self.color:SetRGBA(
				format("%d","0x"..hr) / 255,
				format("%d","0x"..hg) / 255,
				format("%d","0x"..hb) / 255,
				format("%d","0x"..ha) / 255
			);
		else
			self.color:SetRGBA(unpack(cfgValue));
		end
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		self:SetEnabled(enabled);
		if (enabled) then
			self.texture:SetVertexColor(self.color:GetRGBA());
			self.text:SetTextColor(1, 0.82, 0);
		else
			local r, g, b = self.color:GetRGB();
			local grayscale = r * 0.3 + g * 0.6 + b * 0.1;
			self.texture:SetVertexColor(grayscale, grayscale, grayscale, 1);
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("Button",nil,self.owner);
		f:SetSize(19,19);
		f:SetScript("OnEnter",ColorButton_OnEnter);
		f:SetScript("OnLeave",ColorButton_OnLeave)
		f:SetScript("OnClick",ColorButton_OnClick);

		f.texture = f:CreateTexture();
		f.texture:SetPoint("TOPLEFT",-1,1);
		f.texture:SetPoint("BOTTOMRIGHT",1,-1);
		f.texture:SetTexture("Interface\\ChatFrame\\ChatFrameColorSwatch");
		f:SetNormalTexture(f.texture);

		f.border = f:CreateTexture(nil,"BACKGROUND");
		f.border:SetPoint("TOPLEFT");
		f.border:SetPoint("BOTTOMRIGHT");
		f.border:SetColorTexture(1,1,1,1);

		f.text = f:CreateFontString(nil,"ARTWORK","GameFontNormalSmall");
		f.text:SetPoint("LEFT",f,"RIGHT",5,0); -- vertically centered to ColorButton (without text shadow and near to bottom in case of odd number of pixels) and 5px final visible padding to ColorButton - 0px visible padding right for text = 5px
		f.text:SetJustifyH("LEFT");
		
		f.color = CreateColor();

		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                           DropDown Frame                                           --
--------------------------------------------------------------------------------------------------------

-- tooltip
local function DropDown_OnEnter(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,1,1);
	if (self.option.tip) then
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

local function DropDown_OnLeave(self)
	local frames = { self, self:GetChildren() };
	local frameWithMouseFocus = LibFroznFunctions:GetMouseFocus();
	
	for _, frame in ipairs(frames) do
		if (frame == frameWithMouseFocus) then
			return;
		end
	end
	
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,0.82,0);
	GameTooltip:Hide();
end

-- default init
local function Default_SelectValue(dropDown,entry,index)
	dropDown.factory:SetConfigValue(dropDown.option.var,entry.value);
end

local function Default_Init(dropDown,list)
	dropDown.selectValueFunc = Default_SelectValue;
	for text, option in next, dropDown.option.list do
		local tbl = list[#list + 1]
		tbl.text = text;
		if (type(option) == "table") then
			tbl.value = option.value;
			tbl.tip = option.tip;
		else
			tbl.value = option;
		end
	end
end

-- Lib Shared Media
local LSM = LibStub and LibStub:GetLibrary("LibSharedMedia-3.0",1);

azof.LibSharedMediaSubstitute = {
	font = {
		["Friz Quadrata TT"] = "Fonts\\FRIZQT__.TTF",
		["Arial Narrow"] = "Fonts\\ARIALN.TTF",
		["Skurri"] = "Fonts\\SKURRI.TTF",
		["Morpheus"] = "Fonts\\MORPHEUS.TTF",
	},
	background = {
		["Solid"] = "Interface\\Buttons\\WHITE8X8",
		--["Blizzard Chat Background"] = "Interface\\ChatFrame\\ChatFrameBackground", -- this is the same as Solid
		["Blizzard Tooltip"] = "Interface\\Tooltips\\UI-Tooltip-Background",
		["Blizzard Parchment"] = "Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal",
		["Blizzard Parchment 2"] = "Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal",
	},
	border = {
		["None"] = "Interface\\None",
		["Blizzard Dialog"]  = "Interface\\DialogFrame\\UI-DialogBox-Border",
		["Blizzard Tooltip"] = "Interface\\Tooltips\\UI-Tooltip-Border",
		["Solid"] = "Interface\\Buttons\\WHITE8X8",
	},
	statusbar = {
		["Blizzard StatusBar"] = "Interface\\TargetingFrame\\UI-StatusBar",
		["Blizzard Raid Bar"] = "Interface\\RaidFrame\\Raid-Bar-Hp-Fill",
		["Blizzard Character Skills Bar"] = "Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar",
	},
	sound = {
		["Bell"] = "Sound\\Doodad\\BellTollHorde.ogg",
		["Murmur"] = "Sound\\Creature\\Murmur\\MurmurWoundA.ogg",
		["Alarm Warning 1"] = "Sound\\Interface\\AlarmClockWarning1.ogg",
		["Alarm Warning 2"] = "Sound\\Interface\\AlarmClockWarning2.ogg",
		["Alarm Warning 3"] = "Sound\\Interface\\AlarmClockWarning3.ogg",
		["Raid Warning"] = "Sound\\Interface\\RaidWarning.ogg",
		["Ready Check 1"] = "Sound\\Interface\\levelup2.ogg",
		["Ready Check 2"] = "Sound\\Interface\\ReadyCheck.ogg",
		["Takeoff"] = "Sound\\Universal\\FM_Takeoff.ogg",
		["Map Ping"] = "Sound\\Interface\\MapPing.ogg",
		["Auction Close"] = "Sound\\Interface\\AuctionWindowClose.ogg",
		["Auction Open"] = "Sound\\Interface\\AuctionWindowOpen.ogg",
		["Gnome Exploration"] = "Sound\\Interface\\GnomeExploration.ogg",
		["Flag Capture Horde"] = "Sound\\Interface\\PVPFlagCapturedHordeMono.ogg",
		["Flag Capture Alliance"] = "Sound\\Interface\\PVPFlagCapturedmono.ogg",
		["Flag Taken Alliance"] = "Sound\\Interface\\PVPFlagTakenHordeMono.ogg",
		["Flag Taken Horde"] = "Sound\\Interface\\PVPFlagTakenMono.ogg",
		["PvP Warning"] = "Sound\\Interface\\PVPWARNING.ogg",
		["PvP Warning Alliance"] = "Sound\\Interface\\PVPWarningAllianceMono.ogg",
		["PvP Warning Horde"] = "Sound\\Interface\\PVPWarningHordeMono.ogg",
		["LFG Denied"] = SOUNDKIT.LFG_DENIED,
	},
};

if (LSM) then
	LSM:Register("border","Solid","Interface\\Buttons\\WHITE8X8");
	for name, path in next, azof.LibSharedMediaSubstitute.statusbar do
		LSM:Register("statusbar",name,path);
	end
	for name, path in next, azof.LibSharedMediaSubstitute.sound do
		LSM:Register("sound",name,path);
	end
end

local function SharedMediaLib_SelectValue(dropDown,entry,index)
	if (dropDown.option.media == "sound") then
		(type(entry.value) == "string" and PlaySoundFile or PlaySound)(entry.value);
	end
	Default_SelectValue(dropDown,entry,index);
end

local function SharedMediaLib_Init(dropDown,list)
	local query = dropDown.option.media;
	dropDown.selectValueFunc = SharedMediaLib_SelectValue;
	if (LSM) then
		for _, name in next, LSM:List(query) do
			local tbl = list[#list + 1];
			tbl.text = name;
			local value = LSM:Fetch(query,name);
			local tip = value;
			if ((query == "background" or query == "border") and value == nil) then
				value = "nil";
				tip = "";
			end
			tbl.value = value;
			tbl.tip = tip;
		end
	else
		for name, value in next, azof.LibSharedMediaSubstitute[query] do
			local tbl = list[#list + 1];
			tbl.text = name;
			local tip = value;
			if ((query == "background" or query == "border") and value == nil) then
				value = "nil";
				tip = "";
			end
			tbl.value = value;
			tbl.tip = tip;
		end
	end
	table.sort(list,function(a,b) return a.text < b.text end);
end

-- New DropDown (dimensions: 301x24, visible dimension: 301x24, visible padding: 0/0/0/0)
azof.objects.DropDown = {
	xOffset = 131, -- 10px final visible xOffset + (301px max visible dimension - 180px DropDown box) = 131px
	yOffset = 5, -- 5px final visible yOffset + 0px extra padding top - 0px visible padding top = 5px
	height = 24, -- 24px visible dimension height + 0px visible padding top + 0px extra padding bottom = 24px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	Init = function(self,option,cfgValue)
		self.initFunc = (option.init or option.media and SharedMediaLib_Init or Default_Init);
		self:InitSelectedItem(cfgValue);
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		self.button:SetEnabled(enabled);
		if (enabled) then
			self.label:SetTextColor(1, 1, 1);
			self.text:SetTextColor(1, 0.82, 0);
		else
			self.label:SetTextColor(0.5, 0.5, 0.5);
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = AzDropDown:CreateDropDown(self.owner,180,nil,nil,true);
		f.text = f:CreateFontString(nil,"ARTWORK","GameFontNormalSmall");
		f.text:SetPoint("LEFT",-301 + f:GetWidth(),0); -- vertically centered to DropDown (without text shadow and near to bottom in case of odd number of pixels)
		f.text:SetJustifyH("LEFT");
		
		f:SetHitRectInsets(-301 + f:GetWidth(),0,0,0);
		
		f:SetScript("OnEnter", DropDown_OnEnter);
		f:SetScript("OnLeave", DropDown_OnLeave);
		
		f.button:SetScript("OnEnter", function(self, ...)
			DropDown_OnEnter(self:GetParent(), ...);
		end);
		f.button:SetScript("OnLeave", function(self, ...)
			DropDown_OnLeave(self:GetParent(), ...);
		end);
		
		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                             Text Edit                                              --
--------------------------------------------------------------------------------------------------------

local function TextEdit_OnEnter(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,1,1);
	if (self.option.tip) then
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

local function TextEdit_OnLeave(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,0.82,0);
	GameTooltip:Hide();
end

-- OnTextChange
local function TextEdit_OnTextChanged(self)
	local oldText = self.factory:GetConfigValue(self.option.var);
	local newText = self:GetText():gsub("||","|");
	
	if (oldText ~= newText) then
		self.factory:SetConfigValue(self.option.var, newText, true);
	end
end

-- New TextEdit (dimensions: 301x24, visible dimension: 301x24, visible padding: 0/0/0/0)
azof.objects.Text = {
	xOffset = 131, -- 10px final visible xOffset + (301px max visible dimension - 180px TextEdit box) = 131px
	yOffset = 5, -- 5px final visible yOffset + 0px extra padding top - 0px visible padding top = 5px
	height = 24, -- 24px visible dimension height + 0px visible padding top + 0px extra padding bottom = 24px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	backdrop = {
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		edgeSize = 10,
		insets = { left = 2, right = 2, top = 2, bottom = 2 },
	},
	Init = function(self,option,cfgValue)
		self:SetText(cfgValue:gsub("|","||"));
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		self:SetEnabled(enabled);
		if (enabled) then
			self:SetTextColor(1, 1, 1);
			self.text:SetTextColor(1, 0.82, 0);
		else
			self:SetTextColor(0.5, 0.5, 0.5);
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("EditBox",nil,self.owner,BackdropTemplateMixin and "BackdropTemplate");	-- 9.0.1: Using BackdropTemplate
		f:SetSize(180,24);
		f:SetScript("OnTextChanged", TextEdit_OnTextChanged);
		f:SetScript("OnEnterPressed", f.ClearFocus);
		f:SetScript("OnEscapePressed", f.ClearFocus);
		f:SetScript("OnEnter", TextEdit_OnEnter);
		f:SetScript("OnLeave", TextEdit_OnLeave);
		f:SetAutoFocus(false);
		f:SetFontObject("GameFontHighlight");

		f:SetBackdrop(self.objects.Text.backdrop);
		f:SetBackdropColor(0.1,0.1,0.1,1);
		f:SetBackdropBorderColor(0.4,0.4,0.4,1);
		f:SetTextInsets(6,0,0,0);
		f:SetHitRectInsets(-301 + f:GetWidth(),0,0,0);

		f.text = f:CreateFontString(nil,"ARTWORK","GameFontNormalSmall");
		f.text:SetPoint("LEFT",-121,0); -- vertically centered to TextEdit (without text shadow and near to bottom in case of odd number of pixels)
		f.text:SetJustifyH("LEFT");
		
		return f;
	end,
};

--------------------------------------------------------------------------------------------------------
--                                             Text Only                                              --
--------------------------------------------------------------------------------------------------------

local function TextOnly_OnEnter(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	if (self.option.tip) then
		self.text:SetTextColor(1,1,1);
		
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:AddLine(self.option.label:gsub("\n"," "),1,1,1);
		GameTooltip:AddLine(self.option.tip,nil,nil,nil,1);
		GameTooltip:Show();
	end
end

local function TextOnly_OnLeave(self)
	local cfgValue = self.factory:GetConfigValue(self.option.var);
	local enabled = (not self.option.enabled) or (not not self.option.enabled(self.factory, self, option, cfgValue));
	if (not enabled) then
		return;
	end
	self.text:SetTextColor(1,0.82,0);
	GameTooltip:Hide();
end

-- New TextOnly (dimensions: 301x18, visible dimension: 301x7, visible padding: 6/0/5/0)
azof.objects.TextOnly = {
	xOffset = 10, -- 10px final visible xOffset - 0px visible padding left = 10px
	yOffset = -1, -- 5px final visible yOffset + 0px extra padding top - 6px visible padding top = -1px
	height = 13, -- 7px visible dimension height + 6px visible padding top + 0px extra padding bottom = 13px
	extraPaddingTop = 5, -- 5px final visible yOffset + 0px extra padding top = 5px
	Init = function(self, option, cfgValue)
		local enabled = (not option.enabled) or (not not option.enabled(self.factory, self, option, cfgValue));
		if (enabled) then
			self.text:SetTextColor(1, 0.82, 0);
		else
			self.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end,
	CreateNew = function(self)
		local f = CreateFrame("Frame", nil, self.owner);
		f:SetSize(301, 18);
		f:SetScript("OnEnter", TextOnly_OnEnter);
		f:SetScript("OnLeave", TextOnly_OnLeave);

		f.text = f:CreateFontString("ARTWORK", nil, "GameFontNormalSmall");
		f.text:SetPoint("LEFT"); -- vertically centered to TextOnly (without text shadow and near to bottom in case of odd number of pixels)
		f.text:SetPoint("RIGHT");
		f.text:SetJustifyH("LEFT");

		return f;
	end,
};