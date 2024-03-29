Extension { #name : #CompiledMethod }

{ #category : #'*GtStartup' }
CompiledMethod >> nodeForExpression: aString [
	| astToFind nodeFound |
	astToFind := RBParser parseRewriteExpression: aString.
	nodeFound := nil.
	self ast
		nodesDo: [ :each | 
			astToFind = each
				ifTrue: [ nodeFound := each.
					^ nodeFound ] ].
	^ nodeFound
]
