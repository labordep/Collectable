Class {
	#name : #CollectablePricesStatView,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'CollectableViewType + CollectableViewServices + CollectableCollectionsManagerEvents + MolClusteredComponent',
	#classTraits : 'CollectableViewType classTrait + CollectableViewServices classTrait + CollectableCollectionsManagerEvents classTrait + MolClusteredComponent classTrait',
	#instVars : [
		'view',
		'space',
		'collection'
	],
	#category : #'Collectable-UI'
}

{ #category : #'pyramid-serialized-bloc' }
CollectablePricesStatView class >> pyView [
	"This class has been generated using Pyramid.

	By: labordep
	2023-11-04 16:28:52"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 50.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutMatchParentResizer { }
					},
					#constraints : {
						Class [ #BlFlowLayout ] : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : BlTopAlignment { }
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : BlHorizontalStartAlignment { }
							},
							#newLine : false,
							#weight : 0,
							#display : BlFlowLayoutInline { }
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @13,
					#previouslyAccessedConstraintsType : @12,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.4604105571847507,
								#green : 0.2541544477028348,
								#blue : 0.9745845552297165,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #topBar
					}
				},
				#layout : BlFlowLayout {
					#measurer : BlFlowLayoutMeasurer {
						#layout : @28,
						#children : OrderedCollection [ ],
						#lines : OrderedCollection [
							BlFlowLayoutLine {
								#children : OrderedCollection [ ],
								#startLength : 0,
								#startBreadth : 0,
								#length : 0,
								#breadth : 0,
								#measurer : @29
							}
						],
						#orientation : BlFlowLayoutVertical { },
						#maxWidth : 800.0,
						#maxHeight : 50.0,
						#widthMode : BlMeasurementSpec {
							#size : 800.0,
							#mode : BlMeasurementExactMode { }
						},
						#heightMode : BlMeasurementSpec {
							#size : 50.0,
							#mode : @36
						},
						#checkCanFit : true
					},
					#orientation : BlLayoutVertical { },
					#horizontalAlignment : BlHorizontalStartAlignment { },
					#verticalAlignment : BlTopAlignment { }
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @10
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @10
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @20,
			#padding : @20,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @21,
			#maxWidth : @21,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.6471163245356794,
						#green : 0.6432062561094819,
						#blue : 0.6432062561094819,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #pane
			}
		},
		#layout : BlFlowLayout {
			#measurer : BlFlowLayoutMeasurer {
				#layout : @51,
				#children : OrderedCollection [
					BlFlowLayoutInlineChild {
						#width : 800.0,
						#height : 50.0,
						#margin : @20,
						#weight : 0,
						#newLine : false,
						#startLength : 0,
						#startBreadth : 0,
						#element : @4,
						#alignment : BlCompositeAlignment {
							#vertical : @15,
							#horizontal : @17,
							#direction : BlLayoutLeftToRight { }
						},
						#measurer : @52,
						#display : @18
					}
				],
				#lines : OrderedCollection [
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@54
						],
						#startLength : 0,
						#startBreadth : 0,
						#length : 800.0,
						#breadth : 50.0,
						#measurer : @52
					}
				],
				#orientation : BlFlowLayoutHorizontal { },
				#maxWidth : 800.0,
				#maxHeight : 600.0,
				#widthMode : BlMeasurementSpec {
					#size : 800.0,
					#mode : @36
				},
				#heightMode : BlMeasurementSpec {
					#size : 600.0,
					#mode : @36
				},
				#checkCanFit : true
			},
			#orientation : BlLayoutHorizontal { },
			#horizontalAlignment : @17,
			#verticalAlignment : @15
		}
	}
]'
]

{ #category : #ui }
CollectablePricesStatView >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : #events }
CollectablePricesStatView >> collectionsHasChanged: aCollectionList [

	"do nothing"
]

{ #category : #initialization }
CollectablePricesStatView >> componentActivate [

	super componentActivate.
	
	self forServices: CollectableCollectionsManagerServices useProvider: self clusterName. 
	self forEvents: CollectableCollectionsManagerEvents useProducer: self clusterName. 
	
	self getCollectableCollectionsManagerEventsSubscriber subscribe: self.
]

{ #category : #initialization }
CollectablePricesStatView >> componentInitialize [ 

	super componentInitialize.
	
	self initializeView.
]

{ #category : #initialization }
CollectablePricesStatView >> componentPassivate [
	
	self getCollectableCollectionsManagerEventsSubscriber unsubscribe: self.
	self closeSpace.
	
	super componentPassivate.
	
	
]

{ #category : #initialization }
CollectablePricesStatView >> componentRemove [ 

	super componentRemove.
]

{ #category : #ui }
CollectablePricesStatView >> createBarChart [

	"graph : evolution of nb of games each month"
	| firstDate lastDate c x y p nbMonth dates currentDate |
	firstDate := collection lessRecentDateAddedCollectible dateAdded.
	currentDate := Date today addMonths: 1.
	lastDate := firstDate. 
	nbMonth := 0.
	dates := OrderedCollection new.
	y := OrderedCollection new.
	
	"Get nb of months to display"
	[ lastDate < currentDate ] whileTrue:[ | pricePaid |
		"Get nb of game of this month"
		pricePaid := 0.
		collection collectibles select:[ :e | e dateAdded month = lastDate month ] thenDo: [ :e | pricePaid := pricePaid + e pricePaid ].
		dates add: lastDate copy.
		y add: pricePaid.
		lastDate := lastDate onNextMonth.
		nbMonth := nbMonth + 1.
	]. 
	
	x := 1 to: dates size.
	c := RSCompositeChart new.
	c extent: 800@600.
	
	p := RSBarPlot new x: (x) y: (y).
	p barSize: 6.
	p barOffset: 3.
	c add: p.
	
	"Legend format"
	c ylabel: 'Price paid'.
	c xlabel: 'Time'.
	c horizontalTick 
		labelConversion: [ :v | v = 0 ifFalse:[(dates at: v) month printString] ifTrue:[''] ];
		numberOfTicks: nbMonth;
		useVerticalLabel.
	
	c build.
	^ c canvas
]

{ #category : #'component accessing' }
CollectablePricesStatView >> getCollectableCollectionsManagerEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := CollectableCollectionsManagerEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: CollectableCollectionsManagerEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #'component accessing' }
CollectablePricesStatView >> getCollectableCollectionsManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectableCollectionsManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectableCollectionsManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #'component accessing' }
CollectablePricesStatView >> getCollectableViewEventsNotifier [
	^self eventsNotifiers at: CollectableViewEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: CollectableViewEvents name: nil].
]

{ #category : #services }
CollectablePricesStatView >> getView [

	^ view
]

{ #category : #initialization }
CollectablePricesStatView >> initializeView [
	
	view := self class pyView materializeAsBlElement first.
]

{ #category : #services }
CollectablePricesStatView >> openInWindow [

	self openSpace
]

{ #category : #actions }
CollectablePricesStatView >> openListAction [

	| app |
	app := CollectableApp start: (MolUtils randomizeComponentName).
	app populateCollectibleListWith: collection collectibles.
]

{ #category : #services }
CollectablePricesStatView >> openSpace [	

	view ifNil:[  ^ self ].
	space ifNotNil:[ ^ self ].
	space := view openInSpace.
	
	"setup space properties"
	self updateTitle.
	space position: 100 @ 100.

	"initialize event handlers"
	space when: BlSpaceClosedEvent do:[ :e | self receiveBlSpaceClosedEvent: e ].
	^ space 
]

{ #category : #events }
CollectablePricesStatView >> receiveBlSpaceClosedEvent: anEvent [ 

	"The closed event can be send after that the component is stop, because it can be have a ghost window, we need to cheeck if the component is really stopped or not"
	
	(MolUtils isInstanciateComponentOf: self class named: self componentName) ifTrue:[
		self class stop: self componentName
	].
]

{ #category : #'incubator -- services' }
CollectablePricesStatView >> setCollection: aCollection [

	collection := aCollection.
	self updateView.
]

{ #category : #ui }
CollectablePricesStatView >> updateTitle [

	| title |
	
	title := CollectableApp windowTitleHead.
	collection ifNotNil:[ title := title, ' - Price paid each month for ' , collection numberOfCollectibles asString, ' collectibles' ].

	space title: title.
]

{ #category : #ui }
CollectablePricesStatView >> updateView [

	| roassalCanvas graphElement |
	collection ifNil:[ ^ self ].
	collection isEmpty ifTrue:[ ^ self ].
	
	roassalCanvas := self createBarChart.
	roassalCanvas extent: 800@600.
	
	graphElement := BlElement id: #roassalCanvas.
	graphElement size: roassalCanvas extent.
	graphElement background: roassalCanvas asForm asBlBackground.
	view addChild: graphElement.
]
