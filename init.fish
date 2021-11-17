# Copied some code from fundle
set -l config_home $XDG_CONFIG_HOME

if test -z "$config_home"
	set config_home ~/.config
end

if test -z "$fishnet_plugin_dir"
	set fishnet_plugin_dir "$config_home/fish/bundle"
end

set plugins (find $fishnet_plugin_dir -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $NF}')

for plugin in $plugins
	if test $plugin = "fishnet"
		continue
	end

	set -l plugin_dir "$fishnet_plugin_dir/$plugin"
	set -l init_file "$plugin_dir/init.fish"
	set -l conf_dir "$plugin_dir/conf.d"
	set -l bindings_file  "$plugin_dir/key_bindings.fish"
	set -l functions_dir "$plugin_dir/functions"
	set -l completions_dir  "$plugin_dir/completions"

	if begin; test -d $functions_dir; and not contains $functions_dir $fish_function_path; end
		set fish_function_path $functions_dir $fish_function_path
	end

	if begin; test -d $completions_dir; and not contains $completions_dir $fish_complete_path; end
		set fish_complete_path $completions_dir $fish_complete_path
	end

	if test -f $init_file
		source $init_file
	else if test -d $conf_dir
		# read all *.fish files in conf.d
		for f in (find $conf_dir -maxdepth 1 -iname "*.fish")
			source $f
		end
	else
		# read all *.fish files if no init.fish or conf.d found
		for f in (find $plugin_dir -maxdepth 1 -iname "*.fish")
			source $f
		end
	end

	if test -f $bindings_file
		set -g __fishnet_binding_paths $bindings_file $__fishnet_binding_paths
	end
end

if functions -q fish_user_key_bindings; and not functions -q __fish_user_key_bindings
	functions -c fish_user_key_bindings __fish_user_key_bindings
end

function fish_user_key_bindings
	for bindings in $__fishnet_binding_paths
		source $bindings
	end
	if functions -q __fish_user_key_bindings
		__fish_user_key_bindings
	end
end
