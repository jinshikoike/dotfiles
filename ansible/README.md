## create some variables
### group_vars/secrets.yml
- ansible_become_pass: xxxx
- http_proxy: xxxx
- https_proxy: xxxx
- gtlab_host: xxxxx
- cld:
  - hostname: xxx.xxxx.xxx.xx
  - port: 22
  - user: aa
  - identity_file: ~/.ssh/bb
  - proxy_command_path: bbbbbbbbbbbbb
- l1g:
  - hostname: xxx.xxxx.xxx.xx
  - port: 22
  - user: aa
  - identity_file: ~/.ssh/aa
  - proxy_command_path: bbbbbbbbbbbbb

## install packages by package manager which is dependent on OS distribution.
packages:
    - git
    - gcc
    - wget
    - curl
    - tmux
    - docker
    - libreadline-dev

go_packages:
    - golang.org/x/tools/cmd/goimports
    - golang.org/x/tools/cmd/godoc
    - golang.org/x/tools/cmd/cover
    - github.com/nsf/gocode
    - github.com/golang/lint/golint
