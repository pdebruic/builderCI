| repository version repoUrl filename |
Transcript cr; show: 'travis---->bootstrapGofer.st'.

Smalltalk at: #Gofer ifPresent: [:ignored | ^nil ].

repoUrl := 'http://seaside.gemtalksystems.com/ss/metacello'.
filename := 'Gofer-Core-lr.115'.
repository := (MCCacheRepository default includesVersionNamed: filename )
	ifTrue: [MCCacheRepository default]
	ifFalse: [MCHttpRepository
		location: repoUrl
		user: ''
		password: ''].
MetacelloBuilderTravisCI
  retry: [
    repository
	    versionReaderForFileNamed:  filename, '.mcz'
	    do: [:reader | 
		    version := reader version.
		    version load.
		    version workingCopy repositoryGroup addRepository: repository ]]
