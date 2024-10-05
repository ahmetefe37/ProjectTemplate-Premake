workspace "TestWorkspace"
    configurations { "Debug", "Release" }
    location "build"

-- Paylaşılan kütüphane projesi
project "Test-Core"
    kind "SharedLib"  -- Paylaşılan kütüphane
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "%{prj.name}/src/*.cpp", "%{prj.name}/include/*.h" }  -- Kütüphane dosyaları
    includedirs { "%{prj.name}/include" }  -- Header dosyaları için dizin

    filter "system:linux"
        buildoptions { "-fPIC" }  -- Position Independent Code is necessary for shared libraries on Linux
        ---postbuildcommands { "{COPY} %{cfg.buildtarget.relpath} ../bin/%{cfg.buildcfg}" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"


-- Ana uygulama projesi
project "Test-App"
    kind "ConsoleApp"  -- Konsol uygulaması
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "%{prj.name}/src/*.cpp" ,
            "%{prj.name}/include/*.h" ,
            "Test-Core/include/*.h"
            }  -- Ana uygulama dosyaları

    includedirs { "Test-App/include" ,
                    "Test-Core/include"
                }  -- Header dosyaları için dizin

    links { "Test-Core" }  -- Paylaşılan kütüphane ile bağlantı

    filter "system:linux"
        links { "Test-Core" }  -- Linux için bağlantı

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
