Class {
	#name : 'CollectableAppImpl',
	#superclass : 'MolAbstractComponentImpl',
	#traits : 'CollectableApp + CollectableCollectionsManagerEvents',
	#classTraits : 'CollectableApp classTrait + CollectableCollectionsManagerEvents classTrait',
	#instVars : [
		'mainPane',
		'space',
		'collectibleList',
		'searchField',
		'statsPane'
	],
	#category : 'Collectable-Core',
	#package : 'Collectable',
	#tag : 'Core'
}

{ #category : 'pyramid-serialized-bloc' }
CollectableAppImpl class >> mainPane [
	"This class has been generated using Pyramid.

	By: labordep
	2024-03-16 18:30:31"

	<pySTON>
	^ '[
	ToPane {
		#children : BlChildrenArray [
			ToPane {
				#children : BlChildrenArray [
					ToMenuBar {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutMatchParentResizer { }
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @9
							},
							#constraints : {
								Class [ #BlLinearLayout ] : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : BlTopAlignment { }
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : BlHorizontalStartAlignment { }
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : BlInsets {
								#top : 4.0,
								#left : 4.0,
								#bottom : 4.0,
								#right : 4.0
							},
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
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.0
									}
								}
							}
						},
						#userData : IdentityDictionary {
							#enabled : true,
							#elementId : BlElementNamedId {
								#identifier : #menuBar
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : BlNullVerticalAlignment { },
							#horizontalAlignment : BlNullHorizontalAlignment { },
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @28
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 5.0,
							#interspace : 0.0
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 50.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @9
					},
					#constraints : {
						Class [ #BlFlowLayout ] : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @15
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @17
							},
							#newLine : false,
							#weight : 0,
							#display : BlFlowLayoutInline { }
						},
						@12 : BlLinearLayoutConstraints {
							#vertical : BlLinearLayoutConstraintsVertical {
								#alignment : @15
							},
							#horizontal : BlLinearLayoutConstraintsHorizontal {
								#alignment : @17
							},
							#weight : 1
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @19,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @38,
					#previouslyAccessedConstraintsType : @37,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.7956989247311828,
								#green : 0.0,
								#blue : 1.0,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#enabled : true,
					#elementId : BlElementNamedId {
						#identifier : #menu
					}
				},
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : @29,
					#horizontalAlignment : @30,
					#orientation : BlLinearLayoutHorizontalOrientation {
						#layout : @52
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 0.0,
					#interspace : 0.0
				}
			},
			ToLabel {
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutFitContentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @57
					},
					#constraints : {
						@37 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @15
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @17
							},
							#newLine : false,
							#weight : 0,
							#display : @41
						},
						@12 : BlLinearLayoutConstraints {
							#vertical : BlLinearLayoutConstraintsVertical {
								#alignment : @15
							},
							#horizontal : BlLinearLayoutConstraintsHorizontal {
								#alignment : @17
							},
							#weight : 1
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @19,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @60,
					#previouslyAccessedConstraintsType : @37,
					#accountTransformation : false
				},
				#visuals : BlDefaultVisuals { },
				#userData : IdentityDictionary {
					#enabled : true,
					#elementId : BlElementNamedId {
						#identifier : #title
					},
					#stonToLabelText : BlRopedText {
						#rope : BlAttributeRope {
							#attributes : [
								BlFontWeightAttribute {
									#isOverwritableByStyler : true,
									#weight : 600
								},
								BlFontFamilyDefaultAttribute {
									#isOverwritableByStyler : true,
									#name : ''SFMono-Regular''
								},
								BlFontSizeDefaultAttribute {
									#isOverwritableByStyler : true,
									#size : 14
								},
								AlbTextParagraphLineSpacingAttribute {
									#isOverwritableByStyler : true,
									#lineSpacing : 1.5
								},
								BlTextForegroundAttribute {
									#isOverwritableByStyler : true,
									#paint : Color [ #black ]
								}
							],
							#rope : BlCollectionRope {
								#collection : ''Collectibles''
							}
						}
					}
				},
				#layout : BlFrameLayout { }
			},
			ToListElement {
				#children : BlChildrenArray [
					ToObservableCollectionInfiniteElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @9
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @9
							},
							#constraints : {
								Class [ #BlFrameLayout ] : BlFrameLayoutConstraints {
									#vertical : BlFrameLayoutConstraintsVertical {
										#alignment : @15,
										#weight : 1.0
									},
									#horizontal : BlFrameLayoutConstraintsHorizontal {
										#alignment : @17,
										#weight : 1.0
									}
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @19,
							#padding : @19,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @21,
							#maxWidth : @21,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @90,
							#previouslyAccessedConstraintsType : @89,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#elevation : BlRelativeElevation {
								#elevation : 10
							}
						},
						#userData : IdentityDictionary { },
						#layout : BlInfiniteLinearLayout {
							#infiniteElement : @83,
							#horizontalChildFinder : BlInfiniteHorizontalChildBoundsBasedFinder {
								#layout : @97
							},
							#verticalChildFinder : BlInfiniteVerticalChildBoundsBasedFinder {
								#layout : @97
							},
							#width : 788.0,
							#height : 588.0,
							#heightSpec : BlMeasurementSpec {
								#size : 588.0,
								#mode : BlMeasurementExactMode { }
							},
							#widthSpec : BlMeasurementSpec {
								#size : 788.0,
								#mode : @101
							},
							#autoMeasure : true,
							#itemPrefetchEnabled : false,
							#measurementCacheEnabled : true,
							#announcer : Announcer {
								#registry : SubscriptionRegistry {
									#subscriptions : IdentitySet [ ],
									#monitor : Semaphore [ ]
								}
							},
							#lastExactSize : Point [ 788.0, 588.0 ],
							#layoutState : BlInfiniteLinearLayoutState {
								#allowRecycling : false,
								#availableSpace : 0.0,
								#extraSpace : 588.0,
								#currentPosition : 0,
								#lastScrolledDelta : 0,
								#isPreLayout : false,
								#itemDirection : BlInfiniteLinearLayoutItemDirectionHead { },
								#scrollingOffset : Float [ #negativeInfinity ],
								#isInfinite : false,
								#layoutDirection : BlInfiniteLinearLayoutDirectionStart { },
								#offset : 0.0,
								#scrolledWhileFilling : false
							},
							#orientation : BlInfiniteVerticalOrientation {
								#lastTotalSpace : 588.0,
								#layout : @97
							},
							#lastStackFromEnd : false,
							#reverseLayout : false,
							#shouldReverseLayout : false,
							#stackFromEnd : false,
							#smoothScrollbarEnabled : true,
							#pendingScrollPosition : 0,
							#pendingScrollPositionOffset : @110,
							#anchorInfo : BlInfiniteLinearLayoutAnchorInfo {
								#position : 0,
								#coordinate : @110,
								#layoutFromEnd : false,
								#valid : false
							}
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @9
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @9
					},
					#constraints : {
						@37 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @15
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @17
							},
							#newLine : false,
							#weight : 0,
							#display : @41
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : BlInsets {
						#top : 6.0,
						#left : 6.0,
						#bottom : 6.0,
						#right : 6.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @118,
					#previouslyAccessedConstraintsType : @37,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlRoundedRectangleGeometry {
						#extent : Point [ 800.0, 600.0 ],
						#pathCache : BlPathCache {
							#geometry : @124,
							#strokedBounds : BlBounds {
								#left : 0.0,
								#top : 0.0,
								#right : 800.0,
								#bottom : 600.0
							}
						},
						#cornerRadii : BlCornerRadii {
							#topLeft : 6,
							#topRight : 6,
							#bottomLeft : 6,
							#bottomRight : 6
						},
						#center : Point [ 400.0, 300.0 ]
					},
					#border : BlBorder {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.08602150537634409,
								#green : 0.4662756598240469,
								#blue : 1.0,
								#alpha : 1.0
							}
						},
						#width : 1.0,
						#style : BlStrokeStyle {
							#lineCap : BlStrokeLineButtCap { },
							#lineJoin : BlStrokeLineMiterJoin { },
							#miterLimit : 4.0,
							#dashArray : [ ],
							#dashOffset : 0.0
						},
						#opacity : 1.0
					},
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color [ #white ]
						}
					},
					#focused : true
				},
				#userData : IdentityDictionary {
					#enabled : true,
					#elementId : BlElementNamedId {
						#identifier : #collectibleList
					}
				},
				#layout : BlFrameLayout { }
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @9
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @9
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @19,
			#padding : @19,
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
					#color : Color [ #white ]
				}
			}
		},
		#userData : IdentityDictionary {
			#enabled : true,
			#elementId : BlElementNamedId {
				#identifier : #mainPane
			}
		},
		#layout : BlFlowLayout {
			#measurer : BlFlowLayoutMeasurer {
				#layout : @153,
				#children : OrderedCollection [
					BlFlowLayoutInlineChild {
						#width : 800.0,
						#height : 50.0,
						#margin : @19,
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
						#measurer : @154,
						#display : @41
					},
					BlFlowLayoutInlineChild {
						#width : 68.34800000000001,
						#height : 17.598,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 0,
						#startBreadth : 0,
						#element : @54,
						#alignment : BlCompositeAlignment {
							#vertical : @15,
							#horizontal : @17,
							#direction : @158
						},
						#measurer : @154,
						#display : @41
					},
					BlFlowLayoutInlineChild {
						#width : 800.0,
						#height : 600.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 0,
						#startBreadth : 0,
						#element : @81,
						#alignment : BlCompositeAlignment {
							#vertical : @15,
							#horizontal : @17,
							#direction : @158
						},
						#measurer : @154,
						#display : @41
					}
				],
				#lines : OrderedCollection [
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@156
						],
						#startLength : 0,
						#startBreadth : 0,
						#length : 800.0,
						#breadth : 50.0,
						#measurer : @154
					},
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@159
						],
						#startLength : 0,
						#startBreadth : 50.0,
						#length : 68.34800000000001,
						#breadth : 17.598,
						#measurer : @154,
						#index : 2
					},
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@161
						],
						#startLength : 0,
						#startBreadth : 67.598,
						#length : 800.0,
						#breadth : 600.0,
						#measurer : @154,
						#index : 3
					}
				],
				#orientation : BlFlowLayoutHorizontal { },
				#maxWidth : 800.0,
				#maxHeight : 600.0,
				#widthMode : BlMeasurementSpec {
					#size : 800.0,
					#mode : @101
				},
				#heightMode : BlMeasurementSpec {
					#size : 600.0,
					#mode : @101
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

{ #category : 'ui' }
CollectableAppImpl class >> windowTitleHead [

	^ '[|||] Collectable (alpha version)'.
]

{ #category : 'private' }
CollectableAppImpl >> buildList [
	| list |

	list := ToListElement new nodeBuilder: [ :node :dataItem |
		self buildListNode: node dataItem: dataItem.
	].

	list withRowNumbers.
	^ list
]

{ #category : 'private' }
CollectableAppImpl >> buildListNode: node dataItem: aDataItem [

	| collectible typePane typeLabel platformPane contentPane title country platform secondPane statePane stateLabel |
	collectible := aDataItem.
	node layout: BlFlowLayout horizontal.
	node
		height: 50;
		constraintsDo: [ :c | c horizontal matchParent  ].

	typePane := ToPane new
		            id: #typePanel;
		            beVertical;
		            background: (Color fromHexString: 'D1C4E9C8');
		            width: 25;
		            vMatchParent.
	node addChild: typePane.

	platformPane := ToPane new
		                id: #platformPanel;
		                beVertical;
		                background:
			                ((CollectableVideoGamesUIUtils getPlatformColor: collectible platform)
				                 alpha: 0.75);
		                width: 200;
		                vMatchParent.
	node addChild: platformPane.

	statePane := ToPane new
		             id: #statePanel;
		             beVertical;
		             background: (Color fromHexString: 'D1C4E9C8');
		             width: 25;
		             vMatchParent.
	node addChild: statePane.

	title := ToLabel new
		         id: #title;
		         text: (collectible name asRopedText
				          foreground: (Color fromHexString: '673AB7');
				          fontSize: 24;
				          bold);
		         margin: (BlInsets all: 1);
		         padding: (BlInsets all: 1);
		         yourself.
	node addChild: title.

	contentPane := ToPane new
		               id: #contentPane;
		               beVertical;
		               background: (Color fromHexString: 'D1C4E9C8');
		               vMatchParent;
		               hFitContent.
	node addChild: contentPane.

	typeLabel := ToLabel new
		             id: #typeLabel;
		             text: (collectible typeString asRopedText fontSize: 10).
	typeLabel transformDo: [ :t |
		t normalizedOrigin: 0 @ 1.
		t rotateBy: 90 ].
	typePane addChild: typeLabel.

	platform := ToLabel new
		            id: #platform;
		            text: ((collectible platform name) asUppercase asRopedText
				             foreground: Color white;
				             fontSize: 20);
		            padding: (BlInsets all: 1);
		            yourself.
	platformPane addChild: platform.

	stateLabel := ToLabel new
		              id: #stateLabel;
		              text:
			              (collectible completion completionString asRopedText
				               fontSize: 15).
	stateLabel transformDo: [ :t |
		t normalizedOrigin: 0 @ 1.
		t rotateBy: 90 ].
	statePane addChild: stateLabel.

	country := ToLabel new
		           id: #country;
		           text: (collectible country asRopedText
				            foreground: Color black;
				            fontSize: 10);
		           margin: (BlInsets all: 1);
		           padding: (BlInsets all: 1);
		           yourself.
	contentPane addChild: country.

	collectible isVideoGame ifTrue: [
		| developer publisher |
		developer := ToLabel new
			             id: #developer;
			             text: (collectible developer asRopedText
					              foreground: Color black;
					              fontSize: 10);
			             margin: (BlInsets all: 1);
			             padding: (BlInsets all: 1);
			             yourself.
		contentPane addChild: developer.

		collectible developer ~= collectible publisher ifTrue: [
			publisher := ToLabel new
				             id: #publisher;
				             text: (collectible publisher asRopedText
						              foreground: Color black;
						              fontSize: 10);
				             margin: (BlInsets all: 1);
				             padding: (BlInsets all: 1);
				             yourself.
			contentPane addChild: publisher ] ].

	secondPane := ToPane new
		              id: #datePane;
		              beVertical;
		              background: (Color fromHexString: 'D1C4E9C8');
		              vMatchParent;
		              hFitContent.
	secondPane addChild: (ToLabel new
			 id: #dateAdded;
			 text: (('Added ' , collectible dateAdded asString) asRopedText
					  foreground: Color brown;
					  fontSize: 12);
			 margin: (BlInsets all: 1);
			 padding: (BlInsets all: 1);
			 yourself).
	node addChild: secondPane
]

{ #category : 'private' }
CollectableAppImpl >> buildMenu [

	| fileMenu loadCollectionMenu menuBar debugMenu openOnPyramid queryMenu searchNoCountryCollectibles orderMenu orderByAlphaIncrease orderByAlphaDecrease orderByAddedDateIncrease orderByAddedDateDecrease searchCollectibles fullsetMenu queryN64Menu queryWiiUMenu |
	menuBar := (ToMenuPane id: #menuBar) hFitContent.

	"File menu"
	fileMenu := ToMenu new.
	fileMenu id: #menu.
	fileMenu layout cellSpacing: 5.
	fileMenu label: (ToLabel new text: 'File').
	fileMenu icon: (ToImage new innerImage: (self iconNamed: #solidMenu)).
	menuBar addItem: fileMenu.

	"Stats"
	fileMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Prices stats');
			 icon: (ToImage new innerImage: (self iconNamed: #remote));
			 clickAction: [
					 | list collections |
					 list := OrderedCollection new.
					 collections := self
						                getCollectableCollectionsManagerServicesProvider
						                getCollections.
					 collections do: [ :c | list addAll: c collectibles ].
					 self openPricesStat: list ]).

	"Fullset menu"
	fullsetMenu := ToMenu new.
	fullsetMenu label: (ToLabel new text: 'Fullsets').
	fullsetMenu icon: (ToImage new innerImage: (self iconNamed: #box)).
	fileMenu addItem: fullsetMenu.
	fullsetMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Fullset stats : Nintendo 64 PAL FRA');
			 icon: (ToImage new innerImage: (self iconNamed: #box));
			 clickAction: [
				 self openFullsetStat:
						 CollectableVideoGameFullset nintendo64_PAL_FRA ]).
	fullsetMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Fullset stats : Wii U PAL FRA');
			 icon: (ToImage new innerImage: (self iconNamed: #box));
			 clickAction: [
				 self openFullsetStat:
						 CollectableVideoGameFullset nintendoWiiU_PAL_FRA ]).
	fullsetMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Fullset stats : Pokemon mini PLA FRA');
			 icon: (ToImage new innerImage: (self iconNamed: #box));
			 clickAction: [
					 self openFullsetStat:
							 CollectableVideoGameFullset nintendoPokemonMini_PAL_FRA ]).
	fullsetMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Fullset stats : Pokemon games PAL FRA');
			 icon: (ToImage new innerImage: (self iconNamed: #box));
			 clickAction: [
					 self openFullsetStat:
							 CollectableVideoGameFullset allPokemonLicenceGame_PAL_FRA ]).

	"Load menu"
	loadCollectionMenu := ToMenu new.
	loadCollectionMenu label: (ToLabel new text: 'Load collection').
	loadCollectionMenu icon:
		(ToImage new innerImage: (self iconNamed: #down)).
	fileMenu addItem: loadCollectionMenu.
	loadCollectionMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Import GAMEYE.app Spreadsheet');
			 icon: (ToImage new innerImage: (self iconNamed: #box));
			 clickAction: [ self importGameyeSpreadsheetCollection ]).

	"Query menu"
	queryMenu := ToMenu new.
	queryMenu id: #query.
	queryMenu layout cellSpacing: 5.
	queryMenu label: (ToLabel new text: 'Query').
	queryMenu icon: (ToImage new innerImage: (self iconNamed: #question)).
	menuBar addItem: queryMenu.

	"Query buttons"
	searchNoCountryCollectibles := ToMenuItem new
		                               label:
			                               (ToLabel new text: 'Without country');
		                               clickAction: [
			                               self searchAction: [ :e |
					                               e country isNil ] ].
	queryMenu addItem: searchNoCountryCollectibles.

	searchCollectibles := ToMenuItem new
		                      label: (ToLabel new text: 'Added last month');
		                      clickAction: [
				                      self searchAction: [ :e |
						                      e dateAdded month
						                      = Date today month previous ] ].
	queryMenu addItem: searchCollectibles.

	searchCollectibles := ToMenuItem new
		                      label: (ToLabel new text: 'Added this month');
		                      clickAction: [
			                      self searchAction: [ :e |
					                      e dateAdded month = Date today month ] ].
	queryMenu addItem: searchCollectibles.

	"Query N64 menu"
	queryN64Menu := ToMenu new.
	queryN64Menu label: (ToLabel new text: 'Nintendo 64').
	queryN64Menu icon: (ToImage new innerImage: (self iconNamed: #box)).
	queryMenu addItem: queryN64Menu.
	queryN64Menu addItem: (searchCollectibles := ToMenuItem new
			                       label:
				                       (ToLabel new text: 'Added this month');
			                       clickAction: [
					                       self searchAction: [ :e |
								                       e isVideoGame and: [
											                       e dateAdded month = Date today month
												                       and: [ e platform = 'Nintendo 64' ] ] ] ]).
	queryN64Menu addItem: (searchCollectibles := ToMenuItem new
			                       label:
				                       (ToLabel new text: 'Added last month');
			                       clickAction: [
					                       self searchAction: [ :e |
								                       e isVideoGame and: [
											                       e dateAdded month
											                       = Date today month previous and: [
													                       e platform = 'Nintendo 64' ] ] ] ]).

	"Query WiiU menu"
	queryWiiUMenu := ToMenu new.
	queryWiiUMenu label: (ToLabel new text: 'Nintendo Wii U').
	queryWiiUMenu icon: (ToImage new innerImage: (self iconNamed: #box)).
	queryMenu addItem: queryWiiUMenu.
	queryWiiUMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Added this month');
			 clickAction: [
					 self searchAction: [ :e |
								 e isVideoGame and: [
											 e dateAdded month = Date today month and: [
													 e platform = 'Nintendo Wii U' ] ] ] ]).
	queryWiiUMenu addItem: (ToMenuItem new
			 label: (ToLabel new text: 'Added last month');
			 clickAction: [
					 self searchAction: [ :e |
								 e isVideoGame and: [
											 e dateAdded month = Date today month previous and: [
													 e platform = 'Nintendo Wii U' ] ] ] ]).

	"Order menu"
	orderMenu := ToMenu new.
	orderMenu id: #query.
	orderMenu layout cellSpacing: 5.
	orderMenu label: (ToLabel new text: 'Order by').
	orderMenu icon:
		(ToImage new innerImage: (self iconNamed: #changeSorter)).
	menuBar addItem: orderMenu.

	"Order buttons"
	orderByAlphaIncrease := ToMenuItem new
		                        label: (ToLabel new text: 'Name');
		                        iconImage: (self iconNamed: #arrowDown);
		                        clickAction: [
			                        self orderAction: [ :a :b |
					                        a name < b name ] ].
	orderMenu addItem: orderByAlphaIncrease.

	orderByAlphaDecrease := ToMenuItem new
		                        label: (ToLabel new text: 'Name');
		                        iconImage: (self iconNamed: #arrowUp);
		                        clickAction: [
			                        self orderAction: [ :a :b |
					                        a name > b name ] ].
	orderMenu addItem: orderByAlphaDecrease.

	orderByAddedDateIncrease := ToMenuItem new
		                            label: (ToLabel new text: 'Added date');
		                            iconImage: (self iconNamed: #arrowDown);
		                            clickAction: [
			                            self orderAction: [ :a :b |
					                            a dateAdded < b dateAdded ] ].
	orderMenu addItem: orderByAddedDateIncrease.

	orderByAddedDateDecrease := ToMenuItem new
		                            label: (ToLabel new text: 'Added date');
		                            iconImage: (self iconNamed: #arrowUp);
		                            clickAction: [
			                            self orderAction: [ :a :b |
					                            a dateAdded > b dateAdded ] ].
	orderMenu addItem: orderByAddedDateDecrease.

	"Debug menu"
	debugMenu := ToMenu new.
	debugMenu id: #debug.
	debugMenu layout cellSpacing: 5.
	debugMenu label: (ToLabel new text: 'Debug').
	debugMenu icon: (ToImage new innerImage: (self iconNamed: #repair)).
	menuBar addItem: debugMenu.

	"Open on pyramid button"
	openOnPyramid := ToMenuItem new
		                 label: (ToLabel new text: 'Open in Pyramid');
		                 icon:
			                 (ToImage new innerImage: (self iconNamed: #edit));
		                 clickAction: [ space editWithPyramid ].
	debugMenu addItem: openOnPyramid.

	menuBar addFiller.

	^ menuBar
]

{ #category : 'private' }
CollectableAppImpl >> buildSearchWidget [

	| searchPane searchButton |
	
	searchPane := (ToPane id: #search) beHorizontal; hFitContent.
	
	searchField := ToTextField new
		withoutLineBreak;
		hMatchParent; 
		width: 200; 
		placeholderText: 'Search...';
		tooltipString: 'Type anything here and press Enter to search something';
		addEditorShortcut: (BlShortcutWithAction new
             combination: BlKeyCombination return;
             action: [ :event | self searchAction ]
             yourself).
	searchPane addChild: searchField.
	
	searchButton := ToButton new hMatchParent; width: 50; labelText: 'Search'.
	searchButton clickAction:[ self searchAction ].
	searchPane addChild: searchButton.
	
	^ searchPane
]

{ #category : 'private' }
CollectableAppImpl >> buildStatsWidgets [

	| label label2 |
	
	statsPane := (ToPane id: #statsPane) beVertical; hFitContent.
	
	"Statistics to display into labels"
	label := ToLabel id: #stats1.
	statsPane addChild: label.
		
	label2 := ToLabel id: #stats2.
	statsPane addChild: label2.
		
	^ statsPane
]

{ #category : 'releasing' }
CollectableAppImpl >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : 'events' }
CollectableAppImpl >> collectionsHasChanged: aCollectionList [

	| collectibles |
	collectibles := OrderedCollection new.
	aCollectionList do:[ :c | collectibles addAll: c collectibles ].
	self populateCollectibleListWith: collectibles.
]

{ #category : 'life cycle' }
CollectableAppImpl >> componentActivate [

	self getCollectableCollectionsManagerEventsSubscriber subscribe: self.
 
	self openSpace.
	self openDefaultCollections.
]

{ #category : 'life cycle' }
CollectableAppImpl >> componentInitialize [ 

	CollectablePricesStatView deploy.
	CollectableVideoGameFullsetStatView deploy.
	
	self startOSProjectManager.
	self startCollectionsManager.

	self forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	self forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 

	self initializeMainPane.
]

{ #category : 'life cycle' }
CollectableAppImpl >> componentPassivate [
	
	self getCollectableCollectionsManagerEventsSubscriber unsubscribe: self.

	self closeSpace.
	
]

{ #category : 'life cycle' }
CollectableAppImpl >> componentRemove [ 

	self stopCollectionsManager.
	self stopOSProjectManager
]

{ #category : 'component accessing' }
CollectableAppImpl >> getCollectOSProjectManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectOSProjectManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectOSProjectManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : 'component accessing' }
CollectableAppImpl >> getCollectableCollectionsManagerEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := CollectableCollectionsManagerEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: CollectableCollectionsManagerEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : 'component accessing' }
CollectableAppImpl >> getCollectableCollectionsManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectableCollectionsManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectableCollectionsManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : 'actions' }
CollectableAppImpl >> importAndBrowseOwnedGameyeSpreadsheetCollections [

	| fileReference collectionList |
	
	fileReference := self getCollectOSProjectManagerServicesProvider openFileReference: 'GAMEYE.app Spreadsheet' onDirectory: FileSystem workingDirectory extensions: #('csv').	
	(fileReference isNil or:[fileReference isEmpty]) ifTrue:[ ^ nil ].
	
	collectionList := CollecGameyeUtils importCollectionsFromGameyeSpreadsheetFile: fileReference asFileReference type: GameyeCollection owned.
	collectionList ifEmpty:[ ^ self ].
	
	^ collectionList
]

{ #category : 'actions' }
CollectableAppImpl >> importGameyeSpreadsheetCollection [

	| collec |
	collec := self importAndBrowseOwnedGameyeSpreadsheetCollections.
	collec ifNil:[ ^ nil ].
	
	self getCollectableCollectionsManagerServicesProvider setCollections: collec
]

{ #category : 'initialization' }
CollectableAppImpl >> initializeMainPane [

	| menu title menuPane searchWidget statsWidget |
	mainPane := ToPane new beVertical.
	mainPane matchParent.
	
	"Menu"
	menuPane := ToPane new beHorizontal; hFitContent.
	mainPane addChild: menuPane.
	
	menu := self buildMenu.
	menuPane addChild: menu.
	searchWidget := self buildSearchWidget.
	menuPane addChild: searchWidget.
	statsWidget := self buildStatsWidgets.
	menuPane addChild: statsWidget.
	
	"Title"
	title := ToLabel text: ('Collectibles').
	title id: #title.
	mainPane addChild: title.
	
	"List"
	collectibleList := self buildList.
	mainPane addChild: collectibleList
]

{ #category : 'actions' }
CollectableAppImpl >> openDefaultCollections [

	self getCollectableCollectionsManagerServicesProvider
		setCollections: CollectableUserdatas default collections
]

{ #category : 'actions' }
CollectableAppImpl >> openFullsetStat: aFullset [

	| component name |
	aFullset ifNil:[ ^ self ].
	name := MolUtils randomizeComponentName.
	component := CollectableVideoGameFullsetStatView instantiate: name.
	component forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	component forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 
	CollectableVideoGameFullsetStatView activate: name.
	
	component setFullset: aFullset.
	component openInWindow
]

{ #category : 'actions' }
CollectableAppImpl >> openPricesStat: aCollectibleList [

	| component name |
	aCollectibleList ifNil:[ ^ self ].

	name := MolUtils randomizeComponentName.
	component := CollectablePricesStatView deploy.
	
	component := CollectablePricesStatView instantiate: name.
	component forServices: CollectableCollectionsManagerServices useProvider: self componentName. 
	component forEvents: CollectableCollectionsManagerEvents useProducer: self componentName. 
	CollectablePricesStatView activate: name.
	
	component setCollection: (CollectibleCollection new addCollectibles: aCollectibleList).
	component openInWindow
]

{ #category : 'initialization' }
CollectableAppImpl >> openSpace [

	space ifNotNil: [ ^ self ].
	space := mainPane openInSpace.

	"setup space properties"
	self updateContent.
	space position: 100 @ 100.

	"initialize event handlers"
	space addEventHandler: (BlEventHandler
			 on: BlSpaceClosedEvent
			 do: [ :e | self receiveBlSpaceClosedEvent: e ]).
	^ space
]

{ #category : 'actions' }
CollectableAppImpl >> orderAction: aSortBlockClosure [

	| list |
	aSortBlockClosure ifNil: [ ^ self ].

	list := collectibleList dataAccessor asArray asOrderedCollection.
	list ifEmpty: [ ^ self ].

	list sort: aSortBlockClosure.

	self populateCollectibleListWith: list
]

{ #category : 'actions' }
CollectableAppImpl >> populateCollectibleListWith: aCollectibleList [

	collectibleList dataAccessor removeAll.
	self updateContent.

	aCollectibleList ifNil: [ ^ self ].
	aCollectibleList ifEmpty: [ ^ self ].

	collectibleList dataAccessor addAll: aCollectibleList.
	self updateContent
]

{ #category : 'events' }
CollectableAppImpl >> receiveBlSpaceClosedEvent: anEvent [
	"The closed event can be send after that the component is stop, because it can be have a ghost window, we need to cheeck if the component is really stopped or not"

	(MolUtils
		 isInstantiateComponentOf: self class
		 named: self componentName) ifTrue: [
		self class stop: self componentName ]
]

{ #category : 'actions' }
CollectableAppImpl >> searchAction [

	| searchExpression |
	searchExpression := (searchField text asString).
	(searchExpression isNil or:[searchExpression isEmpty]) ifTrue:[ self searchAction: nil ].

	self searchAction: [ :e | 
		(('*', searchExpression, '*') match: e name) or:[
			(('*', searchExpression, '*') match: e platform name)
		]
	].
]

{ #category : 'actions' }
CollectableAppImpl >> searchAction: aSelectBlockClosure [

	"get the content of the field and do the search"
	| collectibles collections |
	collections := self getCollectableCollectionsManagerServicesProvider getCollections.
	collectibles := OrderedCollection new.
	collections do:[ :c | collectibles addAll: c collectibles ].
	
	collectibles size = 0 ifTrue:[ ^ self ].

	aSelectBlockClosure ifNil:[ self populateCollectibleListWith: collectibles. ^ self ].
	
	collectibles := collectibles select: aSelectBlockClosure.
	self populateCollectibleListWith: collectibles.
]

{ #category : 'initialization' }
CollectableAppImpl >> startCollectionsManager [

	CollectableCollectionsManagerImpl start: self componentName
]

{ #category : 'initialization' }
CollectableAppImpl >> startOSProjectManager [

	"Start only if this component is the first instance"
	| apps |
	apps := MolUtils allComponentInstancesOfType: CollectableApp.
	apps size > 1 ifTrue:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager start ].
	^ CollectOSPharoManager start
]

{ #category : 'releasing' }
CollectableAppImpl >> stopCollectionsManager [

	CollectableCollectionsManagerImpl stop: self componentName
]

{ #category : 'releasing' }
CollectableAppImpl >> stopOSProjectManager [
	| apps |
	
	"Stop only if this component is the last instance"
	apps := MolUtils allComponentInstancesOfType: CollectableApp.
	(apps size = 1 and:[apps first = self]) ifFalse:[ ^ self ].

	Smalltalk os isWindows ifTrue:[ ^ CollectOSWindowsManager stop ].
	^ CollectOSPharoManager stop
]

{ #category : 'private' }
CollectableAppImpl >> updateContent [

	self updateTitle.
	self updateStats.
]

{ #category : 'private' }
CollectableAppImpl >> updateStats [

	| nb cost value nbNotEstimated text1 text2 diff |
	"Stats: cost / value""Stats: (+/- diff)"
	cost := 0.
	value := 0.
	nbNotEstimated := 0.
	collectibleList dataAccessor do: [ :e |
		cost := cost + e pricePaid.
		e monetaryValue = 0 ifTrue: [ nbNotEstimated := nbNotEstimated + 1 ].
		value := value + e monetaryValue ].

	diff := (value - cost) rounded.
	diff < 0
		ifTrue: [ diff := diff printString ]
		ifFalse: [ diff := '+' , diff printString ].
	cost := cost rounded printString.
	value := value rounded printString.

	text1 := cost , '€ paid / ' , value , '€ estimated value (' , diff
	         , '€)'.
	text2 := nbNotEstimated printString , ' not estimated'.

	(statsPane childWithId: #stats1) text: (text1 asRopedText
			 foreground: Color black;
			 fontSize: 14).
	(statsPane childWithId: #stats2) text: (text2 asRopedText
			 foreground: Color black;
			 fontSize: 14)
]

{ #category : 'private' }
CollectableAppImpl >> updateTitle [

	| nb title |
	title := self class windowTitleHead.

	nb := collectibleList dataAccessor size.
	nb > 0 ifTrue: [
		title := title , ' - ' , nb asString , ' collectible(s)' ].

	space title: title
]
