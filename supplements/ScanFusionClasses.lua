

local repo_path = debug.getinfo(1, "S").source:sub(2):match('^(.+)/supplements/ScanFusionClasses.lua$')
local out_path = repo_path.."/docs/_ScanFusionClasses"

print("go")
-- os.exit(0)

-- function mkdir(path)
--   bmd.createdir(path)
--   -- os.execute("mkdir -p " .. path)
-- end



-- ---------------------------------------------------------------------------------------------------

local class_types      = {
  CT_Any = { Description = "", },
  CT_Operator = { Description = "", },
  CT_Tool = { Description = "", },
  CT_SourceTool = { Description = "", },
  CT_SinkTool = { Description = "", },
  CT_MergeTool = { Description = "", },
  CT_Modifier = { Description = "", },
  CT_Mask = { Description = "", },
  CT_Spline = { Description = "", },
  CT_Parameter = { Description = "", },
  CT_ImageFormat = { Description = "", },
  CT_View = { Description = "", },
  CT_GLViewer = { Description = "", },
  CT_InputControl = { Description = "", },
  CT_PreviewControl = { Description = "", },
  CT_Preview = { Description = "", },
  CT_BinItem = { Description = "", },
  CT_ExternalControl = { Description = "", },
  CT_Converter = { Description = "", },
  CT_3D = { Description = "", },
  CT_3DFilter = { Description = "", },
  CT_3DFilterSource = { Description = "", },
  CT_Event = { Description = "", },
  CT_EventControl = { Description = "", },
  CT_Protocol = { Description = "", },
  CT_Utility = { Description = "", },
  CT_PaintTool = { Description = "", },
  CT_BrushShape = { Description = "", },
  CT_BrushMode = { Description = "", },
  CT_ApplyMode = { Description = "", },
  CT_AnimSegment = { Description = "", },
  CT_FlowType = { Description = "", },
  CT_Locale = { Description = "", },
  CT_PreviewMedia = { Description = "", },
  CT_LayoutItem = { Description = "", },
  CT_Transition = { Description = "", },
  CT_ToolViewInfo = { Description = "", },
  CT_ParticleStyle = { Description = "", },
  CT_ParticleTool = { Description = "", },
  CT_ParticleMergeTool = { Description = "", },
  CT_ParticleSource = { Description = "", },
  CT_Region3D = { Description = "", },
  CT_LightData3D = { Description = "", },
  CT_Light3D = { Description = "", },
  CT_MtlData3D = { Description = "", },
  CT_MtlParticle3D = { Description = "", },
  CT_MtlInputs3D = { Description = "", },
  CT_CameraData3D = { Description = "", },
  CT_Camera3D = { Description = "", },
  CT_CurveData3D = { Description = "", },
  CT_Curve3D = { Description = "", },
  CT_SurfaceData3D = { Description = "", },
  CT_SurfaceInputs3D = { Description = "", },
  CT_Renderer3D = { Description = "", },
  CT_RendererInputs3D = { Description = "", },
  CT_RenderContext3D = { Description = "", },
  CT_Shader3D = { Description = "", },
  CT_FileFormat3D = { Description = "", },
  CT_ShadowClass3D = { Description = "", },
  CT_GLTexture = { Description = "", },
  CT_MtlSW3D = { Description = "", },
  CT_MtlGL3D = { Description = "", },
  CT_LightSW3D = { Description = "", },
  CT_LightGL3D = { Description = "", },
  CT_FuMenu = { Description = "", },
  CT_ConsoleUtility = { Description = "", },
  CT_ViewLUTPlugin = { Description = "", },
  CT_UserControl = { Description = "", },
  CT_LUTFormat = { Description = "", },
  CT_Prefs = { Description = "", },

	-- Additional constants for future use:

	TIME_UNDEFINED = { Description = "", },
	CLSID_DataType_Audio = { Description = "", },
  CLSID_DataType_Clip = { Description = "", },
  CLSID_DataType_Gradient = { Description = "", },
	CLSID_DataType_Image = { Description = "", },
  CLSID_DataType_Histogram = { Description = "", },
  CLSID_DataType_LookUpTable = { Description = "", },
	CLSID_DataType_Mask = { Description = "", },
  CLSID_DataType_Number = { Description = "", },
  CLSID_DataType_Point = { Description = "", },
  CLSID_DataType_Text = { Description = "", },
	CLSID_DataType_Polyline = { Description = "", },
  CLSID_DataType_BSplinePolyline = { Description = "", },
  CLSID_DataType_TransformMatrix = { Description = "", },
	CLSID_DataType_Mesh = { Description = "", },
  CLSID_DataType_Particles = { Description = "", },
  CLSID_DataType_3D = { Description = "", },
  CLSID_DataType_FuID = { Description = "", },
	CLSID_DataType_ScriptVal = { Description = "", },
	CLSID_View_GL = { Description = "", },
  CLSID_View_Controls = { Description = "", },
  CLSID_View_Modifiers = { Description = "", },
  CLSID_View_Flow = { Description = "", },
	CLSID_View_SplineEditor = { Description = "", },
  CLSID_View_Timeline = { Description = "", },
  CLSID_View_Console = { Description = "", },
  CLSID_View_Transport = { Description = "", },
	TC_PRF_Frame = { Description = "", },
  TC_PRF_SMPTE = { Description = "", },
  TC_PRF_Feet = { Description = "", },
	DCMSG_TIMECODE_CHANGED = { Description = "", },
  DCMSG_LOOKPACK_CHANGED = { Description = "", },
  DCMSG_PREFS_CHANGE = { Description = "", },
}

local class_type_keys = {}

for key in pairs(class_types) do
  table.insert( class_type_keys, key )
end
table.sort( class_type_keys )


local class_type_index = {} -- map int (class type index) to string (class type key)

for class_type, data in pairs(class_types) do
  data.Index = -1
  data.Deprecated = true
	if (app[class_type]) then
    class_type_index[app[class_type]] = class_type
    data.Index=app[class_type]
    data.Deprecated=false
	end
end

-- ---------------------------------------------------------------------------------------------------


-- The attribute descriptions are from the Fusion 8 Scripting Guide
-- Copied from the Reactor's Class Browser.
-- Full name is `REG<TYPE>_<NAME>`.

local registry_attributes =
{
  Name = { Type = "S",  Description = "Specifies the full name of the class represented by this registry entry."},
  ScriptName = { Type = "S",  Description = "Specifies the scripting name of the class represented by this registry entry.<br />If not specified, the full name defined by [[REGS_Name]] is used."},
  HelpFile = { Type = "S",  Description = "The help file and ID for the class."},
  HelpID = { Type = "I",  Description = "The help file and ID for the class."},
  HelpTopic = { Type = "S",  Description = "The help file and ID for the class.", FKA = "REGI_HelpTopicID"},
  OpIconString = { Type = "S",  Description = "Specifies the toolbar icon text used to represent the class."},
  OpDescription = { Type = "S",  Description = "Specifies a description of the class."},
  OpToolTip = { Type = "S",  Description = "Specifies a tooltip for the class to provide a longer name or description."},
  Category = { Type = "S",  Description = "Specifies the category for the class, defining a position in the Tools menu for tool classes."},
  ClassType = { Type = "I",  Description = "Specifies the type of this class, based on the classtype constants."},
  ClassType2 = { Type = "I",  Description = "Specifies the type of this class, based on the classtype constants."},
  ID = { Type = "S",  Description = "A unique ID for this class.", FKA = "REGI_ID"},
  OpIcon = { Type = "I",  Description = "A resource ID for a bitmap to be used for toolbar images for this class.", FKA = "REGI_OpIconID"},
  IconID = { Type = "S",  Description = "A resource ID for a bitmap to be used for toolbar images for this class.", FKA = "REGI_OpIconID"},
  OpNoMask = { Type = "B",  Description = "Indicates if this Tool class cannot deal with being masked."},
  DataType = { Type = "I",  Description = "Specifies a data type RegID dealt with by this class."},
  TileID = { Type = "I",  Description = "Specifies a resource ID used for the tile image by this class."},
  CreateStaticPreview = { Type = "B",  Description = "Indicates that a preview object is to be created at startup of this type."},
  CreateFramePreview = { Type = "B",  Description = "Indicates that a preview object is to be created for each new frame window."},
  Preview_CanDisplayImage = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanCreateAnim = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanPlayAnim = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanSaveImage = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanSaveAnim = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanCopyImage = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanCopyAnim = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanRecord = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_UsesFilenames = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Preview_CanNetRender = { Type = "B",  Description = "Defines various capabilities of a preview class."},
  Version = { Type = "I",  Description = "Defines the version number of this class or plugin."},
  PI_DataSize = { Type = "I",  Description = "Defines a custom data size for AEPlugin classes."},
  Unpredictable = { Type = "B",  Description = "Indicates if this tool class is predictable or not.<br />Predictable tools will generate the same result given the same set of input values, regardless of time."},
  InputDataType = { Type = "I",  Description = "Specifies a data type RegID dealt with by the main inputs of this class."},
  OperatorControl = { Type = "B",  Description = "Indicates if this tool class provides custom overlay control handling."},
  Source_GlobalCtrls = { Type = "B",  Description = "Indicates if this source tool class has global range controls."},
  Source_SizeCtrls = { Type = "B",  Description = "Indicates if this source tool class has image resolution controls."},
  Source_AspectCtrls = { Type = "B",  Description = "Indicates if this source tool class has image aspect controls."},
  NoAutoProxy = { Type = "B",  Description = "Indicates if this tool class does not want things to be autoproxied when it is adjusted."},
  Logo = { Type = "I",  Description = "Specifies a resource ID of a company logo for this class."},
  Priority = { Type = "I",  Description = "Specifies the priority of this class on the registry list."},
  NoBlendCtrls = { Type = "B",  Description = "Indicates if this tool class does not have blend controls."},
  NoObjMatCtrls = { Type = "B",  Description = "Indicates if this tool class does not have Object/Material selection controls."},
  NoMotionBlurCtrls = { Type = "B",  Description = "Indicates if this tool class does not have Motion Blur controls."},
  NoAuxChannels = { Type = "B",  Description = "Indicates if this tool class cannot deal with being given Auxiliary channels (such as Z, ObjID, etc)"},
  EightBitOnly = { Type = "B",  Description = "Indicates if this tool class cannot deal with being given greater than 8 bit per channel images."},
  ControlView = { Type = "B",  Description = "Indicates if this class is a control view class."},
  NoSplineAnimation = { Type = "B",  Description = "Specifies that this data type (parameter class) cannot be animated using a spline."},
  MergeDataType = { Type = "I",  Description = "Specifies what type of data this merge tool class is capable of merging."},
  ForceCommonCtrls = { Type = "B",  Description = "Forces the tool to have common controls like motion blur, blend etc, even on modifiers."},
  Particle_ProbabilityCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_SetCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_AgeRangeCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_RegionCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_RegionModeCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_StyleCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_EmitterCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_RandomSeedCtrls = { Type = "B",  Description = "Specifies that particle tools should have (or not have) various standard sets of controls."},
  Particle_DefaultRegion = { Type = "I",  Description = "Specifies the RegID of a default Region for this particle tool class."},
  Particle_DefaultStyle = { Type = "I",  Description = "Specifies the RegID of a default Style for this particle tool class."},
  MediaFormat_Priority = { Type = "I",  Description = "Specifies the priority of a media format class."},
  MediaFormat_FormatName = { Type = "S",  Description = "Specifies the name of a media format class"},
  MediaFormat_Extension = { Type = "ST",  Description = "Specifies the extensions supported by a media format class"},
  MediaFormat_CanLoad = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSave = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanLoadMulti = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveMulti = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_WantsIOClass = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_LoadLinearOnly = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_SaveLinearOnly = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveCompressed = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_OneShotLoad = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_OneShotSave = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanLoadImages = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveImages = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanLoadAudio = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveAudio = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanLoadText = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveText = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanLoadMIDI = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_CanSaveMIDI = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_ClipSpecificInputValues = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  MediaFormat_WantsUnbufferedIOClass = { Type = "B",  Description = "Specify various capabilities of a media format class"},
  ImageFormat_CanLoadFields = { Type = "B",  Description = "Specify various capabilities of an image format class"},
  ImageFormat_CanSaveField = { Type = "B",  Description = "Specify various capabilities of an image format class"},
  ImageFormat_CanScale = { Type = "B",  Description = "Specify various capabilities of an image format class"},
  ImageFormat_CanSave8bit = { Type = "B",  Description = "Specify various capabilities of an image format class"},
  ImageFormat_CanSave24bit = { Type = "B",  Description = "Specify various capabilities of an image format class"},
  ImageFormat_CanSave32bit = { Type = "B",  Description = "Specify various capabilities of an image format class"},

}

for attr, data in pairs(registry_attributes) do

  data.Description = data.Description:gsub("classtype","[[Class Types|classtype]]")
  data.Description = data.Description:gsub("particle tool","[[Particle Tool|particle tool]]")
  data.Description = data.Description:gsub("preview class","[[Preview Class|preview class]]")
  data.Description = data.Description:gsub("image format class","[[Image Format Class|image format class]]")
  data.Description = data.Description:gsub("media format class","[[Media Format Class|media format class]]")

end

local registry_attribute_keys = {}

for key in pairs(registry_attributes) do
  table.insert( registry_attribute_keys, key )
end
table.sort( registry_attribute_keys )


-- ---------------------------------------------------------------------------------------------------

local classes = {}

for i, class_name in ipairs(app:GetHelpRaw()) do
  local help = app:GetHelpRaw(class_name)

  -- LongHelp ... only for 'Registry'
  -- ShortHelp ... only for 'Registry' and 'Object'
  -- Parent ... Name of parent class or nil
  -- Members ... table

  if classes[class_name] ~= nil then

    -- This happens for:
    -- MtlWardData, MtlCookTorranceData, _TimeSpeed, _TimeStretcher, TextEditControl, ColorCurves

    -- classes[class_name].Occurences = classes[class_name].Occurences + 1
    -- classes[class_name.." (".. classes[class_name].Occurences ..")"]
    --   = { Parent = help.Parent, Children = {}, Occurences = 0, Members = help.Members, }

  else
    classes[class_name] = { Parent = help.Parent, Children = {}, Occurences = 1, Members = help.Members, }
  end

end


for class_name, data in pairs(classes) do
  if data.Occurences == 0 then
    print("- "..class_name.." ".. #data.Members)
    for i, x in ipairs(data.Members) do
      print("  "..i..": "..x)
    end
  end
end


-- All derived classes for each class
for class_name, data in pairs(classes) do
  for cn, d in pairs(classes) do
    if d.Parent ~= nil and d.Parent == class_name and cn ~= class_name then
      table.insert(data.Children,cn)
    end
  end
end

-- Inheritance path for each class
for class_name, data in pairs(classes) do
  data.Path = {}
  local stack = data
  local i = 0
  while stack ~= nil and stack.Parent ~= nil do

    if stack.Parent == '' then
      -- What are these classes that have a '' as parent?!?
      stack = nil
    elseif classes[stack.Parent] == nil then
      print("DANG for '"..stack.Parent.."' in "..class_name)
      os.exit(10)
    else
      data.Path[i] = stack.Parent
      i = i+1
      stack = classes[stack.Parent]
    end

  end
end





-- for class_name, data in pairs(classes) do
--   print(class_name .. " " .. #data.Path)
-- end


-- ---------------------------------------------------------------------------------------------------


-- Fusion 8 Scripting Guide page 40
-- 'Browser' are the names as found in the Class Broser
local type_characters = {
  S  = { Name = "String", Browser = "string", },
  B  = { Name = "Boolean", Browser = "boolean", },
  N  = { Name = "Number (float)", Browser = "number (float)", },
  I  = { Name = "Integer", Browser = "number (integer)", },
  H  = { Name = "Handle", Browser = "handle", },
  NT = { Name = "Number Table", Browser = "table { number (float) }", },
  IT = { Name = "Integer Table", Browser = "table { number (integer) }", },
  ST = { Name = "String Tabel", Browser = "table { string }", },
  BT = { Name = "Boolean Table", Browser = "table { bool }"},
}

-- ---------------------------------------------------------------------------------------------------





local page

-- ---------------------------------------------------------------------------------------------------
-- Class Type
-- ---------------------------------------------------------------------------------------------------

bmd.createdir(out_path..'/Class Types/')

-- Class Type index page

page = io.open(out_path..'/Class Types/Class Types.md',"w")

page:write("---\ntitle: Class Types\nalias: Class Type\ntags: [Reference]\n---\n\n")

for i,class_type_key in ipairs(class_type_keys) do
  local class_type=class_types[class_type_key]
  if not(class_type.Deprecated) then
    page:write('* [['..class_type_key..']]\n')
  else
    page:write('* <del>'..class_type_key..'</del> <span style="color:#ff0000; ">(depricated)</span>\n')
  end
end

page:close()

-- Create a page for each Class Type

for i,class_type_key in ipairs(class_type_keys) do
  local class_type=class_types[class_type_key]
  if not(class_type.Deprecated) then
    page = io.open(out_path..'/Class Types/'.. class_type_key ..'.md',"w")
    page:write("---\ntitle: ".. class_type_key .."\n---\n\n")
    page:write(class_type_key..' is a [[Class Types|Class Type]]\n')
    page:close()
  end
end



-- ---------------------------------------------------------------------------------------------------
-- Registry Attributes
-- ---------------------------------------------------------------------------------------------------

bmd.createdir(out_path..'/Registry Attributes/')

-- Registry Attributes index page

page = io.open(out_path..'/Registry Attributes/Registry Attributes.md',"w")

page:write("---\ntitle: Registry Attributes\nalias: Registry Attribute\ntags: [Reference]\n---\n\n")

-- local prefix2type = {
--   REGS = 'string',
--   REGI = 'integer',
--   REGB = 'boolean',
--   REGST = 'string table',
-- }

for i,regristry_attribute_key in ipairs(registry_attribute_keys) do
  local registry_attribute=registry_attributes[regristry_attribute_key]

  page:write('[[REG'..registry_attribute.Type..'_'..regristry_attribute_key..']] ')
  page:write('('..type_characters[registry_attribute.Type].Name  ..')<br />\n')
  page:write(''..registry_attribute.Description..'')

  if registry_attribute.FKA then
    page:write('<br />\nThis attribute was named [['..registry_attribute.FKA..']] in the [[Scripting Guide]].')
  end
  page:write('\n\n')
end


page:close()

-- Create a page for each Registry Atribute


for i,regristry_attribute_key in ipairs(registry_attribute_keys) do
  local registry_attribute=registry_attributes[regristry_attribute_key]

  local name = 'REG'..registry_attribute.Type..'_'..regristry_attribute_key

  page = io.open(out_path..'/Registry Attributes/'.. name ..'.md',"w")
  page:write("---\ntitle: ".. name .."\naliases:\n  - "..regristry_attribute_key.."\n---\n\n")
  page:write(regristry_attribute_key..' (`'.. name..'`) is a [[Registry Attributes|Registry Attribute]] of type '.. type_characters[registry_attribute.Type].Name ..' (\'`'.. registry_attribute.Type ..'`\').\n')
  page:write(''..registry_attribute.Description..'\n')
  if registry_attribute.FKA then
    page:write('> [!warning] FKA "'.. registry_attribute.FKA ..'"\n> This attribute was named [['..registry_attribute.FKA..']] in the [[Scripting Guide]].')
  end
  page:close()


end