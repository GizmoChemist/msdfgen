-- If you use this premake script, you'll need to define the BIN_DIR, DEP_DIR,
-- and OBJ_DIR variables according to your personal preferences.

include DEP_DIR .. "freetype"

project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir (BIN_DIR)
	objdir    (OBJ_DIR)

	files {
		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",
		"include/**.h",
		
		DEP_DIR .. "tinyxml2/tinyxml2.h",
		DEP_DIR .. "tinyxml2/tinyxml2.cpp"
	}

	includedirs {
		"include",
		DEP_DIR .. "freetype/include",
		DEP_DIR .. "tinyxml2"
	}

	defines { "MSDFGEN_USE_CPP11" }
	links   { "freetype"          }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"