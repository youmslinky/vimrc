#this is a powershell script that sets up neovim configuration files (and vim-plug)

#install vim-plug
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)

#create hardlinks to config files where neovim expects them, from this git repository
New-Item -Path ~\AppData\Local\nvim\vimrc -ItemType HardLink -Value vimrc
New-Item -Path ~\AppData\Local\nvim\init.vim -ItemType HardLink -Value init.vim
