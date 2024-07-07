void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("LunaSVG");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./include"
	});

	properties.files({
		"./include/**.h",
		"./source/**.cpp",
		"./3rdparty/**.h",
		"./3rdparty/**.c"
	});

	properties.include_directories({
		"./3rdparty/plutovg",
		"./3rdparty/software"
	});

	properties.defines("LUNASVG_STATIC_DEFINE");

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4267" });
	}
}