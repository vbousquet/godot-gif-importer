# Derived from https://github.com/jegor377/godot-gdgifexporter

tool
extends EditorImportPlugin

func get_importer_name():
	return "gif.animated.texture.plugin"

func get_visible_name():
	return "Animated Texture"

func get_recognized_extensions():
	return ["gif"]

func get_save_extension():
	return "tres"

func get_resource_type():
	return "AnimatedTexture"

func get_preset_count():
	return 1

func get_preset_name(i):
	return "Default"

func get_import_options(i):
	return [
		{"name": "Filter", "default_value": false},
		{"name": "MipMaps", "default_value": false}
	]

func import(source_file, save_path, options, platform_variants, gen_files):
	var reader = GifReader.new()
	reader.filter = options["Filter"]
	reader.mipmaps = options["MipMaps"]
	var tex = reader.read(source_file)
	if tex == null:
		return FAILED
	var filename = save_path + "." + get_save_extension()
	return ResourceSaver.save(filename, tex)
