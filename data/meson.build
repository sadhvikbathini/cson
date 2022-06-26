icon_sizes = ['16', '24', '32', '48', '64', '128']

icons_dir = join_paths(get_option('datadir'), 'icons', 'hicolor')
foreach size : icon_sizes
    asset = join_paths('assets', 'icons', '@0@x@0@'.format(size), '@0@.svg'.format(meson.project_name()))
    install_data(
	    asset,
	    install_dir:  join_paths(icons_dir, '@0@x@0@'.format(size), 'apps'),
	    rename: '@0@.svg'.format(meson.project_name())
    )
    install_data(
	    asset,
	    install_dir: join_paths(icons_dir,  '@0@x@0@@2'.format(size), 'apps'),
	    rename: '@0@.svg'.format(meson.project_name())
    )
endforeach

install_data(
    'com.github.sadhvikbathini.cson.desktop',
    install_dir: join_paths(get_option('datadir'), 'applications'),
    rename: meson.project_name() + '.desktop'
)
# sh -c "pkexec env DISPLAY=\\$DISPLAY XAUTHORITY=\\$XAUTHORITY command"
# sh -c "zenity --password --title=\"Authentication Required\" --timeout=30 2>/dev/null | sudo -S -H com.github.sadhvikbathini.cson %U"

install_data(
    'com.github.sadhvikbathini.cson.metadata.xml',
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)
install_data(
    'CSOn.1.gz',
    install_dir: join_paths(get_option('datadir'),'man','man1')
)

install_data(
    'gschema.xml',
    install_dir : join_paths (get_option('datadir'),'glib-2.0','schemas'),
    rename : meson.project_name() + '.gschema.xml'
)
install_data(
    'run.sh',
    install_dir : join_paths(get_option('bindir')),
    rename : 'CSOn'
)
install_data(
    'code.py',
    install_dir : join_paths(get_option('bindir')),
    rename : 'comgithubcson.py'
)
install_data(
    'CaptureScript.sh',
    install_dir : join_paths(get_option('bindir'))
)
install_data(
    join_paths('assets', 'com.github.sadhvikbathini.cson.jpg'),
    install_dir : join_paths(get_option('bindir'))
)
install_data(
    join_paths('assets', 'image_cson.jpg'),
    install_dir : join_paths(get_option('bindir'))
)
