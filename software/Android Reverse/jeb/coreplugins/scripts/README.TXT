Back-end script plugins must be dropped in this folder.
Each plugin here must be a stand-alone Java source file or a Python (2.7) source file.
Supported extensions: .java, .py
Plugins are compiled on-demand. They can be modified while JEB is running.

-> Back-end script plugins written in Java are ENABLED by default.

-> Back-end script plugins written in Python are DISABLED by default.
To aloow the plugin manager to load back-end Python scripts, add the following line to your JEB's bin/jeb-engines.cfg file:
.LoadPythonPlugins = true
