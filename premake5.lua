include "../../premake/common_premake_defines.lua"

project "LunaSVG"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./include/**.h",
		"./source/**.cpp",
		"./3rdparty/**.h",
		"./3rdparty/**.c"
	}

	includedirs {
		"%{IncludeDir.lunasvg}",

		"./3rdparty/plutovg",
		"./3rdparty/software"
	}

	filter "toolset:msc"
		disablewarnings { "4267" }