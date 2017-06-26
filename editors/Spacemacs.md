# Spacemacs
*The amazing combination of vim and emacs.*

Basic rule: Don't change the default configuration too much. It is an amazing default.

## go-lang Installation
Use the [Go Version Manager](https://github.com/moovweb/gvm).

## Emacs Installation
### macOS
```bash
brew cask install emacs
```

### Debian
```bash
sudo apt-get install emacs
```

### Spacemacs Installation
```bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

## Configuration
### go-lang
Open emacs and press `SPC-f-e-d` to open the equivalent of `./bashrc`.

Add `go` to `dotspacemacs-configuration-layers` and follow these [instructions](http://spacemacs.org/layers/+lang/go/README.html).

```bash
dotspacemacs-configuration-layers
   '(
     ruby
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     spell-checking
     syntax-checking
     version-control
     rust
     go
     javascript
     latex
     bibtex
     shell
     yaml
     vagrant
     pdf-tools
     csv

     (shell :variables
            shell-default-term-shell "/usr/local/bin/zsh"
     )
     (go :variables go-use-gometalinter t)
     (latex :variables latex-enable-auto-fill t)
   )
```
