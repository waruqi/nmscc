-- the debug mode
if is_mode("debug") then

    -- enable the debug symbols
    set_symbols("debug")

    -- disable optimization
    set_optimize("none")
end

-- the release mode
if is_mode("release") then

    -- set the symbols visibility: hidden
    set_symbols("hidden")

    -- enable fastest optimization
    set_optimize("fastest")

    -- strip all symbols
    set_strip("all")
end

-- set language: c++1z
set_languages("cxx1z")

-- set output directiories
set_targetdir("publish/bin")
set_objectdir("/tmp/nmscc")

-- add common flags
add_cxxflags("-frtti")
add_includedirs(".")

-- add target
target("nms")

    -- set kind
    set_kind("shared")

    -- set flags
    add_cxxflags("-Wall", "-Wextra", "-Wconversion", "-Wno-unknown-pragmas")
    add_defines("NMS_BUILD")

    -- add files
    add_files("nms/**.cc")
    set_pcxxheader("nms/config.h")

    -- test: blas?
    -- add_defines("NMS_OPENBLAS")
    -- add_links("openblas")

-- add target
target("nms.test")

    -- set kind
    set_kind("binary")

    -- add deps
    add_deps("nms")

    -- add files
    add_files("nms.test/**.cc")

-- add target
target("nms.cuda.compiler")

    -- set kind
    set_kind("binary")

    -- add deps
    add_deps("nms")

    -- add files
    add_files("nms.cuda.compiler/**.cc")
