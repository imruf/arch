config.load_autoconfig(False)

c.content.autoplay = False
c.content.images = True
c.content.javascript.enabled = True

c.downloads.location.directory = ''
c.downloads.location.prompt = True
c.downloads.location.remember = True

c.scrolling.smooth = True

c.statusbar.show = 'in-mode'

c.tabs.show = 'multiple' #always, never, multiple, switching
c.tabs.title.format = '{audio}{index}: {host}'

# colors.webpage.preferred_color_scheme dark
# c.colors.webpage.darkmode.enabled = True
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab' #lightness/brightness-cielab/hsl/rgb
# c.colors.webpage.darkmode.grayscale.all = True
#auto, light, dark


c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?hl=en&q={}',
                       'aur': 'https://aur.archlinux.org/packages/?O=0&K={}',
                       'aw': 'https://wiki.archlinux.org/?search={}',
                       'b2b': 'https://www.english-bangla.com/bntobn/index/{}',
                       'b2e': 'https://www.english-bangla.com/bntoen/index/{}',
                       'bing': 'https://bing.com/search?q={}',
                       'ddg': 'https://duckduckgo.com/?q={}',
                       'e2b': 'https://www.english-bangla.com/dictionary/{}',
                       'gg': 'https://www.google.com/search?hl=en&q={}' ,
                       'gi': 'https://www.google.com/search?hl=en&tbm=isch&q={}' ,
                       'git': 'https://github.com/search?q={}' ,
                       'pkg': 'https://www.archlinux.org/packages/?q={}' ,
                       'sp': 'https://www.startpage.com/do/search?query={}',
                       'ud': 'https://www.urbandictionary.com/define.php?term={}',
                       'ytv': 'https://www.youtube.com/results?search_query={}',
                       'yy': 'https://search.yahoo.com/search?p={}',
                       }

c.url.start_pages = ['about:blank']

c.window.hide_decoration = True
c.window.title_format = '{perc}{host}'

config.bind(';m', 'hint links spawn l {url}')
# config.bind('x', 'hint links spawn mpv --ytdl-format=\'bestvideo[height<=240]+bestaudio/best[height<=240]\' {hint-url}')
# config.bind('X', 'hint links spawn mpv {hint-url}')
config.bind('ca', 'hint links spawn aria2p add {hint-url}')
config.bind('acsd', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/color/soldark.css ""')
config.bind('acsl', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/color/sollight.css ""')
config.bind('acd', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/color/darculized.css ""')
config.bind('acg', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/color/gruvbox.css ""')
config.bind('q', 'quit')
config.bind("'", 'hint all')
config.bind('f', 'hint')
config.bind('af', 'hint all tab')
config.bind('F', 'hint all tab')
config.bind('u', 'back')
config.bind('m', 'forward')
config.bind('<Ctrl-m>', 'quickmark-save')
config.bind('tp', 'config-cycle -p content.images')
config.bind('tj', 'config-cycle -p content.javascript.enabled')
config.bind('tdm', 'config-cycle -p colors.webpage.darkmode.enabled')
config.bind('<Ctrl-u>', 'undo')
config.bind('<Alt-C>', 'prompt-yank', mode='prompt')
config.bind('tqr', 'restart')
config.bind('gt', 'tab-next')
config.bind('gT', 'tab-prev')
config.bind('gb', 'set-cmd-text -s :buffer')
# config.bind('H', 'back')
# config.bind('L', 'forward')

config.bind('ggb', 'open qute://bookmarks#bookmarks')
config.bind('gh', 'open qute://history')
config.bind('gq', 'open qute://bookmarks')
config.bind('gx', 'open qute://settings')
config.bind('gd', 'download')
config.bind('gs', 'view-source')

config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['st', '-n', 'qtfp', '-g', '112x20', '-e', 'nnn', '-p', '{}'])
config.set("fileselect.multiple_files.command", ['st', '-n', 'qtfp', '-g', '112x20', '-e', 'nnn', '-p', '{}'])

# c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
# c.auto_save.interval = 15000
# c.auto_save.session = False
# c.backend = 'webengine'
# c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

# c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)'
# c.colors.completion.category.border.bottom = 'black'
# c.colors.completion.category.border.top = 'black'
# c.colors.completion.even.bg = '#333333'
# c.colors.completion.item.selected.bg = '#e8c000'
# c.colors.completion.item.selected.border.bottom = '#bbbb00'
# c.colors.completion.category.fg = 'white'
# c.colors.completion.fg = ['white', 'white', 'white']
# c.colors.completion.item.selected.border.top = '#bbbb00'
# c.colors.completion.item.selected.fg = 'black'
# c.colors.completion.item.selected.match.fg = '#ff4444'
# c.colors.completion.match.fg = '#ff4444'
# c.colors.completion.odd.bg = '#444444'
# c.colors.completion.scrollbar.bg = '#333333'
# c.colors.completion.scrollbar.fg = 'white'
# c.colors.downloads.bar.bg = 'black'
# c.colors.downloads.error.bg = 'red'
# c.colors.downloads.error.fg = 'white'
# c.colors.downloads.start.bg = '#0000aa'
# c.colors.downloads.start.fg = 'white'
# c.colors.downloads.stop.bg = '#00aa00'
# c.colors.downloads.stop.fg = 'white'
# c.colors.downloads.system.bg = 'rgb'
# c.colors.downloads.system.fg = 'rgb'
# c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.8), stop:1 rgba(255, 197, 66, 0.8))'
# c.colors.hints.fg = 'black'
# c.colors.hints.match.fg = 'green'
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'
# c.colors.keyhint.fg = '#FFFFFF'
# c.colors.keyhint.suffix.fg = '#FFFF00'
# c.colors.messages.error.bg = 'red'
# c.colors.messages.error.border = '#bb0000'
# c.colors.messages.error.fg = 'white'
# c.colors.messages.info.bg = 'black'
# c.colors.messages.info.border = '#333333'
# c.colors.messages.info.fg = 'white'
# c.colors.messages.warning.bg = 'darkorange'
# c.colors.messages.warning.border = '#d47300'
# c.colors.messages.warning.fg = 'white'
# c.colors.prompts.bg = '#444444'
# c.colors.prompts.border = '1px solid gray'
# c.colors.prompts.fg = 'white'
# c.colors.prompts.selected.bg = 'grey'
# c.colors.statusbar.caret.bg = 'purple'
# c.colors.statusbar.caret.fg = 'white'
# c.colors.statusbar.caret.selection.bg = '#a12dff'
# c.colors.statusbar.caret.selection.fg = 'white'
# c.colors.statusbar.command.bg = 'black'
# c.colors.statusbar.command.fg = 'white'
# c.colors.statusbar.command.private.bg = 'grey'
# c.colors.statusbar.command.private.fg = 'white'
# c.colors.statusbar.insert.bg = 'darkgreen'
# c.colors.statusbar.insert.fg = 'white'
# c.colors.statusbar.normal.bg = 'black'
# c.colors.statusbar.normal.fg = 'white'
# c.colors.statusbar.passthrough.bg = 'darkblue'
# c.colors.statusbar.passthrough.fg = 'white'
# c.colors.statusbar.private.bg = '#666666'
# c.colors.statusbar.private.fg = 'white'
# c.colors.statusbar.progress.bg = 'white'
# c.colors.statusbar.url.error.fg = 'orange'
# c.colors.statusbar.url.fg = 'white'
# c.colors.statusbar.url.hover.fg = 'aqua'
# c.colors.statusbar.url.success.http.fg = 'white'
# c.colors.statusbar.url.success.https.fg = 'lime'
# c.colors.statusbar.url.warn.fg = 'yellow'
# c.colors.tabs.bar.bg = '#555555'
# c.colors.tabs.even.bg = 'darkgrey'
# c.colors.tabs.even.fg = 'white'
# c.colors.tabs.indicator.error = '#ff0000'
# c.colors.tabs.indicator.start = '#0000aa'
# c.colors.tabs.indicator.stop = '#00aa00'
# c.colors.tabs.indicator.system = 'rgb'
# c.colors.tabs.odd.bg = 'grey'
# c.colors.tabs.odd.fg = 'white'
# c.colors.tabs.pinned.even.bg = 'darkseagreen'
# c.colors.tabs.pinned.even.fg = 'white'
# c.colors.tabs.pinned.odd.bg = 'seagreen'
# c.colors.tabs.pinned.odd.fg = 'white'
# c.colors.tabs.pinned.selected.even.bg = 'black'
# c.colors.tabs.pinned.selected.even.fg = 'white'
# c.colors.tabs.pinned.selected.odd.bg = 'black'
# c.colors.tabs.pinned.selected.odd.fg = 'white'
# c.colors.tabs.selected.even.bg = 'black'
# c.colors.tabs.selected.even.fg = 'white'
# c.colors.tabs.selected.odd.bg = 'black'
# c.colors.tabs.selected.odd.fg = 'white'
#c.colors.webpage.bg = '#93a1a1'

# c.completion.cmd_history_max_items = 100
# c.completion.delay = 0
# c.completion.height = '50%'
# c.completion.min_chars = 1
# c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history']
# c.completion.quick = True
# c.completion.scrollbar.padding = 2
# c.completion.scrollbar.width = 12
# c.completion.show = 'always'
# c.completion.shrink = False
# c.completion.timestamp_format = '%Y-%m-%d'
# c.completion.use_best_match = False
# c.completion.web_history.exclude = []
# c.completion.web_history.max_items = -1

# c.confirm_quit = ['never']


# c.content.cache.appcache = True
# c.content.cache.maximum_pages = 0
# c.content.cache.size = None

# c.content.canvas_reading = True

# c.content.cookies.accept = 'all'
# c.content.cookies.store = True

# c.content.default_encoding = 'iso-8859-1'
# c.content.desktop_capture = 'ask'
# c.content.dns_prefetch = False

# c.content.frame_flattening = False
# c.content.geolocation = 'ask'
# c.content.headers.accept_language = 'en-US,en'
# c.content.headers.custom = {}
# c.content.headers.do_not_track = True
# c.content.headers.referer = 'same-domain'
# c.content.headers.user_agent = None
# c.content.host_blocking.enabled = True
# c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
# c.content.host_blocking.whitelist = []
# c.content.hyperlink_auditing = False

# c.content.javascript.alert = True
# c.content.javascript.can_access_clipboard = False
# c.content.javascript.can_close_tabs = False
# c.content.javascript.can_open_tabs_automatically = False
# c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}
# c.content.javascript.modal_dialog = False
# c.content.javascript.prompt = True

# c.content.local_content_can_access_file_urls = True
# c.content.local_content_can_access_remote_urls = False
# c.content.local_storage = True
# c.content.media_capture = 'ask'
# c.content.mouse_lock = 'ask'

# c.content.mute = False
# c.content.netrc_file = None
# c.content.notifications = 'ask'
# c.content.pdfjs = False
# c.content.persistent_storage = 'ask'
# c.content.plugins = False
# c.content.print_element_backgrounds = True
# c.content.private_browsing = False
# c.content.proxy = 'system'
# c.content.register_protocol_handler = 'ask'
# c.content.ssl_strict = 'ask'
# c.content.user_stylesheets = ['/home/masud/solarized.css']
# c.content.webgl = True
# c.content.webrtc_ip_handling_policy = 'all-interfaces'
# c.content.windowed_fullscreen = False
# c.content.xss_auditing = False

# c.downloads.location.suggestion = 'path'
# c.downloads.open_dispatcher = None
# c.downloads.position = 'top'
# c.downloads.remove_finished = -1
# c.editor.command = ['gvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
# c.editor.encoding = 'utf-8'
# c.fonts.completion.category = 'bold 10pt monospace'
# c.fonts.completion.entry = '10pt monospace'
# c.fonts.downloads = '10pt monospace'
# c.fonts.hints = 'bold 10pt monospace'
# c.fonts.keyhint = '10pt monospace'
# c.fonts.messages.error = '10pt monospace'
# c.fonts.messages.info = '10pt monospace'
# c.fonts.messages.warning = '10pt monospace'
# c.fonts.monospace = '"xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'
# c.fonts.prompts = '10pt sans-serif'
# c.fonts.statusbar = '10pt monospace'
# c.fonts.tabs = '10pt monospace'
# c.fonts.web.family.cursive = ''
# c.fonts.web.family.fantasy = ''
# c.fonts.web.family.fixed = ''
# c.fonts.web.family.sans_serif = 'Noto Sans Bengali Regular'
# c.fonts.web.family.serif = 'Noto Serif Bengali Regular'
# c.fonts.web.family.standard = ''
# c.fonts.web.size.default = 16
# c.fonts.web.size.default_fixed = 13
# c.fonts.web.size.minimum = 0
# c.fonts.web.size.minimum_logical = 6
# c.fonts.default_family = 'Kalpurush'

# c.hints.auto_follow = 'unique-match'
# c.hints.auto_follow_timeout = 0
# c.hints.border = '1px solid #E3BE23'
# c.hints.chars = 'asdfghjkl'
# c.hints.dictionary = '/usr/share/dict/words'
# c.hints.find_implementation = 'python'
# c.hints.hide_unmatched_rapid_hints = True
# c.hints.leave_on_load = True
# c.hints.min_chars = 1
# c.hints.mode = 'letter'
# c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
# c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
# c.hints.scatter = True
# c.hints.selectors = {'all': ['a', 'area', 'textarea', 'select', 'input:not([type="hidden"])', 'button', 'frame', 'iframe', 'img', 'link', 'summary', '[onclick]', '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]', '[ng-click]', '[ngClick]', '[data-ng-click]', '[x-ng-click]', '[tabindex]'], 'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'], 'images': ['img'], 'media': ['audio', 'img', 'video'], 'url': ['[src]', '[href]'], 'inputs': ['input[type="text"]', 'input[type="date"]', 'input[type="datetime-local"]', 'input[type="email"]', 'input[type="month"]', 'input[type="number"]', 'input[type="password"]', 'input[type="search"]', 'input[type="tel"]', 'input[type="time"]', 'input[type="url"]', 'input[type="week"]', 'input:not([type])', 'textarea']}
# c.hints.uppercase = False

# c.history_gap_interval = 30
# c.input.escape_quits_reporter = True
# c.input.forward_unbound_keys = 'auto'
# c.input.insert_mode.auto_leave = True
# c.input.insert_mode.auto_load = False
# c.input.insert_mode.leave_on_load = True
# c.input.insert_mode.plugins = False
# c.input.links_included_in_focus_chain = True
# c.input.partial_timeout = 5000
# c.input.rocker_gestures = False
# c.input.spatial_navigation = False

# c.keyhint.blacklist = []
# c.keyhint.delay = 500
# c.keyhint.radius = 6

# c.messages.timeout = 2000
# c.new_instance_open_target = 'tab'
# c.new_instance_open_target_window = 'last-focused'
# c.prompt.radius = 8



# c.qt.args = []
# c.qt.force_software_rendering = 'none'
# c.qt.force_platform = None
# c.qt.highdpi = False
# c.qt.chromium.low_end_device_mode= 'auto'
# c.qt.process_model = 'process-per-site-instance'

# c.scrolling.bar = 'when-searching'
# c.search.ignore_case = 'smart'
# c.search.incremental = True
# c.session.default_name = None
# c.session.lazy_restore = False

# c.spellcheck.languages = []

# c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
# c.statusbar.position = 'bottom'
# c.statusbar.widgets = ['keypress', 'url', 'scroll', 'history', 'tabs', 'progress']

# c.tabs.background = False
# c.tabs.close_mouse_button = 'middle'
# c.tabs.close_mouse_button_on_bar = 'new-tab'
# c.tabs.favicons.scale = 1.0
# c.tabs.favicons.show = 'always'
# c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
# c.tabs.indicator.width = 3
# c.tabs.last_close = 'ignore'
# c.tabs.max_width = -1
# c.tabs.min_width = -1
# c.tabs.mode_on_change = 'normal'
# c.tabs.mousewheel_switching = True
# c.tabs.new_position.related = 'next'
# c.tabs.new_position.stacking = True
# c.tabs.new_position.unrelated = 'last'
# c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
# c.tabs.pinned.frozen = True
# c.tabs.pinned.shrink = True
# c.tabs.position = 'top'
# c.tabs.select_on_remove = 'next'
# c.tabs.show_switching_delay = 800
# c.tabs.tabs_are_windows = False
# c.tabs.title.alignment = 'left'
# c.tabs.title.format_pinned = '{index}'
# c.tabs.undo_stack_size = 100
# c.tabs.width = '20%'
# c.tabs.wrap = True

# c.url.auto_search = 'naive'
# c.url.default_page = 'https://start.duckduckgo.com/'
# c.url.incdec_segments = ['path', 'query']
# c.url.open_base_url = False
# c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']


# c.zoom.default = '100%'
# c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
# c.zoom.mouse_divider = 512
# c.zoom.text_only = False

## Bindings for normal mode
# config.bind('"', 'enter-mode jump_mark')
# config.bind('+', 'zoom-in')
# config.bind('-', 'zoom-out')
# config.bind('.', 'repeat-command')
# config.bind('/', 'set-cmd-text /')
# config.bind(':', 'set-cmd-text :')
# config.bind(';I', 'hint images tab')
# config.bind(';O', 'hint links fill :open -t -r {hint-url}')
# config.bind(';R', 'hint --rapid links window')
# config.bind(';Y', 'hint links yank-primary')
# config.bind(';b', 'hint all tab-bg')
# config.bind(';d', 'hint links download')
# config.bind(';f', 'hint all tab-fg')
# config.bind(';h', 'hint all hover')
# config.bind(';i', 'hint images')
# config.bind(';o', 'hint links fill :open {hint-url}')
# config.bind(';r', 'hint --rapid links tab-bg')
# config.bind(';t', 'hint inputs')
# config.bind(';y', 'hint links yank')
# config.bind('<Alt-1>', 'tab-focus 1')
# config.bind('<Alt-2>', 'tab-focus 2')
# config.bind('<Alt-3>', 'tab-focus 3')
# config.bind('<Alt-4>', 'tab-focus 4')
# config.bind('<Alt-5>', 'tab-focus 5')
# config.bind('<Alt-6>', 'tab-focus 6')
# config.bind('<Alt-7>', 'tab-focus 7')
# config.bind('<Alt-8>', 'tab-focus 8')
# config.bind('<Alt-9>', 'tab-focus -1')
# config.bind('<Alt-m>', 'tab-mute')
# config.bind('<Ctrl-A>', 'navigate increment')
# config.bind('<Ctrl-Alt-p>', 'print')
# config.bind('<Ctrl-B>', 'scroll-page 0 -1')
# config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-F>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
# config.bind('<Ctrl-PgDown>', 'tab-next')
# config.bind('<Ctrl-PgUp>', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Return>', 'follow-selected -t')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-Tab>', 'nop')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-T>', 'open -t')
# config.bind('<Ctrl-Tab>', 'tab-focus last')
# config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'enter-mode passthrough')
# config.bind('<Ctrl-W>', 'tab-close')
# config.bind('<Ctrl-X>', 'navigate decrement')
# config.bind('<Ctrl-^>', 'tab-focus last')
# config.bind('<Ctrl-h>', 'home')
# config.bind('<Ctrl-p>', 'tab-pin')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
# config.bind('<F11>', 'fullscreen')
# config.bind('<F5>', 'reload')
# config.bind('<Return>', 'follow-selected')
# config.bind('<back>', 'back')
# config.bind('<forward>', 'forward')
# config.bind('=', 'zoom')
# config.bind('?', 'set-cmd-text ?')
# config.bind('@', 'run-macro')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('D', 'tab-close -o')
# config.bind('G', 'scroll-to-perc')
# config.bind('M', 'bookmark-add')
# config.bind('N', 'search-prev')
# config.bind('O', 'set-cmd-text -s :open -t')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('R', 'reload -f')
# config.bind('Sb', 'open qute://bookmarks#bookmarks')
# config.bind('Sh', 'open qute://history')
# config.bind('Sq', 'open qute://bookmarks')
# config.bind('Ss', 'open qute://settings')
# config.bind('T', 'tab-focus')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('[[', 'navigate prev')
# config.bind(']]', 'navigate next')
# config.bind('`', 'enter-mode set_mark')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
# config.bind('cd', 'download-clear')
# config.bind('co', 'tab-only')
# config.bind('d', 'tab-close')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gC', 'tab-clone')
# config.bind('gD', 'tab-give')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gi', 'hint inputs --first')
# config.bind('gl', 'tab-move -')
# config.bind('gm', 'tab-move')
# config.bind('go', 'set-cmd-text :open {url:pretty}')
# config.bind('gr', 'tab-move +')
# config.bind('gu', 'navigate up')
# config.bind('h', 'scroll left')
# config.bind('i', 'enter-mode insert')
# config.bind('j', 'scroll down')
# config.bind('k', 'scroll up')
# config.bind('l', 'scroll right')
# config.bind('n', 'search-next')
# config.bind('o', 'set-cmd-text -s :open')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
# config.bind('q', 'record-macro')
# config.bind('r', 'reload')
# config.bind('sf', 'save')
# config.bind('sk', 'set-cmd-text -s :bind')
# config.bind('sl', 'set-cmd-text -s :set -t')
# config.bind('ss', 'set-cmd-text -s :set')
# config.bind('tIH', 'config-cycle -p -u *://*.{url:host}/* content.images ;; reload')
# config.bind('tIh', 'config-cycle -p -u *://{url:host}/* content.images ;; reload')
# config.bind('tIu', 'config-cycle -p -u {url} content.images ;; reload')
# config.bind('tPH', 'config-cycle -p -u *://*.{url:host}/* content.plugins ;; reload')
# config.bind('tPh', 'config-cycle -p -u *://{url:host}/* content.plugins ;; reload')
# config.bind('tPu', 'config-cycle -p -u {url} content.plugins ;; reload')
# config.bind('tSH', 'config-cycle -p -u *://*.{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tSh', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tSu', 'config-cycle -p -u {url} content.javascript.enabled ;; reload')
# config.bind('th', 'back -t')
# config.bind('tiH', 'config-cycle -p -t -u *://*.{url:host}/* content.images ;; reload')
# config.bind('tih', 'config-cycle -p -t -u *://{url:host}/* content.images ;; reload')
# config.bind('tiu', 'config-cycle -p -t -u {url} content.images ;; reload')
# config.bind('tl', 'forward -t')
# config.bind('tpH', 'config-cycle -p -t -u *://*.{url:host}/* content.plugins ;; reload')
# config.bind('tph', 'config-cycle -p -t -u *://{url:host}/* content.plugins ;; reload')
# config.bind('tpu', 'config-cycle -p -t -u {url} content.plugins ;; reload')
# config.bind('tsH', 'config-cycle -p -t -u *://*.{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tsh', 'config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload')
# config.bind('tsu', 'config-cycle -p -t -u {url} content.javascript.enabled ;; reload')


# config.bind('v', 'enter-mode caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wh', 'back -w')
# config.bind('wi', 'inspector')
# config.bind('wl', 'forward -w')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('yD', 'yank domain -s')
# config.bind('yM', 'yank inline [{title}]({url}) -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('ym', 'yank inline [{title}]({url})')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
# config.bind('o', 'reverse-selection', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-C>', 'completion-item-yank', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
# config.bind('<Ctrl-Return>', 'command-accept --rapid', mode='command')
# config.bind('<Ctrl-Shift-C>', 'completion-item-yank --sel', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'completion-item-focus --history next', mode='command')
# config.bind('<Escape>', 'leave-mode', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'completion-item-focus --history prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'leave-mode', mode='hint')
# config.bind('<Return>', 'follow-hint', mode='hint')

## Bindings for insert mode
# config.bind('<Ctrl-E>', 'open-editor', mode='insert')
# config.bind('<Escape>', 'leave-mode', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Shift-Escape>', 'leave-mode', mode='passthrough')

## Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-P>', 'prompt-open-download --pdfjs', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'leave-mode', mode='register')

## Bindings for yesno mode
# config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='yesno')
# config.bind('<Alt-Y>', 'prompt-yank', mode='yesno')
# config.bind('<Escape>', 'leave-mode', mode='yesno')
# config.bind('<Return>', 'prompt-accept', mode='yesno')
# config.bind('N', 'prompt-accept --save no', mode='yesno')
# config.bind('Y', 'prompt-accept --save yes', mode='yesno')
# config.bind('n', 'prompt-accept no', mode='yesno')
# config.bind('y', 'prompt-accept yes', mode='yesno')


# qutebrowser colors scheme.
# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Grubbox Dark
base00 = "#282828"
base01 = "#3c3836"
base02 = "#504945"
base03 = "#665c54"
base04 = "#bdae93"
base05 = "#d5c4a1"
base06 = "#ebdbb2"
base07 = "#fbf1c7"
base08 = "#fb4934"
base09 = "#fe8019"
base0A = "#fabd2f"
base0B = "#b8bb26"
base0C = "#8ec07c"
base0D = "#83a598"
base0E = "#d3869b"
base0F = "#d65d0e"

# Solarized-light
# base00 = "#fdf6e3"
# base01 = "#eee8d5"
# base02 = "#93a1a1"
# base03 = "#839496"
# base04 = "#657b83"
# base05 = "#586e75"
# base06 = "#073642"
# base07 = "#002b36"
# base08 = "#dc322f"
# base09 = "#cb4b16"
# base0A = "#b58900"
# base0B = "#859900"
# base0C = "#2aa198"
# base0D = "#268bd2"
# base0E = "#6c71c4"
# base0F = "#d33682"

# Solarized-dark
# base00 = "#002b36"
# base01 = "#073642"
# base02 = "#586e75"
# base03 = "#657b83"
# base04 = "#839496"
# base05 = "#93a1a1"
# base06 = "#eee8d5"
# base07 = "#fdf6e3"
# base08 = "#dc322f"
# base09 = "#cb4b16"
# base0A = "#b58900"
# base0B = "#859900"
# base0C = "#2aa198"
# base0D = "#268bd2"
# base0E = "#6c71c4"
# base0F = "#d33682"

# dracula
# base00 = "#282936"
# base01 = "#3a3c4e"
# base02 = "#4d4f68"
# base03 = "#626483"
# base04 = "#62d6e8"
# base05 = "#e9e9f4"
# base06 = "#f1f2f8"
# base07 = "#f7f7fb"
# base08 = "#ea51b2"
# base09 = "#b45bcf"
# base0A = "#00f769"
# base0B = "#ebff87"
# base0C = "#a1efe4"
# base0D = "#62d6e8"
# base0E = "#b45bcf"
# base0F = "#00f769"

# set qutebrowser colors
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base01
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base05
c.colors.completion.item.selected.bg = base02
c.colors.completion.item.selected.border.top = base02
c.colors.completion.item.selected.border.bottom = base02
c.colors.completion.item.selected.match.fg = base0B
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.contextmenu.disabled.bg = base01
c.colors.contextmenu.disabled.fg = base04
c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg =  base05
c.colors.contextmenu.selected.bg = base02
c.colors.contextmenu.selected.fg = base05
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base02
c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0D
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base01
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05
c.colors.statusbar.url.success.http.fg = base0C
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base01
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base0C
c.colors.tabs.pinned.even.fg = base07
c.colors.tabs.pinned.odd.bg = base0B
c.colors.tabs.pinned.odd.fg = base07
c.colors.tabs.pinned.selected.even.bg = base02
c.colors.tabs.pinned.selected.even.fg = base05
c.colors.tabs.pinned.selected.odd.bg = base02
c.colors.tabs.pinned.selected.odd.fg = base05
c.colors.tabs.selected.odd.fg = base05
c.colors.tabs.selected.odd.bg = base02
c.colors.tabs.selected.even.fg = base05
c.colors.tabs.selected.even.bg = base02
c.colors.webpage.bg = base00
