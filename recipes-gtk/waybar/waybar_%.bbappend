PACKAGECONFIG:append = "experimental"

do_configure:prepend() {
 sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' ${S}/src/modules/wlr/workspace_manager.cpp
}
