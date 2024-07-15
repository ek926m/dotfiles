### vscode extensions
- azemoh.one-monokai
- castwide.solargraph
- eamodio.gitlens
- github.copilot
- github.copilot-chat
- jdinhlife.gruvbox
- miguelsolorio.min-theme
- octref.vetur
- vscode-icons-team.vscode-icons
  
### vscode user settings.json
    {
        "editor.wordWrap": "on",
        "security.workspace.trust.untrustedFiles": "open",
        "workbench.iconTheme": "vscode-icons",
        "markdown.preview.fontSize": 12,
        "scm.inputFontSize": 12,
        "workbench.startupEditor": "none",
        "workbench.activityBar.location": "top",
        "workbench.colorTheme": "One Monokai"
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
