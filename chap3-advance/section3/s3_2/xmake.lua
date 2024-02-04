add_requires("boost")
add_rules("mode.debug")

set_toolchains("@llvm")

target("s3_2") do
    set_kind("binary")
    add_files("./*.cxx")
    add_packages("boost")
	set_languages("cxx17")
	set_targetdir("./build")
end