" gorename
command! -nargs=? GoRename call go#rename#Rename(<bang>0,<f-args>)

" guru
command! -nargs=* -complete=customlist,go#package#Complete GoGuruScope call go#guru#Scope(<f-args>)
command! -range=% GoImplements call go#guru#Implements(<count>)
command! -range=% GoCallees call go#guru#Callees(<count>)
command! -range=% GoDescribe call go#guru#Describe(<count>)
command! -range=% GoCallers call go#guru#Callers(<count>)
command! -range=% GoCallstack call go#guru#Callstack(<count>)
command! -range=% GoFreevars call go#guru#Freevars(<count>)
command! -range=% GoChannelPeers call go#guru#ChannelPeers(<count>)
command! -range=% GoReferrers call go#guru#Referrers(<count>)
command! -nargs=? GoGuruTags call go#guru#Tags(<f-args>)

" TODO(arslan): enable this once the function is implemented
" command! -range=% GoSameIds call go#guru#SameIds(<count>)

" tool
command! -nargs=0 GoFiles echo go#tool#Files()
command! -nargs=0 GoDeps echo go#tool#Deps()
command! -nargs=* GoInfo call go#complete#Info(0)

" cmd
command! -nargs=* -bang GoBuild call go#cmd#Build(<bang>0,<f-args>)
command! -nargs=* -bang GoGenerate call go#cmd#Generate(<bang>0,<f-args>)
command! -nargs=* -bang -complete=file GoRun call go#cmd#Run(<bang>0,<f-args>)
command! -nargs=* -bang GoInstall call go#cmd#Install(<bang>0, <f-args>)
command! -nargs=* -bang GoTest call go#cmd#Test(<bang>0, 0, <f-args>)
command! -nargs=* -bang GoTestFunc call go#cmd#TestFunc(<bang>0, <f-args>)
command! -nargs=* -bang GoTestCompile call go#cmd#Test(<bang>0, 1, <f-args>)

" -- cover
command! -nargs=* -bang GoCoverage call go#coverage#Buffer(<bang>0, <f-args>)
command! -nargs=* -bang GoCoverageBrowser call go#coverage#Browser(<bang>0, <f-args>)

" -- play
command! -nargs=0 -range=% GoPlay call go#play#Share(<count>, <line1>, <line2>)

" -- def
command! -nargs=* -range GoDef :call go#def#Jump('')

" -- doc
command! -nargs=* -range -complete=customlist,go#package#Complete GoDoc call go#doc#Open('new', 'split', <f-args>)
command! -nargs=* -range -complete=customlist,go#package#Complete GoDocBrowser call go#doc#OpenBrowser(<f-args>)

" -- fmt
command! -nargs=0 GoFmt call go#fmt#Format(-1)
command! -nargs=0 GoImports call go#fmt#Format(1)

" -- import
command! -nargs=? -complete=customlist,go#package#Complete GoDrop call go#import#SwitchImport(0, '', <f-args>, '')
command! -nargs=1 -bang -complete=customlist,go#package#Complete GoImport call go#import#SwitchImport(1, '', <f-args>, '<bang>')
command! -nargs=* -bang -complete=customlist,go#package#Complete GoImportAs call go#import#SwitchImport(1, <f-args>, '<bang>')

" -- linters
command! -nargs=* GoMetaLinter call go#lint#Gometa(0, <f-args>)
command! -nargs=* GoLint call go#lint#Golint(<f-args>)
command! -nargs=* -bang GoVet call go#lint#Vet(<bang>0, <f-args>)
command! -nargs=* -complete=customlist,go#package#Complete GoErrCheck call go#lint#Errcheck(<f-args>)

" -- alternate
command! -bang GoAlternate call go#alternate#Switch(<bang>0, '')

" -- ctrlp
if globpath(&rtp, 'plugin/ctrlp.vim') != ""
  command! -nargs=? -complete=file GoDecls call ctrlp#init(ctrlp#decls#cmd(0, <q-args>))
  command! -nargs=? -complete=dir GoDeclsDir call ctrlp#init(ctrlp#decls#cmd(1, <q-args>))
endif

" vim:ts=4:sw=4:et
