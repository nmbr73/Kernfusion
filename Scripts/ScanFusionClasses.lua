

local out_path="/Users/nmbr73/Projects/Kernfusion/ConFusion/FusionScript/"

-- ---------------------------------------------------------------------------------------------------

local class_types      = {
  CT_Any = { Index = nil, Deprecated = true },
  CT_Operator = { Index = nil, Deprecated = true },
  CT_Tool = { Index = nil, Deprecated = true },
  CT_SourceTool = { Index = nil, Deprecated = true },
  CT_SinkTool = { Index = nil, Deprecated = true },
  CT_MergeTool = { Index = nil, Deprecated = true },
  CT_Modifier = { Index = nil, Deprecated = true },
  CT_Mask = { Index = nil, Deprecated = true },
  CT_Spline = { Index = nil, Deprecated = true },
  CT_Parameter = { Index = nil, Deprecated = true },
  CT_ImageFormat = { Index = nil, Deprecated = true },
  CT_View = { Index = nil, Deprecated = true },
  CT_GLViewer = { Index = nil, Deprecated = true },
  CT_InputControl = { Index = nil, Deprecated = true },
  CT_PreviewControl = { Index = nil, Deprecated = true },
  CT_Preview = { Index = nil, Deprecated = true },
  CT_BinItem = { Index = nil, Deprecated = true },
  CT_ExternalControl = { Index = nil, Deprecated = true },
  CT_Converter = { Index = nil, Deprecated = true },
  CT_3D = { Index = nil, Deprecated = true },
  CT_3DFilter = { Index = nil, Deprecated = true },
  CT_3DFilterSource = { Index = nil, Deprecated = true },
  CT_Event = { Index = nil, Deprecated = true },
  CT_EventControl = { Index = nil, Deprecated = true },
  CT_Protocol = { Index = nil, Deprecated = true },
  CT_Utility = { Index = nil, Deprecated = true },
  CT_PaintTool = { Index = nil, Deprecated = true },
  CT_BrushShape = { Index = nil, Deprecated = true },
  CT_BrushMode = { Index = nil, Deprecated = true },
  CT_ApplyMode = { Index = nil, Deprecated = true },
  CT_AnimSegment = { Index = nil, Deprecated = true },
  CT_FlowType = { Index = nil, Deprecated = true },
  CT_Locale = { Index = nil, Deprecated = true },
  CT_PreviewMedia = { Index = nil, Deprecated = true },
  CT_LayoutItem = { Index = nil, Deprecated = true },
  CT_Transition = { Index = nil, Deprecated = true },
  CT_ToolViewInfo = { Index = nil, Deprecated = true },
  CT_ParticleStyle = { Index = nil, Deprecated = true },
  CT_ParticleTool = { Index = nil, Deprecated = true },
  CT_ParticleMergeTool = { Index = nil, Deprecated = true },
  CT_ParticleSource = { Index = nil, Deprecated = true },
  CT_Region3D = { Index = nil, Deprecated = true },
  CT_LightData3D = { Index = nil, Deprecated = true },
  CT_Light3D = { Index = nil, Deprecated = true },
  CT_MtlData3D = { Index = nil, Deprecated = true },
  CT_MtlParticle3D = { Index = nil, Deprecated = true },
  CT_MtlInputs3D = { Index = nil, Deprecated = true },
  CT_CameraData3D = { Index = nil, Deprecated = true },
  CT_Camera3D = { Index = nil, Deprecated = true },
  CT_CurveData3D = { Index = nil, Deprecated = true },
  CT_Curve3D = { Index = nil, Deprecated = true },
  CT_SurfaceData3D = { Index = nil, Deprecated = true },
  CT_SurfaceInputs3D = { Index = nil, Deprecated = true },
  CT_Renderer3D = { Index = nil, Deprecated = true },
  CT_RendererInputs3D = { Index = nil, Deprecated = true },
  CT_RenderContext3D = { Index = nil, Deprecated = true },
  CT_Shader3D = { Index = nil, Deprecated = true },
  CT_FileFormat3D = { Index = nil, Deprecated = true },
  CT_ShadowClass3D = { Index = nil, Deprecated = true },
  CT_GLTexture = { Index = nil, Deprecated = true },
  CT_MtlSW3D = { Index = nil, Deprecated = true },
  CT_MtlGL3D = { Index = nil, Deprecated = true },
  CT_LightSW3D = { Index = nil, Deprecated = true },
  CT_LightGL3D = { Index = nil, Deprecated = true },
  CT_FuMenu = { Index = nil, Deprecated = true },
  CT_ConsoleUtility = { Index = nil, Deprecated = true },
  CT_ViewLUTPlugin = { Index = nil, Deprecated = true },
  CT_UserControl = { Index = nil, Deprecated = true },
  CT_LUTFormat = { Index = nil, Deprecated = true },
  CT_Prefs = { Index = nil, Deprecated = true },
}

local class_type_keys = {}

for key in pairs(class_types) do
  table.insert( class_type_keys, key )
end
table.sort( class_type_keys )


local class_type_index = {}

for class_type,data in pairs(class_types) do
	if (app[class_type]) then
    class_type_index[app[class_type]] = class_type
    data.Deprecated=false
    data.Index=app[class_type]
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

-- Fusion 8 Scripting Guide page 40
local type_characters = {
  S  = { Name = "String", },
  B  = { Name = "Boolean", },
  N  = { Name = "Number (float)", },
  I  = { Name = "Integer", },
  H  = { Name = "Handle", },
  NT = { Name = "Number Table", },
  IT = { Name = "Integer Table", },
  ST = { Name = "String Tabel", },
  BT = { Name = "Boolean Table", },
}

-- ---------------------------------------------------------------------------------------------------





local page

page = io.open(out_path..'Class Types.md',"w")

page:write("---\ntags: [reference]\n---\n\n")

for i,class_type_key in ipairs(class_type_keys) do
  local class_type=class_types[class_type_key]
  if not(class_type.Deprecated) then
    page:write('* [['..class_type_key..']]\n')
  else
    page:write('* <del>'..class_type_key..'</del> <span style="color:#ff0000; ">(depricated)</span>\n')
  end

end


page:close()




page = io.open(out_path..'Registry Attributes.md',"w")

page:write("---\ntags: [reference]\n---\n\n")


local prefix2type = {
  REGS = 'string',
  REGI = 'integer',
  REGB = 'boolean',
  REGST = 'string table',
}

for i,regristry_attribute_key in ipairs(registry_attribute_keys) do
  local registry_attribute=registry_attributes[regristry_attribute_key]

  print(regristry_attribute_key)

  page:write('[[REG'..registry_attribute.Type..'_'..regristry_attribute_key..']] ')
  page:write('('..type_characters[registry_attribute.Type].Name  ..')<br />\n')
  page:write(''..registry_attribute.Description..'')

  if registry_attribute.FKA then
    page:write('<br />\nThis attribute was named [['..registry_attribute.FKA..']] in the [[Scripting Guide]].')
  end
  page:write('\n\n')
end


page:close()
