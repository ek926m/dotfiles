### vscode extensions
    $ code --list-extensions | xargs -L 1 echo code --install-extension
    
    $ code --install-extension amiralizadeh9480.laravel-extra-intellisense
    $ code --install-extension codingyu.laravel-goto-view
    $ code --install-extension danields761.dracula-theme-from-intellij-pythoned
    $ code --install-extension EditorConfig.EditorConfig
    $ code --install-extension GitHub.copilot
    $ code --install-extension GitHub.copilot-chat
    $ code --install-extension glitchbl.laravel-create-view
    $ code --install-extension IHunte.laravel-blade-wrapper
    $ code --install-extension magicstack.MagicPython
    $ code --install-extension miguelsolorio.min-theme
    $ code --install-extension mikestead.dotenv
    $ code --install-extension ms-azuretools.vscode-docker
    $ code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
    $ code --install-extension naoray.laravel-goto-components
    $ code --install-extension octref.vetur
    $ code --install-extension onecentlin.laravel-blade
    $ code --install-extension onecentlin.laravel-extension-pack
    $ code --install-extension onecentlin.laravel5-snippets
    $ code --install-extension pgl.laravel-jump-controller
    $ code --install-extension redhat.vscode-yaml
    $ code --install-extension ryannaddy.laravel-artisan
    $ code --install-extension shufo.vscode-blade-formatter
    $ code --install-extension vscode-icons-team.vscode-icons
  
### vscode user settings.json
    {
        "editor.wordWrap": "on",
        "security.workspace.trust.untrustedFiles": "open",
        "ruby.intellisense": "rubyLocate",
        "editor.fontSize": 13,
        "workbench.activityBar.visible": false,
        "workbench.iconTheme": "vscode-icons",
        "workbench.colorTheme": "Min Light"
    }

### vscode mac user keybindings.json
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "shift+cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.new"
        },
        {
            "key": "cmd+1",
            "command": "workbench.action.openEditorAtIndex1"
        },
        {
            "key": "cmd+2",
            "command": "workbench.action.openEditorAtIndex2"
        },
        {
            "key": "cmd+3",
            "command": "workbench.action.openEditorAtIndex3"
        },
        {
            "key": "cmd+4",
            "command": "workbench.action.openEditorAtIndex4"
        },
        {
            "key": "cmd+5",
            "command": "workbench.action.openEditorAtIndex5"
        },
        {
            "key": "cmd+6",
            "command": "workbench.action.openEditorAtIndex6"
        },
        {
            "key": "cmd+7",
            "command": "workbench.action.openEditorAtIndex7"
        },
        {
            "key": "cmd+8",
            "command": "workbench.action.openEditorAtIndex8"
        },
        {
            "key": "cmd+9",
            "command": "workbench.action.openEditorAtIndex9"
        },
        {
            "key": "cmd+0",
            "command": "workbench.action.zoomReset"
        },
        {
            "key": "cmd+numpad0",
            "command": "-workbench.action.zoomReset"
        },
        {
            "key": "cmd+g",
            "command": "-editor.action.nextMatchFindAction",
            "when": "editorFocus"
        },
        {
            "key": "shift+cmd+g",
            "command": "-editor.action.previousMatchFindAction",
            "when": "editorFocus"
        },
        {
            "key": "shift+cmd+g",
            "command": "-workbench.action.terminal.findPrevious",
            "when": "terminalFindFocused && terminalHasBeenCreated || terminalFindFocused && terminalProcessSupported || terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
        },
        {
            "key": "shift+cmd+g",
            "command": "workbench.view.scm",
            "when": "workbench.scm.active"
        },
        {
            "key": "ctrl+shift+g",
            "command": "-workbench.view.scm",
            "when": "workbench.scm.active"
        }
    ]
