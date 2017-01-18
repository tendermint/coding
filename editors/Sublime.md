# Sublime

Sublime is a nice, cross-platform text editor that sometimes can act a bit like an IDE.  Here are some tricks learned while configuring it for effective go programming. Do you have any more?

## GoSublime and SublimeLinter

  * [GoSublime](https://github.com/DisposaBoy/GoSublime)
  * [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter3)

Yes, please install these! And then please read the [usage instructions](https://github.com/DisposaBoy/GoSublime/blob/master/USAGE.md).  It may take a few hours to get everything working as you wish it would, and a few months to learn all the features, but it is worth it.

Make sure to go to Preferences > Package Settings > GoSublime > Settings - User and create your custom file.  Here is an example:

```
{
  "env": {
    "GOPATH": "$HOME/go",
    "PATH": "$HOME/go/bin:$PATH"
  },
  "fmt_cmd": ["goimports"],
  "comp_lint_enabled": true,
  "comp_lint_commands": [
    {"cmd": ["golint *.go"], "shell": true},
    {"cmd": ["gotype *.go"], "shell": true},
    {"cmd": ["go vet"]},
  ],
  "on_save": [
    {"cmd": "gs_comp_lint"},
  ]
}
```

## GoRename

  * [GoRename](https://github.com/alvarolm/GoRename)

I find the UX a bit annoying, like a click or two more than it should be, but it definitely saves time when you want to change a function/variable name and it should be updated everywhere it is used, in different packages even.

In the end, this is just a wrapper around calling `gorename`


